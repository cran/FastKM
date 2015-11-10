\name{geno}
\alias{geno}
\title{
Create a geno Object.
}
\description{
Creates an object of class geno containing a matrix of one-column-per-marker formated genotype data, the type of kernel, and the weights to be used to create the kernel matrix. This function is used to simplify the input structure of the call to KITdesign. 
}
\usage{
geno(mat, kernel = "linear", weights = NULL, inheritMode = NA)
}
\arguments{
  \item{mat}{Design matrix for genotype data in either 
             one- or two-column-per-marker format. Object can be a
             vector, matrix, or data.frame. Missing values
             can be coded as either 9 or NA.
            }
  \item{kernel}{Character object indicating type of kernel. 
                Must be one of {'ibs', 'linear', 'quadratic'}.
                For linear kernel, the constant is taken to
                be zero; for quadratic kernel, it is one.
               }
  \item{weights}{Weights, if any, to be used in generating kernel.
                 Object can be a vector or matrix. If vector and
                 kernel is not ibs, weights are converted to a 
                 diagonal matrix.
                }
  \item{inheritMode}{For two-column-per-marker format, the
                     inheritance mode to be used to convert to
                     one-column-per-marker format. Must be one of
                     {'add', 'dom', 'rec'} indicating additive,
                     dominant, or recessive, respectively.
                    }
}
\details{
There are two conventions for genotype data: one- and two-column-per-marker formats. Either format can be used. If genotype data is in one-column format, inheritMode = NA. If genotype data is in two-column format, inheritMode = add/dom/rec.

Non-integer imputed values can be provided. If it is determined that non-integer values are provided and that the kernel was specified as `ibs,' the kernel will be reset to `linear.' In addition, if provided in the two-column format, inheritMode will be set to `add.' 
}
\value{
Returns an object of class geno containing the one-column-per-marker genotype data, the weights to be used in generating the kernel, and the type of kernel to be generated.
}
\author{
Shannon T. Holloway
}

\seealso{
\code{\link{nongeno}}, \code{\link{KITdesign}}
}
\examples{
  gdata <- matrix(sample(0:1,40,replace=TRUE,prob=c(0.9,0.1)),ncol=4L)

  geno(mat = gdata, kernel = "ibs", 
       weights = NULL, inheritMode="add")

}

