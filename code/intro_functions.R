far_to_kel <- function(temp){
  if (!is.numeric(temp)) { # add defense
    stop("temp must be numeric")
  }
  kelvin <- ((temp - 32)*(5/9)) + 273.15
  return(kelvin) # optional, good to keep track of value
}

# now to use
far_to_kel(32)
far_to_kel("15") # pushes error

# kelv to cel
kel_to_cels <- function(temp){
  celsius <- temp - 273.15
  return(celsius)
  }

kel_to_cels(0)

#Far to celsius
far_to_cels <- function(temp){
  celsius <- ((temp - 32)*(5/9))
  return(celsius)
}
far_to_cels(0)
 #OR, this eq doesnt return right result, try to fix
far_to_cels_2 <- function(temp){
kelvin <- far_to_kel(temp)
celsius <- kel_to_cels(kelvin)
return(celsius)
}

far_to_cels(0)

far_to_kel_2 <- function(temp){
stopifnot (!is.numeric(temp)) # add defense, doesnt need {}
kelvin <- ((temp - 32)* 5/9) + 273.15
return(kelvin)
}
far_to_kel_2("15")

# use stop if not or if not to throw error
# if temp is not numeric value for the far to cels function
far_to_cels_2 <- function(temp){
  stopifnot(!is.numeric(temp))
  celsius <- ((temp - 32)*5/9)
  return(celsius)
}
far_to_cels_2("0")
