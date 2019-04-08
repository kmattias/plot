far_to_kel <- function(temp){
  kelvin <- ((temp - 32)*(5/9)) + 273.15
  return(kelvin) # optional, good to keep track of value
}

# now to use
far_to_kel(32)

#kelv to cel
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
 #OR, this eq doesnt return right result
far_to_cels_2 <- function(temp){
kelv <- far_to_kel(temp)
celsius <- kel_to_cels(kelv)
return(celsius)
}

far_to_cels(32)
