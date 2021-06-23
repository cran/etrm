## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, echo=FALSE--------------------------------------------------------
library(etrm)
data("powfutures130513")

## -----------------------------------------------------------------------------
powfutures130513

## -----------------------------------------------------------------------------
fwd_npri <- msfc(tdate = as.Date("2013-05-13"),
                  include = powfutures130513$Include,
                  contract = powfutures130513$Contract,
                  sdate = powfutures130513$Start,
                  edate = powfutures130513$End,
                  f = powfutures130513$Closing)

## -----------------------------------------------------------------------------
fwd_wpri <- msfc(tdate = as.Date("2013-05-13"),
                  include = powfutures130513$Include,
                  contract = powfutures130513$Contract,
                  sdate = powfutures130513$Start,
                  edate = powfutures130513$End,
                  f = powfutures130513$Closing,
                  prior = powpriors130513$mod.prior)

## ---- fig.dim=c(7, 4)---------------------------------------------------------
plot(fwd_npri, title = "Forward curve without prior")

## ---- fig.dim=c(7, 4)---------------------------------------------------------
plot(fwd_wpri, title = "Forward curve with prior")

## -----------------------------------------------------------------------------
summary(fwd_npri)

## -----------------------------------------------------------------------------
summary(fwd_wpri)

## -----------------------------------------------------------------------------
head(show(fwd_npri), 15)[1:8]

## -----------------------------------------------------------------------------
slotNames(fwd_npri)

