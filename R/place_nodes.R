#' A Label Placer
#'
#' Compute the x- and y-coordinate for each label
#' @param nodes
#' @keywords x, y, coordinate
#' @export
#' @examples
#' place_nodes(nodes)

place_nodes <- function(nodes) {
  nodes$x    <- compute_x(nodes)
  nodes$y    <- compute_y(nodes)
  return(nodes)
}
