library(visNetwork)

nodes <- read.csv("Nodos y enlaces/nodes.csv", fileEncoding = "latin1", sep = ";", header = TRUE) 
edges <- read.csv("Nodos y enlaces/edges.csv", sep = ";", header = TRUE)

nodes$área <- as.factor(nodes$área)
nodes$bloque <- as.factor(nodes$bloque)

area_colores <- rainbow(length(levels(nodes$área)))
names(area_colores) <- levels(nodes$área)

nodes$color <- area_colores[nodes$área]

nodes$value <- nodes$créditos * 3

nodes$shape <- ifelse(nodes$bloque == "0", "dot",
                ifelse(nodes$bloque == "1", "dot",
                ifelse(nodes$bloque == "2", "dot",
                ifelse(nodes$bloque == "3", "dot",
                ifelse(nodes$bloque == "4", "square",
                ifelse(nodes$bloque == "5", "triangle",
                ifelse(nodes$bloque == "6", "box",
                ifelse(nodes$bloque == "7", "triangleDown",
                ifelse(nodes$bloque == "8", "hexagon",
                ifelse(nodes$bloque == "9", "diamond",
                ifelse(nodes$bloque == "10", "ellipse", "dot")))))))))))

visNetwork(nodes, edges) %>%
  visOptions(
    highlightNearest = TRUE,
    nodesIdSelection = TRUE,
    selectedBy = list(variable = "área", multiple = TRUE)
  ) %>%
  visPhysics(
    solver = "forceAtlas2Based",
    forceAtlas2Based = list(gravitationalConstant = -100)
  ) %>%
  visInteraction(navigationButtons = TRUE)
