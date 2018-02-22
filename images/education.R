
library('igraph')

##############
## Generate an `ellipse` node type as per
##  https://stackoverflow.com/a/48469289/2232265

## Function for plotting an elliptical node
myellipse <- function(coords, v=NULL, params) {
    vertex.color <- params("vertex", "color")
    if (length(vertex.color) != 1 && !is.null(v)) {
        vertex.color <- vertex.color[v]
    }
    vertex.size <- 1/30 * params("vertex", "size")
    if (length(vertex.size) != 1 && !is.null(v)) {
        vertex.size <- vertex.size[v]
    }
    
    draw.ellipse(x=coords[,1], y=coords[,2],
                 a = vertex.size, b=vertex.size/2, col=vertex.color)
}

## Register the shape with igraph
add_shape("ellipse", clip=shapes("circle")$clip,
          plot=myellipse)


##################################
### Set up plot container
pdfheight = 2.1
pdf("~/mycloud/career/self_promotion/images/education.pdf",
    height = pdfheight, width = pdfheight*2)
par(mar = c(3,0,3,0), xpd = TRUE)
nodes =      c('Education',  'Skill',    'Looks', 'Income')
x = 1.7*(c(0, 10, 10, 20) - 7)
y = 2*(c(4, 9, 0, 4) - 2)
bias_color = 'darkgoldenrod3'
n_edges = length(from)
NodeList = data.frame(nodes, x ,y)
EdgeList = data.frame(
    from = c('Education', 'Education', 'Looks',  'Education', 'Skill'), 
    to = c(  'Income',    'Looks',     'Income', 'Skill',     'Income')
)
xgraph = graph_from_data_frame(vertices = NodeList, 
                               d = EdgeList, directed = TRUE)
E(xgraph)$color = c(bias_color,'gray', 'gray',   'gray',      'gray')
V(xgraph)$color = c('gray', "lightblue", 'gray',  'gray')
plot(xgraph, vertex.shape = 'ellipse',
     vertex.size = 35*c(4, 3, 3, 3),
     xlim = c(0, 10),
     ylim = c(0, 10),
     edge.arrow.mode=c(0, 2, 2, 2, 2),
     edge.arrow.size = 1.5*c(1,1,1,1,1),
     edge.width = c(3, 1, 1, 1, 1),
     rescale = FALSE) 
text(x = 5, y = 5.5, labels = 'self selection', col = bias_color)
dev.off()