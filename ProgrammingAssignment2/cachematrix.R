##  Creating a pair of functions that calculate and
##  cache the inverse of a matrix

## This function creates a special matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) 
  {
    m <- NULL
    set <- function(y) 
    {
      x<<-y
      m<<-NULL
    }
    get <- function() x
    setinverse<- function(solve) m <<-solve
    getinverse <- function() m
    list(set = set, get = get,
        setinverse = setinverse,
        getinverse = getinverse)
  }


##This function calculates the inverse of the matrix
##returned by makeCacheMatrix() function above and,
##if the inverse has already been calculated for the 
##same matrix, then it is retrieved from the cache

cacheSolve <- function(x, ...) 
  {
    m <- x$getinverse()
    if(!is.null(m)) 
      {
        message("getting cached data")
        return(m)
      }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
  ## Returns a matrix that is the inverse of 'x'
  }
