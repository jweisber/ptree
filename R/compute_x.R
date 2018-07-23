#' An x-coordinate Computer
#'
#' Compute each node's x-coordinate
#' @param nodes
#' @keywords x, coordinate
#' @export
#' @examples
#' compute_x(nodes)

compute_x <- function(nodes) {
  n_tiers <- max(nodes$tier)
  nodes$tier / n_tiers
}