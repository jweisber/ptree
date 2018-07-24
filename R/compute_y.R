#' A Descendent y-coordinate Computer
#'
#' Compute the y-coordinates for all descendents of the present node
#' @param nodes
#' @keywords y, coordinate, descendent
#' @export
#' @examples
#' place_descendents(nodes, 3, .5, 0)

place_descendents <- function(nodes, parent_id, top, bottom) {

  child_ids <- nodes$id[nodes$parent == parent_id]
  n_children <- length(child_ids)

  if (n_children < 1) {
    return(nodes$y)
  }

  height <- (top - bottom) / n_children

  i <- 1
  for (id in child_ids) {
    nodes$y[nodes$id == id] <- bottom + i * height - (height / 2)
    i_top <- bottom + i * height
    i_bottom <- bottom + i * height - height
    nodes$y <- place_descendents(nodes, id, i_top, i_bottom)
    i <- i + 1
  }

  return(nodes$y)
}

#' A y-coordinate Computer
#'
#' Compute each node's y-coordinate
#' @param nodes
#' @keywords y, coordinate
#' @export
#' @examples
#' compute_y(nodes)

compute_y <- function(nodes) {
  nodes$y <- NA
  place_descendents(nodes, parent_id = 0, top = 1, bottom = 0)
}
