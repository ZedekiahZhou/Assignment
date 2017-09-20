## Cache the inverse of a matrix

## This function creates a special matrix that is actualy a list;
## This function can 
## 1. set the value of the original matrix
## 2. get the value of the original matrix
## 3. set the value of the inverse of the original matrix
## 4. get the value of the inverse of the original matrix

makeCacheMatrix <- function(x = matrix(0,0,0)) {
    iM <- NULL
    setM <- function(M) {
        x <<- M
        iM <<- NULL
    }
    getM <- function() x
    setiM <- function(myiM) iM <<- myiM
    getiM <- function() iM
    list(setM = setM, getM = getM,
         setiM = setiM,
         getiM = getiM)
}


## To get the inverse of a matrix

cacheSolve <- function(x, ...) {
    iM <- x$getiM()
    if (!is.null(iM)) {
        message("get the cached data")
    } else {
        myMatrix <- x$getM()
        iM <- solve(myMatrix)
        x$setiM(iM)
    }
    iM
}
