
library('igraph')
NodeList = data.frame('AA', x = 1 ,y = 1)
EdgeList = data.frame(from = 'AA', to = 'AA')
xgraph = graph_from_data_frame(vertices = NodeList, 
                               d = EdgeList, directed = TRUE)
plot(xgraph, vertex.shape = 'circle',
     vertex.size = 100, rescale = FALSE)
