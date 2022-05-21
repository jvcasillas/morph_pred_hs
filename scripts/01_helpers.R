# Plot helpers  ---------------------------------------------------------------

theme_set(theme_bw(base_family = "Times", base_size = 13))
theme_update(
  axis.title.y = element_text(size = rel(.9), hjust = 0.95),
  axis.title.x = element_text(size = rel(.9), hjust = 0.95),
  panel.grid.major = element_line(colour = 'grey90', size = 0.15),
  panel.grid.minor = element_line(colour = 'grey90', size = 0.15), 
  strip.background = element_rect(fill = NA), 
  legend.background = element_blank()
)

clean_guide <- function(position, title) {
  list(
    theme(legend.position = position, 
      legend.direction = "horizontal",
      legend.title = element_text(size = 8.5, color = "grey45"), 
      legend.spacing.x = unit(0,"cm"), 
      legend.background = element_blank(), 
      strip.background = element_rect(fill = NA)),  
    guides(fill = guide_legend(keywidth = 0.5, keyheight = 0.12, 
      default.unit = "inch", title.hjust = 0.5, reverse = T, 
      title = title,
      label.position = "bottom", title.position = "bottom"), 
      color = guide_legend(hjust = 0.5)) 
  )
}

my_colors <- c("#f98e09", "#bc3754", "#57106e")

# -----------------------------------------------------------------------------


# Round and format numbers to exactly N digits
specify_decimal <- function(x, k) {
  out <- trimws(format(round(x, k), nsmall = k))
  return(out)
}

# Convert '-' to unicode minus
unicode_minus <- function(x) {
  sub('^-', '\U2212', format(x))
}

# Strip blank space
strip_blank <- function(x) {
  sub('[[:space:]]+', '', format(x))
}

center_timecourse <- function(time, marker, event) {
    onset_time <- time[!is.na(marker) & marker == event]
    if (length(onset_time) == 0) {
        return(rep(NA, length(time)))
    }
    if (length(onset_time) > 1) 
        stop("event marker occurs more than once per trial")
    time - onset_time
}

std_err <- function(x) { 
  sd(x) / sqrt(length(x))
}
