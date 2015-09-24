## These functions cache the inverse of a matrix, and recall the cache or calculate it

## This is where we take a matrix and find and cache it's inverse using the solve() function

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
set <- function(y) {
  x <<- y
  m <<- NULL
}
get <- function() x
setinverse <- function(solve) m <<- solve
getinverse <- function() m
list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## This function also finds the inverse of a matrix, using an if statement to determine if a cached
## value for inverse exists and if so utilizes this value skipping actual calculations, and if not,
## will calculate the inverse using the solve() function.

cacheSolve <- function(x, ...) {
m <- x$getinverse()
if(!is.null(m)) {
  message("getting cached data")
  return(m)
}
data <- x$get()
m <- solve(data, ...)
x$setinverse(m)
m
}
