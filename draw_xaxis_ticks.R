draw_xaxis_ticks <- function(df) {
    par(xaxt="s")
    # Don't know why first tick does not start with first data point on x-axis
    #   adding 100 seems to make it work.
    #   need to research if this is obtainable from plot API
    obs_n <- nrow(df)
    axis(1, at=c(1, (obs_n / 2) + 1, obs_n + 1) + 100, 
         labels=c(strftime(df[c(1, (obs_n / 2) + 1),"sample_pxt"], format="%a"), 
                  strftime(df[obs_n,"sample_pxt"]+60, format="%a"))) 
                    # Add 60 secs to move to next weekday    
}
