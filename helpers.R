library(shiny); library(quantmod); 

if (!exists(".inflation")) {
  .inflation <- getSymbols('CPIAUCNS', src = 'FRED', auto.assign = FALSE)
  }  

cpi <- function(data) {

  CPIvalues <- last(.inflation)[[1]]
  lastCPI <- time(last(.inflation))
  mths <- split(data)               
      
  mthWin <- function(month) {
    date <- substr(min(time(month[1]), lastCPI), 1, 7)
    coredata(month) * CPIvalues / .inflation[date][[1]]
    }
      
  adjustments <- do.call("rbind", lapply(mths, mthWin))
  timeSeries <- xts(adjustments, order.by = time(data))
  timeSeries[ , 5] <- Vo(data)
  timeSeries
  }
