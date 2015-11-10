\name{geno-class}
\Rdversion{1.1}
\docType{class}
\alias{geno-class}

\title{Class \code{"geno"}}
\description{
Class contains all information needed to generate a kernel matrix for
genotype data.
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("geno", ...)}.
}
\section{Slots}{
  \describe{
    \item{\code{mat}:}{Object of class \code{"matrix or NULL"}; 
                       one-column-per-marker formatted genotype data. }
    \item{\code{kernel}:}{Object of class \code{"character"}; 
                       type of kernel to generate. }
    \item{\code{weights}:}{Object of class \code{"matrix"};
                       weights to be used when generating
                       kernel matrix. }
  }
}
\section{Methods}{
No methods defined with class "geno" in the signature.
}
\author{
Shannon T. Holloway
}
\note{
This class is used to simplify input and logic within the main program. New objects of this class should be created only through function geno().
}

\seealso{
\code{\link{geno}}, \code{\link{nongeno}}
}
\examples{
showClass("geno")
}
\keyword{classes}
