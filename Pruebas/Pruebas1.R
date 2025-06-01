library(visNetwork)

nodes <- read.csv("Nodes.csv", fileEncoding = "latin1", sep = ";", header = TRUE)
edges <- read.csv("edges.csv", sep = ";", header = TRUE)

nodes$área <- as.factor(nodes$área)
nodes$bloque <- as.factor(nodes$bloque)

area_colores <- rainbow(length(levels(nodes$área)))
names(area_colores) <- levels(nodes$área)

nodes$color <- area_colores[nodes$área]
nodes$value <- nodes$creditos  
nodes$shape <- ifelse(nodes$bloque == "1", "ellipse",
                      ifelse(nodes$bloque == "2", "box",
                             ifelse(nodes$bloque == "3", "triangle", "dot")))

# Visualizar el grafo
visNetwork(nodes, edges) %>%
  visOptions(highlightNearest = TRUE, nodesIdSelection = TRUE)
    
