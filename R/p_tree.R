#' A Tree Planner & Plotter
#'
#' Lay out a probability tree, then draw it using ggplot2
#' @param nodes
#' @param padding
#' @param leaf_p_fontface
#' @keywords compute, draw, tree
#' @export
#' @examples
#' p_tree(nodes)

p_tree <- function(nodes, round = 2, y_nudge = .025, aspect_ratio = 1.2, padding = unit(.75, "lines"), leaf_p_fontface = "bold") {

  nodes <- compute_tree(nodes, round = round, y_nudge = y_nudge, aspect_ratio = aspect_ratio)
  draw_tree(nodes, padding = padding, leaf_p_fontface = leaf_p_fontface)
}
