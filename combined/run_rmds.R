rmds <- c("dmi_trading_combined.Rmd","donchian_channel_combined.Rmd","kst_trading_combined.Rmd","ma_cross_combined.Rmd","ma_trading_combined.Rmd","rsi2_trading_combined.Rmd","stoch_trading_combined.Rmd","tsi_trading_combined.Rmd")

lapply(rmds,rmarkdown::render)
