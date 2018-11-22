
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggpkt <img src="man/figures/logo.png" align="right" width="120" />

## Overview

ggpkt is a collection of graphics and themes, based on
[ggplot2](https://github.com/tidyverse/ggplot2). This packages defines
themes used in report, ppt, visualization-system and other scenes.

## Installation

``` r
# change the path to your own.
path <- 'E:/'
pkgfile.zip <- paste0(path, 'ggpkt_0.0.0.9000.zip')
install.packages(pkgfile.zip, repos = NULL, type = "win.binary")

pkgfile.tar <- paste0(path, 'ggpkt_0.0.0.9000.tar.gz')
install.packages(pkgfile.tar, repos = NULL, type = "source")
```

## Remove

``` r
remove.packages('ggpkt')
```

## Usage

It’s simple to to add themes to any ggplot object.

``` r
library(ggplot2)
library(ggpkt)
ggplot(mpg, aes(displ, hwy, colour = class)) + 
  geom_point() +
  theme_rp_light()
```

![](man/figures/README-example_theme-1.png)<!-- -->

There are many customizated figures, the corresponding function are
named like ’fig\_\*’. List some of these functions and its usage as
follows.

### figures

#### 1\. The gantt chart

``` r
library(ggpkt)
rawdata <- data.frame(
  works = c('需求分析和确认', '算法1研发', '算法2研发', '算法3研发',
            '系统框架构建', '分析系统开发', '数据库构建', '系统集成部署',
            '试运行', '交付验收'),
  start_time = as.Date(
    c('2018-01-01', '2018-01-20','2018-02-15','2018-03-20', '2018-04-01',
      '2018-05-01','2018-06-30','2018-08-01', '2018-09-01','2018-10-30')
    ),
  end_time = as.Date(
    c('2018-01-19', '2018-02-14', '2018-03-19', '2018-03-31', '2018-04-29',
      '2018-06-29', '2018-07-31', '2018-08-31', '2018-10-29', '2018-11-08')
    ),
  start_time_real = as.Date(
    c('2018-01-02', '2018-01-21', '2018-02-17', '2018-03-25', '2018-04-01',
      '2018-05-02', '2018-06-28', '2018-08-01', '2018-09-05', '2018-10-29')
    ),
  end_time_real = as.Date(
    c('2018-01-20', '2018-02-16', '2018-03-24', '2018-03-31', '2018-05-01',
      '2018-06-27', '2018-07-31', '2018-09-04', '2018-10-28', '2018-11-07')
    ),
  stringsAsFactors = FALSE
  )

fig_gantt(rawdata)
```

![](man/figures/README-example_figure-1.png)<!-- -->

#### 2\. The calendar heatmap

``` r
num <- 180
rawdata <- data.frame(
  dates = seq(as.Date('2018-01-01'), length.out = num, by = '1 day'),
  values = round(rnorm(num), 3)
)
fig_calendar(rawdata, isfull = T, na.col = 'grey80', val.col = 'grey80',
             mar.fill = 'white', mar.col = 'grey80')
```

![](man/figures/README-unnamed-chunk-4-1.png)<!-- -->

#### 3\. The bubble matrix

``` r
numx <- 10
numy <- 7
rawdata <- data.frame(
  xlabel = rep(paste(letters[1:numx], 'x', sep = '-'), numy),
  ylabel = rep(paste(letters[1:numy], 'y', sep = '-'), each = numx),
  values = runif(numx*numy, min = 5, max = 20),
  stringsAsFactors = F
)

gg <- fig_bubble_rect(rawdata, bubble.size.range = c(3, 10))
gg
```

![](man/figures/README-unnamed-chunk-5-1.png)<!-- -->

### Customization

Most of these figure functions return ggplot objects, so any ggplot
grammar can be applied. \#\#\#\# Add elements of ggplot2

``` r
# add theme
gg + theme_rp_light()

# add title
gg + ggtitle('the bubbles')
```

#### Add marks

``` r
gg <- fig_waterfall(values = c(200, -50, 70), start_label = '开始', end_label = '结束')
```

Add logo

``` r
add_logo(gg, logo.loc = c(0.04, 0.94))
```

![](man/figures/README-unnamed-chunk-8-1.png)<!-- -->

Add copyright.

``` r
add_copyright(gg, col = 'blue')
```

![](man/figures/README-unnamed-chunk-9-1.png)<!-- -->

Add watermark

``` r
add_watermark(gg, angle = 30)
```

![](man/figures/README-unnamed-chunk-10-1.png)<!-- -->

## Getting help

View the help page, or contact the maintainer.

``` r
help(package = 'ggpkt')
```
