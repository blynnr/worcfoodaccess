### chunks for ownership troubleshooting #######################

### learning st_cast

# example fail ################################################
library(sf)
pts <- st_multipoint(matrix(c(10, 10, 15, 20, 30, 30), nrow = 3, byrow = TRUE), dim = "XY")
lines <- st_cast(pts, "MULTILINESTRING")

# good example??... ###########################################
# Load library
library(sf)

# Create points data
multipoints <- st_multipoint(matrix(c(10, 10, 15, 20, 15, 25, 30, 30), nrow = 4, byrow = TRUE), dim = "XY")
points <- st_cast(st_geometry(multipoints), "POINT")

# Number of total linestrings to be created - half of the number of points
n <- length(points) / 2

# Build linestrings
linestrings <- lapply(X = 1:n, FUN = function(x) { # n would be updated with lenght/2 value

  pair <- st_combine(c(points[x], points[x + 1])) # update indexing depending on how you organize pairs
  line <- st_cast(pair, "LINESTRING")
  return(line)

})

# One MULTILINESTRING object with all the LINESTRINGS
#multilinetring <- st_multilinestring(do.call("rbind", linestrings))

# Plot
plot(multipoints, pch = 19, cex = 2)
# plot(multilinetring[[1]], col = "orange", lwd = 2, add = TRUE)
# plot(multilinetring[[2]], col = "green", lwd = 2, add = TRUE)
plot(linestrings[[1]], col = "orange", lwd = 2, add = TRUE)
plot(linestrings[[2]], col = "green", lwd = 2, add = TRUE)



# tweaks on good example to make it better example #########
# need to go back to geospaar modules and remember how to make matrix
# need a matrix organized by MAP_PAR_ID containing coordinates so you
# can build anonymous function from there

# Load library
library(sf)
# Create points data
multipoints <- st_multipoint(matrix(c(10, 10, 15, 20, 15, 25, 30, 30), nrow = 4, byrow = TRUE), dim = "XY")
points <- st_cast(st_geometry(multipoints), "POINT")
# Number of total linestrings to be created - half of the number of points
n <- length(points) / 2
linestrings <- lapply(x = 1:n, FUN = function(x) {
  st_combine(c(x))
}) # error argument "FUN" is missing

multilinetring  <- list()
multilinetring[[1]] <- st_combine(c(points[1], points[2])) %>%
  st_cast(., "LINESTRING")
multilinetring[[2]] <- st_combine(c(points[3], points[4])) %>%
  st_cast(., "LINESTRING")
# Build linestrings
# linestrings <- lapply(X = 1:n, FUN = function(x) { # n would be updated with lenght/2 value
#
#   pair <- st_combine(c(points[x], points[x + 1])) # update indexing depending on how you organize pairs
#   line <- st_cast(pair, "LINESTRING")
#   return(line)

# Plot
plot(multipoints, pch = 19, cex = 2)
plot(multilinetring[[1]], col = "orange", lwd = 2, add = TRUE)
plot(multilinetring[[2]], col = "green", lwd = 2, add = TRUE)
# plot(linestrings[[1]], col = "orange", lwd = 2, add = TRUE)
# plot(linestrings[[2]], col = "green", lwd = 2, add = TRUE)



### code from rladies #######################################

# Load library
library(sf)
# Create points data
multipoints <- st_multipoint(matrix(c(10, 10, 15, 20, 15, 25, 30, 30), nrow = 4, byrow = TRUE), dim = "XY")
points <- st_cast(st_geometry(multipoints), "POINT")
# Number of total linestrings to be created - half of the number of points
n <- length(points) / 2
multilinetring  <- list()
multilinetring[[1]] <- st_combine(c(points[1], points[2])) %>%
  st_cast(., "LINESTRING")
multilinetring[[2]] <- st_combine(c(points[3], points[4])) %>%
  st_cast(., "LINESTRING")
# Build linestrings
# linestrings <- lapply(X = 1:n, FUN = function(x) { # n would be updated with lenght/2 value
#
#   pair <- st_combine(c(points[x], points[x + 1])) # update indexing depending on how you organize pairs
#   line <- st_cast(pair, "LINESTRING")
#   return(line)
#
# })
# One MULTILINESTRING object with all the LINESTRINGS
#multilinetring <- st_multilinestring(do.call("rbind", linestrings))
# Plot
plot(multipoints, pch = 19, cex = 2)
plot(multilinetring[[1]], col = "orange", lwd = 2, add = TRUE)
plot(multilinetring[[2]], col = "green", lwd = 2, add = TRUE)
# plot(linestrings[[1]], col = "orange", lwd = 2, add = TRUE)
# plot(linestrings[[2]], col = "green", lwd = 2, add = TRUE)





