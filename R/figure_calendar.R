#' Calendar chart
#'
#' Plot time series data in calendar way.
#'
#' @param rawdata A \code{data.frame} with two columns: 'dates', date data in the
#' format of \code{Date()}; 'values', numeric data.
#' @param colours A \code{vector} contains colours mapped to the figure.
#' @param alpha Numeric value between 1 and 0, controls the transparency of rects.
#' @param na.col Colour of the NA values.
#' @param val.col Border colour of the rects.
#' @param mar.col Border colour of the rects, which used to fill blank space.
#' @param mar.fill Colour used to fill the rects, which used to fill black space.
#' @param strip.text.size Text size of strip.
#' @param strip.text.hjust Horizontal position of the text in strip.
#' @param axis.x.size Text size of axis x.
#' @param isfull Boolean value, default FALSE,if TRUE use rects fill the blank space.
#' @param islegend Boolean value, default TRUE, if FALSE remove the legend.
#' @param istext Boolean value, default False, if TRUE draw the value to the correspond date.
#' @param text.size Text size of data value.
#' @param isday Boolean value, default FALSE, if TRUE draw the date number.
#' @param day.size Text size of date number.
#'
#' @importFrom tibble tibble
#' @importFrom dplyr mutate arrange right_join select filter bind_rows
#'
#' @note \code{istext} and \code{isday} can only set one to be TRUE at one time.
#'
#' @example inst/examples/ex-calendar.R
#'
#' @family figure
#'
#' @return ggplot object
#'
#' @export
fig_calendar <- function(
    rawdata,
    colours = c("beige", "orange", "red", "darkred"),
    alpha = .8,
    na.col = "grey80",
    val.col = "grey70",
    mar.col = "grey80",
    mar.fill = "white",
    strip.text.size = 12,
    strip.text.hjust = 0,
    axis.x.size = 10,
    isfull = F,
    islegend = T,
    istext = F,
    text.size = 3,
    isday = F,
    day.size = 3) {
  set_fonts()
  weekdays <- c("S", "M", "T", "W", "T", "F", "S")
  # get ordered vector of month names
  months <- format(seq(as.Date("2016-01-01"), as.Date("2016-12-01"), by = "1 month"), "%B")

  # get lower and upper bound to fill in missing values
  mindate <- as.Date(format(min(rawdata$dates), "%Y-%m-01"))
  maxdate <- (seq(as.Date(format(max(rawdata$dates), "%Y-%m-01")), length.out = 2, by = "1 month") - 1)[2]
  # set up tibble with all the dates.
  filler <- tibble(date = seq(mindate, maxdate, by = "1 day"))

  t1 <-
    tibble(date = rawdata$dates, fill = rawdata$values) %>%
    right_join(filler, by = "date") %>% # fill in missing dates with NA
    mutate(dow = as.numeric(format(date, "%w"))) %>% # week day
    mutate(month = format(date, "%B")) %>%
    mutate(woy = as.numeric(format(date, "%U"))) %>% # week of the years 00 ~ 53
    mutate(year = as.numeric(format(date, "%Y"))) %>%
    mutate(month = factor(month, levels = months, ordered = TRUE)) %>%
    arrange(year, month) %>%
    mutate(monlabel = month) %>%
    mutate(day = as.numeric(format(date, '%d')))

  if (length(unique(t1$year)) > 1) { # multi-year data set
    t1$monlabel <- paste(t1$month, t1$year)
  }

  t2 <- t1 %>%
    mutate(monlabel = factor(monlabel, ordered = TRUE)) %>%
    mutate(monlabel = fac_raworder(monlabel)) %>%
    mutate(
      monthweek = woy - min(woy), # which week in the month
      y = max(monthweek) - monthweek + 1
    ) %>%
    select(date, fill, dow, y, monlabel, day)

  t3 <- t2 %>% select(-date) %>% mutate(type = "value")

  pic <-
    ggplot() +
    geom_tile(
      data = t3[t3$type == "value", ],
      aes(dow, y, fill = fill), color = val.col, height = 1, alpha = alpha
    ) +
    facet_wrap(~monlabel, ncol = 3, scales = "free") +
    theme(
      panel.background = element_rect(fill = "white", color = NA),
      strip.background = element_rect(fill = 'grey80', color = NA),
      strip.text.x = element_text(
        hjust = strip.text.hjust, face = "bold", size = strip.text.size
        ),
      legend.title = element_blank(),
      axis.ticks = element_blank(),
      axis.title = element_blank(),
      axis.text.y = element_blank(),
      axis.text.x = element_text(size = axis.x.size),
      strip.placement = "outsite"
    ) +
    scale_x_continuous(
      expand = c(0, 0), position = "top", breaks = seq(0, 6), labels = weekdays
    ) +
    scale_y_continuous(expand = c(0, 0)) +
    scale_fill_gradientn(colors = colours, na.value = na.col)

  if (isfull) {
    temp.comp <- data.frame()
    for (m in unique(t2$monlabel)) {
      temp <- t2 %>% filter(monlabel == m)
      loc.start <- which.min(temp$date)
      loc.end <- which.max(temp$date)
      if (temp$dow[loc.start] != 0) {
        temp.start <- data.frame(
          fill = NA,
          type = "margin",
          dow = 0:(temp$dow[loc.start] - 1),
          y = temp$y[loc.start],
          monlabel = m,
          stringsAsFactors = F
        )
        temp.start$day <- 1:nrow(temp.start)
      }
      if (temp$dow[loc.end] != 6) {
        endday <- as.numeric(format(max(temp$date), '%d'))

        temp.end <- data.frame(
          fill = NA,
          type = "margin",
          dow = (temp$dow[loc.end] + 1):6,
          y = temp$y[loc.end],
          monlabel = m,
          stringsAsFactors = F
        )
        temp.end$day <- (endday + 1):(endday + nrow(temp.end))
      }
      temp.comp <- bind_rows(temp.comp, temp.start, temp.end)
    }
    temp.comp$monlabel <- factor(temp.comp$monlabel, levels = levels(t3$monlabel))
    t3 <- bind_rows(t3, temp.comp) %>% arrange(monlabel, y, dow)

    pic <- pic +
      geom_tile(
        data = t3[t3$type == "margin", ], aes(dow, y),
        fill = mar.fill, col = mar.col, height = 1, alpha = alpha
      )
  }
  if (!islegend) pic <- pic + theme(legend.position = 'none')
  if (istext & !isday) {
    pic <- pic +
      geom_text(data = stats::na.omit(t3[t3$type == "value", ]), aes(dow, y, label = fill), size = text.size)
  }
  if (!istext & isday) {
    pic <- pic +
      geom_text(data = t3[t3$type == "value", ], aes(dow, y, label = day), size = day.size)
  }

  return(pic)
}
