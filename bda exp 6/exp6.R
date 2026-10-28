library(igraph)

friendships <- data.frame(
  from = c("A", "A", "B", "C", "D", "D", "E"),
  to   = c("B", "C", "C", "D", "E", "F", "F")
)
print(friendships)

social_network <- graph_from_data_frame(friendships, directed = FALSE)
print(social_network)

set.seed(10)
network_layout <- layout_with_fr(social_network)

plot(
  social_network,
  layout = network_layout,
  vertex.color = "skyblue",
  vertex.size = 35,
  vertex.label.color = "black",
  vertex.label.cex = 1.2,
  edge.color = "gray",
  edge.width = 2,
  main = "Student Friendship Network"
)

node_degree <- degree(social_network)
print(node_degree)

communities <- cluster_louvain(social_network)
print(communities)

community_membership <- membership(communities)
print(community_membership)

community_colors <- c("tomato", "skyblue")[community_membership]

plot(
  social_network,
  layout = network_layout,
  vertex.color = community_colors,
  vertex.size = 35,
  vertex.label.color = "black",
  vertex.label.cex = 1.2,
  edge.color = "gray",
  edge.width = 2,
  main = "Communities Detected Using Louvain Algorithm"
)

legend(
  "topleft",
  legend = c("Community 1", "Community 2"),
  pch = 21,
  pt.bg = c("tomato", "skyblue"),
  pt.cex = 2,
  bty = "n"
)

cat("Number of communities:", length(communities), "\n")
cat("Modularity score:", modularity(communities), "\n")