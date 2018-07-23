#' A Tree Computer
#'
#' Compute all information (coordinates, angles) needed to draw a tree in a plotting package, e.g. ggplot2
#' @param nodes
#' @keywords x, y, angle, segment, line segment
#' @export
#' @examples
#' compute_tree(nodes, 2, .05, 1.4)

compute_tree <- function(nodes, round = 2, ynudge = .025, aspect_ratio = 1.2) {
  if (round) {
    nodes$p <- round(nodes$p, round)
  }

  nodes <- place_nodes(nodes)
  nodes <- place_segments(nodes)
  nodes <- place_labels(nodes, ynudge, aspect_ratio)

  return(nodes)
}
