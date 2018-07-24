place_leaf_ps <- function(nodes, leaf_p_distance = .1) {
  nodes$leaf_p_x <- nodes$x + leaf_p_distance
  nodes$leaf_p_y <- nodes$y

  return(nodes)
}
