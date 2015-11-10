\name{KITdesign}
\alias{KITdesign}
\title{
A Fast Multiple-Kernel Method Based on a Low-Rank Approximation with 
Design Matrix Inputs
}
\description{
A computationally efficient and statistically rigorous fast Kernel Machine method for multi-kernel analysis. The approach is based on a low-rank approximation to the nuisance effect kernel matrices. The algorithm is applicable to continuous, dichotomous, and survival traits and is implemented using the existing single-kernel analysis software 'SKAT' or 'coxKM'. This function accepts as input objects of class geno and/or nongeno containing a design matrix, kernel type, and weights.
}
\usage{
KITdesign(y, matA, matB, matC=NULL, x=NULL, trait=NULL, delta=NULL, 
          standardize=TRUE, ...)
}
\arguments{
 \item{y}{a vector, matrix, or data.frame of traits. Must be 
          a continuous, dichotomous, or survival trait.
          Missing values must be coded as NA.}

 \item{matA}{an object of class geno or non-geno that specifies
             the design matrix, weights, and kernel type for matrix A.}

 \item{matB}{an object of class geno or non-geno that specifies
             the design matrix, weights, and kernel type for matrix B.}

 \item{matC}{If provided, an object of class non-geno. 
             It is the design matrix of the effect
             for which the user is testing given the design
             matrices specified in matA and matB.
             Missing values are coded as NA.
             If NULL, Akernel x Bkernel will be used.}

 \item{x}{a vector, matrix, or data.frame. The design matrix of
          covariates that are not included in either design
          matrix specified in matA or matB.}

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

 \item{standardize}{If TRUE, input x and all objects of class nongeno 
                    will be centered and scaled.}

  \item{\dots}{Optional arguments to be passed to kernel machine
               methods and/or coxph.}
}
\details{
If missing values are provided in matA, matB, matC, y, or x, individuals with missing values in any of these inputs will be removed from all calculations.

The function SKAT_Null_Model and SKAT of the 'SKAT' R package are used to obtain p-values for continuous and dichotomous traits. For survival traits, Surv and coxph of the 'survival' package and coxKM of the R package 'coxKM' are used. The ellipsis in the call to KITdesign can be used to adjust the default setting of the Kernel Machine methods and coxph. At the time of this documentation, coxph and coxKM have an overlap in argument names, namely 'weights.'  If weights are provided by user through the ellipsis, it is assumed that this refers to coxph.

At the time of writing this documentation, the R package 'coxKM' is not available through the CRAN repository, but can be obtained from http://www.hsph.harvard.edu/xlin/software.html. This package is only required to be installed if survival traits are analyzed. Only version 0.3 and above of coxKM can be used with this package.

The algorithm maintains the highest possible proportion of variability in both kernel matrices. 
}
\value{
A list is returned.
  \item{propA}{The proportion of variability retained in kernel of
               matA.}
  \item{propB}{The proportion of variability retained in kernel of
               matB.}
  \item{pValue}{The p-value as returned by function SKAT or coxKM.}
}
\references{
Marceau, R., Lu, W., Holloway, S. T., Sale, M. M., Worrall, B. B., Williams, S. R., Hsu, F-C., and Tzeng, J-Y.
A Fast Multiple-Kernel Method with Applications to Detect Gene-Environment Interaction. Genetic Epidemiology, 39, 456-468.
}
\author{
Shannon Holloway, Rachel Marceau, Wenbin Lu, Michele M. Sale, Bradford B. Worrall, Stephen R. Williams, Fang-Chi Hsu, and Jung-Ying Tzeng.
}
\examples{

if( requireNamespace("SKAT", quietly=TRUE) ) {

  matA <- matrix(data = rnorm(100*20), nrow = 100, ncol = 20)
  matB <- matrix(data = rnorm(100), nrow = 100, ncol = 1)

  y <- rnorm(100)

  KITdesign(y = y, 
            matA = nongeno(matA, kernel = "linear"), 
            matB = nongeno(matB, kernel = "linear"))

}
}

