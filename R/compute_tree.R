#' A Tree Computer
#'
#' Compute all information (coordinates, angles) needed to draw a tree in a plotting package, e.g. ggplot2
#' @param nodes
#' @keywords x, y, angle, segment, line segment
#' @export
#' @examples
#' compute_tree(nodes, 2, .05, 1.4)

compute_tree <- function(nodes, round = 2, y_nudge = .025, aspect_ratio = 1.2) {

  if ( !("id" %in% colnames(nodes)) ) {
    nodes$id <- 1:nrow(nodes)
  } else {
    nodes <- nodes[order(nodes$id), ]
  }

  if (round & ("p" %in% colnames(nodes))) {
    nodes$p <- round(nodes$p, round)
  }

  nodes$tier <- compute_tiers(nodes)

  nodes <- place_nodes(nodes)

  nodes <- place_segments(nodes)

  if (("p" %in% colnames(nodes))) {
    nodes <- place_labels(nodes, y_nudge, aspect_ratio)
  }

  nodes <- flip_vertical(nodes, y_nudge)

  return(nodes)
}
