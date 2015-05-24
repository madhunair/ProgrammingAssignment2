## makeCacheMatrix is a function that returns a list of functions 
## It storeS a martix and a cached value of the inverse of the  
## matrix. Contains the following functions: 
## setMatrix      set the value of a matrix 
## getMatrix      get the value of a matrix 
## cacheInverse   get the cahced value (inverse of the matrix) 
## getInverse     get the cahced value (inverse of the matrix) 

makeCacheMatrix <- function(x = matrix()) {

  s<-NULL
  set<-function(y){
    x<<-y
    s<<-NULL
  }
  get<-function() x
  setmatrix<-function(solve) s<<- solve
  getmatrix<-function() s
  list(set=set, get=get,
       setmatrix=setmatrix,
       getmatrix=getmatrix)
    
}


## Calculate the inverse of the matrix  created with the above 
## function, reusing cached result if it is available 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  s<-x$getmatrix()
  if(!is.null(s)){
    message("getting cached data")
    return(s)
  }
  matrix<-x$get()
  s<-solve(matrix, ...)
  x$setmatrix(s)
  s
  
}
