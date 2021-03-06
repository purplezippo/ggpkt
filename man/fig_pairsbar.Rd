% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/figure_bar_paris.R
\name{fig_pairsbar}
\alias{fig_pairsbar}
\title{Bar plot with two groups separated}
\usage{
fig_pairsbar(rawdata, ishorizontal = T, labelspan.num = 1,
  labelspan.lab = 0.1, num.size = 4, label.size = 5,
  decreasing = T, bar.width = 0.9, colors = c("#F1B255", "#51A047"),
  title = "", subtitle.left = "", subtitle.right = "")
}
\arguments{
\item{rawdata}{A data frame with values in paris, which should contain three
columns names 'num_left','num_right' and 'labs'(the labels of each pairs).}

\item{ishorizontal}{Boolean value with default of FALSE, used to deside whether
should the figure be plot horizontal.}

\item{labelspan.num}{The space between num label of bars.}

\item{labelspan.lab}{The space between labels of bars.}

\item{num.size}{Size of num label.}

\item{label.size}{Size of label text.}

\item{decreasing}{Boolean value with default of FALSE, used to deside whether
the bars should ordered in decrease or not.}

\item{bar.width}{With of bar.}

\item{colors}{A vectior contains two values of colors which defines the color
of bars.}

\item{title}{The title of the figure.}

\item{subtitle.left}{The title of the bars in the left part.}

\item{subtitle.right}{The title of the bars in the right part.}
}
\description{
Bar plot with two groups separated
}
\examples{
rawdata <- data.frame(
  num_left = iris$Sepal.Length[iris$Species == 'setosa'][1:15],
  num_right = iris$Sepal.Length[iris$Species == 'versicolor'][1:15],
  labs = paste('id', 1:15,sep = '-')
)
fig_pairsbar(rawdata, labelspan.num = 0.5, labelspan.lab = 0.8)

fig_pairsbar(rawdata, labelspan.num = 0.5, labelspan.lab = 0.8, ishorizontal = FALSE)

fig_pairsbar(rawdata, labelspan.num = 0.5, labelspan.lab = 0.8, ishorizontal = FALSE,
             bar.width = 0.7)
}
\concept{figures utils}
