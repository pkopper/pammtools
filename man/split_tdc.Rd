% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/transform-tdc.R
\name{split_tdc}
\alias{split_tdc}
\title{Create piece-wise exponential data in case of time-dependent covariates}
\usage{
split_tdc(formula, event_df, tdc_df, tz_var, id_var = "id",
  time_var = "time", status_var = "status", cens_value = 0,
  entry_time = 0, ...)
}
\arguments{
\item{formula}{A two sided formula with a \code{\link[survival]{Surv}} object
on the left-hand-side and covariate specification on the right-hand-side (RHS).
The RHS can be an extended formula, which specifies how TDCs should be transformed
using specials \code{concurrent} and \code{cumulative}.}

\item{event_df}{Data frame (or similar) containing survival information.}

\item{tdc_df}{Data frame (or similar) containing information on time-dependent
covariates}

\item{tz_var}{The time variable in \code{tdc_df} indicating time points at
which time-dependent covariate (tdc) was observed.
Needs to be the same name in both data sets.}

\item{id_var}{The ID variable name, identifying subjects.}

\item{time_var}{A character, specifies the column of the event or
censoring time in \code{event_df} and the time of measurement for
the time-dependent covariates in \code{tdc_df}.}

\item{status_var}{As \code{time_var}, but specifies column containing the
event indicator. Can be missing in the \code{tdc_df}.}

\item{cens_value}{The value that indicates censoring in the
\code{status_var} column.}

\item{entry_time}{If scalar, the time-point at which the follow up for each
observation unit begins. (Eventually, support for subject specific
entry time could be supported through this argument).}

\item{...}{Further arguments passed to the \code{data.frame} method and
eventually to \code{\link[survival]{survSplit}}}
}
\description{
Given to data frames, one containing event time information (one row per subject)
and one containing information on time-dependent covariates, creates
piece-wise exponential data (with one split per event time and time at
which a TDC changes its value).
}
