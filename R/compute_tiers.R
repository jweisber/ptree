#' A Tier Computer
#'
#' Compute each node's tier
#' @param nodes
#' @keywords tier
#' @export
#' @examples
#' compute_tiers(nodes)

compute_tiers <- function(nodes) {
  nodes$tier <- NA
  nodes[nodes$parent == 0, ]$tier <- 1
  
  while(sum(is.na(nodes$tier)) > 0) {
    t <- max(nodes$tier, na.rm = TRUE) # highest tier so far
    tier_t_nodes <- nodes$id[nodes$tier == t]
    tier_t_nodes <- tier_t_nodes[!is.na(tier_t_nodes)] # ids of nodes with tier t
    nodes$tier[nodes$parent %in% tier_t_nodes] <- t + 1 # set children of t with t+1
  }
  
  return(nodes$tier)
}