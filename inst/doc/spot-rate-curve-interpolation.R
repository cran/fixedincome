## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  out.width = "100%"
)

## ----message=FALSE, warning=FALSE---------------------------------------------
library(rb3)
library(bizdays)
library(dplyr)
library(fixedincome)

## -----------------------------------------------------------------------------
refdate <- getdate("last bizday", Sys.Date() - 1, "Brazil/ANBIMA")

## -----------------------------------------------------------------------------
yc_ <- yc_get(refdate)
fut_ <- futures_get(refdate)
yc_ss <- yc_superset(yc_, fut_)
yc <- bind_rows(
  yc_ss |> slice(1),
  yc_ss |> filter(!is.na(symbol))
)

yc

## -----------------------------------------------------------------------------
sp_curve <- spotratecurve(
  yc$r_252, yc$biz_days,
  "discrete", "business/252", "Brazil/ANBIMA",
  refdate = refdate
)

sp_curve

## -----------------------------------------------------------------------------
interpolation(sp_curve) <- interp_flatforward()

sp_curve

## -----------------------------------------------------------------------------
sp_curve[[c(21, 42, 63)]]

## -----------------------------------------------------------------------------
interpolation(sp_curve) <- interp_naturalspline()
sp_curve[[c(21, 42, 63)]]

## -----------------------------------------------------------------------------
interpolation(sp_curve) <- NULL
sp_curve[[c(21, 42, 63)]]

## ----fig.width=10, fig.height=5-----------------------------------------------
interpolation(sp_curve) <- interp_flatforward()
plot(sp_curve, use_interpolation = TRUE)

## ----fig.width=10, fig.height=5-----------------------------------------------
interpolation(sp_curve) <- NULL
plot(sp_curve, show_forward = TRUE, legend_location = "bottomright")

## ----fig.width=10, fig.height=5-----------------------------------------------
interpolation(sp_curve) <- interp_flatforward()
plot(sp_curve, use_interpolation = TRUE, show_forward = TRUE, legend_location = "bottomright")

## ----fig.width=10, fig.height=5-----------------------------------------------
interpolation(sp_curve) <- interp_naturalspline()
plot(sp_curve, use_interpolation = TRUE, show_forward = TRUE, legend_location = "bottomright")

