% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_eurostat_geospatial.R
\name{get_eurostat_geospatial}
\alias{get_eurostat_geospatial}
\title{Download Geospatial Data from CISGO}
\usage{
get_eurostat_geospatial(output_class = "spdf", resolution = "60",
  cache = TRUE, update_cache = FALSE, cache_dir = NULL)
}
\arguments{
\item{output_class}{A string. Class of object returned, either \code{df} (\code{data_frame}) or
\code{spdf} (\code{SpatialPolygonDataFrame})}

\item{resolution}{Resolution of the geospatial data. One of
"60" (1:60million), "20" (1:20million), "10" (1:10million), "01" (1:1million),}

\item{cache}{a logical whether to do caching. Default is \code{TRUE}. Affects 
only queries from the bulk download facility.}

\item{update_cache}{a locigal whether to update cache. Can be set also with
options(eurostat_update = TRUE)}

\item{cache_dir}{a path to a cache directory. The directory have to exist.
The \code{NULL} (default) uses and creates
'eurostat' directory in the temporary directory from
\code{\link{tempdir}}. Directory can also be set with
\code{option} eurostat_cache_dir.}
}
\value{
a data_frame or SpatialPolygonDataFrame.
}
\description{
Downloads either a SpatialPolygonDataFrame or a data_frame preprocessed using
   \code{ggplot2::fortify}.
}
\details{
The data source URL is \url{http://ec.europa.eu/eurostat/web/gisco/geodata/reference-data/administrative-units-statistical-units}.
}
\examples{
 \dontrun{
   lp <- get_eurostat_geospatial(output_class = "spdf", resolution = "60")
   spplot(lp, "STAT_LEVL_")
   # or
   lp <- get_eurostat_geospatial(output_class = "df", resolution = "60")
   ggplot(lp, aes(x=long,y=lat,group=group,fill=STAT_LEVL_),color="white") + geom_polygon()
 }
 
}
\author{
Markus Kainu <markuskainu@gmail.com>
}

