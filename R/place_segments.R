#' A Segment Placer
#'
#' Compute the x, y, xend, and yend for each line segment connecting labels in the tree
#' @param nodes
#' @keywords x, y, xend, yend, coordinate, segment, line segment
#' @export
#' @examples
#' place_segments(nodes)

place_segments <- function(nodes) {
  nodes$xend <- NA
  nodes$yend <- NA
  nodes$xend[nodes$parent > 0] <- nodes$x[nodes$parent]
  nodes$yend[nodes$parent > 0] <- nodes$y[nodes$parent]
  nodes$xend[nodes$parent == 0] <- 0
  nodes$yend[nodes$parent == 0] <- 1/2
  
  return(nodes)
}