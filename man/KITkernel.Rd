\name{KITkernel}
\alias{KITkernel}
\title{
A Fast Multiple-Kernel Method Based on a Low-Rank Approximation with Kernel Inputs.}
\description{
A computationally efficient and statistically rigorous fast Kernel Machine method for multi-kernel analysis. The approach is based on a low-rank approximation to the nuisance effect kernel matrices. The algorithm is applicable to continuous, dichotomous, and survival traits and is implemented using the existing single-kernel analysis software 'SKAT' and/or 'coxKM'. This function accepts as input kernel matrices.}
\usage{
KITkernel(y, kmatA, kmatB, kmatC = NULL, x = NULL, 
          AkernelC = 0.0, BkernelC = 0.0, trait = NULL, delta = NULL, 
          standardize = TRUE, ...)
}
\arguments{
 \item{y}{a vector, matrix, or data.frame of traits. Must be 
          a continuous, dichotomous, or survival trait. 
          Data must be complete.}

 \item{kmatA}{a matrix or data.frame. A kernel matrix.
              Data must be complete.}

 \item{kmatB}{a matrix or data.frame. A kernel matrix.
              Data must be complete.}

 \item{kmatC}{If provided, a matrix or data.frame. The kernel matrix
              of the effect for which the user is testing given 
              matA and matB. 
              Data must be complete. 
              If NULL, the kmatA x kmatB kernel will be used.}

 \item{x}{a vector, matrix, or data.frame. 
          The design matrix of covariates
          that are not included in either matA or matB, the kernels of
          which are provided in kmatA and kmatB. 
          Data must be complete.}

 \item{AkernelC}{If kmatC is NULL and kmatA was calculated using
                 a polynomial or interactive kernel, 
                 AkernelC is the value of the constant term.
                 For example if kmatA = (1+X^T X), AkernelC = 1.0. 
                 This input is used to properly account for
                 the constant terms when generating kmatA x kmatB
                 kernel.}

 \item{BkernelC}{If kmatC is NULL and kmatB was calculated using
                 a polynomial or interactive kernel, 
                 BkernelC is the value of the constant term.
                 For example if kmatB = (1+X^T X), BkernelC = 1.0. 
                 This input is used to properly account for
                 the constant terms when generating kmatA x kmatB
                 kernel.}

 \item{trait}{One of {'c','d','s',NULL} indicating the type
          of trait given in input y, where 'c' = continuous,
          'd' = dichotomous, and 's' = survival. If NULL, the software 
          will deduce the trait type using the following logic:
          If input argument delta is not NULL, assume survival.
          If y is an integer with only two unique values, dichotomous.
          If y is not an integer or if y is an integer and there are
          more than two unique values, continuous.
          Here, integer does not mean the R class but
          that a numeric is equivalent to its integer truncation.}

 \item{delta}{the status/event indicator in survival analyses. 
               Usually, 0=alive, 1=dead; TRUE/FALSE (TRUE=death); or
               1/2 (2 = death). For continuous or dichotomous traits,
               delta must be NULL.}

 \item{standardize}{If TRUE, input x will be centered and scaled.}

  \item{\dots}{Optional arguments to be passed to kernel machine
               methods and/or coxph.}
}
\details{
The function SKAT_Null_Model and SKAT of the 'SKAT' R package are used to obtain p-values for continuous and dichotomous traits. For survival traits, Surv and coxph of the 'survival' package and coxKM of the R package 'coxKM' are used. The ellipsis in the call to KITkernel can be used to adjust the default setting of the Kernel Machine methods and coxph. At the time of this documentation, coxph and coxKM have an overlap in argument names, namely 'weights.'  If weights are provided by user through the ellipsis, it is assumed that this refers to coxph. 

At the time of writing this documentation, the R package 'coxKM' is not available through the CRAN repository, but can be obtained from <https://github.com/lin-lab/coxKM>. This package is only required to be installed if survival traits are analyzed. Only version 0.3 and above of 'coxKM' can be used with this package.

The algorithm maintains the highest possible proportion of variability in both kernel matrices. 
}
\value{
A list is returned.
  \item{propA}{The proportion of variability retained in kmatA.}
  \item{propB}{The proportion of variability retained in kmatB.}
  \item{pValue}{The p-value as returned by function SKAT or coxKM.}
}
\references{
Marceau, R., Lu, W., Holloway, S. T., Sale, M. M., Worrall, B. B., Williams, S. R., Hsu, F-C., and Tzeng, J-Y.
A Fast Multiple-Kernel Method with Applications to Detect Gene-Environment Interaction. Genetic Epidemiology, 39, 456-468.
}
\author{
Shannon T. Holloway, Rachel Marceau, Wenbin Lu, Michele M. Sale, Bradford B. Worrall, Stephen R. Williams, Fang-Chi Hsu, and Jung-Ying Tzeng.
}
\examples{
if( requireNamespace("SKAT", quietly=TRUE) ) {

  matA <- matrix(data = rnorm(100*20), nrow = 100, ncol = 20)
  matB <- matrix(data = rnorm(100), nrow = 100, ncol = 1)
  y <- rnorm(100)

  kmatA <- (1 + tcrossprod(matA,matA))^2
  kmatB <- tcrossprod(matB,matB)

  KITkernel(y = y, kmatA = kmatA, kmatB = kmatB, AkernelC = 1.0)

}


}

