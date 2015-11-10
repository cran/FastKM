\name{nongeno}
\alias{nongeno}
\title{
Create a nongeno Object
}
\description{
Creates an object of class nongeno containing a non-genotype design matrix, the type of kernel to generate, and the weights to be used to create the kernel matrix. This function is used to simplify the input structure of the call to KITdesign. }
\usage{
nongeno(mat, kernel = "linear", weights = NULL)
}
\arguments{
  \item{mat}{Design matrix. Missing values must be coded as NA.}
  \item{kernel}{Type of kernel. 
                Must be one of {'interactive', 'linear', 'quadratic'}.
                For linear kernel, the constant is taken to
                be zero; for quadratic kernel, it is one.
               }
  \item{weights}{Weights, if any, to be used in generating kernel.
                 Object can be a vector or matrix. If vector,
                 weights is converted to a diagonal matrix.
                }
}
\value{
Returns an object of class nongeno containing the design matrix, 
the weights to be used in generating the kernel, and the
type of kernel to be generated.
}
\author{
Shannon T. Holloway
}

\seealso{
\code{\link{geno}}, \code{\link{KITdesign}}
}
\examples{
  ngdata <- matrix(rnorm(40),ncol=4L)

  nongeno(mat = ngdata, kernel = "linear", weights = NULL)

}

