% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/interpolation-class.R
\name{interpolate}
\alias{interpolate}
\alias{interpolate,Interpolation,numeric-method}
\alias{interpolate,Interpolation,Term-method}
\title{Interpolates a \code{SpotRateCurve}}
\usage{
interpolate(object, x, ...)
}
\value{
A numeric vector with the interpolated values.
The \code{Interpolation} object is created with the data point of the curve.
The interpolation method is executed on these points the numeric
vector.
}
\description{
This method is internally used by the interpolation engine.
The interpolation function is created by calling \code{prepare_interpolation}
method.
This method creates the interpolation funcion with the current state of the
curve object and sets this function to the \code{func} slot.
}
\keyword{internal}
