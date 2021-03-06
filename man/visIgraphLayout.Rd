% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/visIgraphLayout.R
\name{visIgraphLayout}
\alias{visIgraphLayout}
\title{Use a igraph layout for compute coordinates & fast rendering}
\usage{
visIgraphLayout(graph, layout = "layout_nicely", type = "square",
  physics = FALSE, smooth = FALSE)
}
\arguments{
\item{graph}{: a visNetwork object}

\item{layout}{: Character Name of igraph layout function to use. Default to "layout_nicely"}

\item{type}{: Character Type of scale from igrah to vis.js. "square" (defaut) render in a square limit by height. "full" use width and height to scale in a rectangle.}

\item{physics}{: Boolean. Default to FALSE. Enabled physics on nodes ?}

\item{smooth}{: Boolean. Default to FALSE. Use smooth edges ?}
}
\description{
Use a igraph layout for compute coordinates and fast rendering.
This function affect x and y coordinates to nodes data.frame using a igraph layout,
and then render network faster with no stabilization.
We set some options as : visNodes(physics = FALSE) &
visEdges(smooth = FALSE) & visPhysics(stabilization= FALSE), but you can overwrite
them using arguments or by add another call after visIgraphLayout
}
\examples{
nnodes <- 200
nnedges <- 400

nodes <- data.frame(id = 1:nnodes)
edges <- data.frame(from = sample(1:nnodes, nnedges, replace = T),
                   to = sample(1:nnodes, nnedges, replace = T))

# with defaut layout
visNetwork(nodes, edges) \%>\%
 visIgraphLayout() \%>\%
 visNodes(size = 10)

# use full space
visNetwork(nodes, edges) \%>\%
 visIgraphLayout(type = "full") \%>\%
 visNodes(size = 10)

# in circle ?
visNetwork(nodes, edges) \%>\%
 visIgraphLayout(layout = "layout_in_circle") \%>\%
 visNodes(size = 10) \%>\%
 visOptions(highlightNearest = T, nodesIdSelection = T)

# keep physics with smooth curves ?
visNetwork(nodes, edges) \%>\%
 visIgraphLayout(physics = TRUE, smooth = TRUE) \%>\%
 visNodes(size = 10)
}
\seealso{
\link{visNodes} for nodes options, \link{visEdges} for edges options, \link{visGroups} for groups options,
\link{visLegend} for adding legend, \link{visOptions} for custom option, \link{visLayout} & \link{visHierarchicalLayout} for layout,
\link{visPhysics} for control physics, \link{visInteraction} for interaction, \link{visNetworkProxy} & \link{visFocus} & \link{visFit} for animation within shiny,
\link{visDocumentation}, \link{visEvents}, \link{visConfigure} ...
}

