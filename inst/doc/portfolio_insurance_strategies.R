## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- out.width="70%"---------------------------------------------------------
library(etrm)
data(powcal)

# the first five contracts
head(powcal[1:6])

## ----powcal_06----------------------------------------------------------------
day06 <- powcal$Date[!is.na(powcal$`CAL-06`)]
cal06 <- powcal$`CAL-06`[!is.na(powcal$`CAL-06`)]
dat06 <- data.frame(Date = day06, CAL06 = cal06)
dat06 <- tail(dat06, 500)

## ----cal06_obpi_long, fig.width=7, fig.height=5-------------------------------
cal06_obpi_b <- obpi(q = 30,               # volume 30 MW (buyer)
                     tdate = dat06$Date,   # vector with trading days until expiry
                     f = dat06$CAL06,      # vector with futures price
                     k = dat06$CAL06[1],   # default option strike price at-the-money
                     vol = 0.2,            # annualized volatility, for the Black-76 delta hedging
                     r = 0,                # default assumed risk free rate of interest
                     tdays = 250,          # assumed trading days per year
                     daysleft = 500,       # number of days to expiry
                     tcost = 0,            # transaction cost
                     int = TRUE            # integer restriction, smallest transacted unit = 1
                   )

plot(cal06_obpi_b, legend = "bottom", title = "OBPI strategy buyer CAL-06")

## ----cal06_obpi_b_sumary------------------------------------------------------
summary(cal06_obpi_b)

## ----cal06_obpi_b_slots-------------------------------------------------------
slotNames(cal06_obpi_b)

## ----cal_obpi_short, fig.width=7, fig.height=5--------------------------------
cal06_obpi_s <- obpi(q = - 30,             # volume -30 MW (seller)
                     tdate = dat06$Date,   # vector with trading days until expiry
                     f = dat06$CAL06,      # vector with futures price
                     k = dat06$CAL06[1],   # default option strike price at-the-money
                     vol = 0.2,            # annualized volatility, for the Black-76 delta hedging
                     r = 0,                # default assumed risk free rate of interest
                     tdays = 250,          # assumed trading days per year
                     daysleft = 500,       # number of days to expiry
                     tcost = 0,            # transaction cost
                     int = TRUE            # integer restriction, smallest transacted unit = 1
                   )

plot(cal06_obpi_s, legend = "bottom", title = "OBPI strategy seller CAL-06")

