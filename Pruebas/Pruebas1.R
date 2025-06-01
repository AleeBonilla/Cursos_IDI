
library(visNetwork)

nodes <- read.csv("Nodos y enlaces/nodes.csv", fileEncoding = "latin1", sep = ";", header = TRUE) 

edges <- read.csv("Nodos y enlaces/edges.csv", sep = ";", header = TRUE)

visNetwork(nodes, edges)