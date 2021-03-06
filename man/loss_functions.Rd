% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/loss_functions.R
\name{loss_cross_entropy}
\alias{loss_cross_entropy}
\alias{loss_sum_of_squares}
\alias{loss_root_mean_square}
\alias{loss_accuracy}
\alias{loss_one_minus_auc}
\title{Calculate Loss Functions}
\usage{
loss_cross_entropy(observed, predicted, p_min = 1e-04, na.rm = TRUE)

loss_sum_of_squares(observed, predicted, na.rm = TRUE)

loss_root_mean_square(observed, predicted, na.rm = TRUE)

loss_accuracy(observed, predicted, na.rm = TRUE)

loss_one_minus_auc(observed, predicted)
}
\arguments{
\item{observed}{observed scores or labels, these are supplied as explainer specific \code{y}}

\item{predicted}{predicted scores, either vector of matrix, these are returned from the model specific \code{predict_function()}}

\item{p_min}{for cross entropy, minimal value for probability to make sure that \code{log} will not explode}

\item{na.rm}{logical, should missing values be removed?}
}
\value{
numeric - value of the loss function
}
\description{
Calculate Loss Functions
}
\examples{
 \dontrun{
library("ranger")
titanic_ranger_model <- ranger(survived~., data = titanic_imputed, num.trees = 50,
                               probability = TRUE)
loss_one_minus_auc(titanic_imputed$survived, yhat(titanic_ranger_model, titanic_imputed))

HR_ranger_model_multi <- ranger(status~., data = HR, num.trees = 50, probability = TRUE)
loss_cross_entropy(as.numeric(HR$status), yhat(HR_ranger_model_multi, HR))

 }
}
