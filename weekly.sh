#!/bin/bash
#0 0 * * 3 bash /home/pi/projects/cryptoblog/weekly.sh
MYCMD=$(echo $0)
MYDIR=$(dirname $MYCMD)
cd $MYDIR

Rscript -e "rmarkdown::render('ma_trading.Rmd')"
Rscript -e "rmarkdown::render('ma_trading_eth.Rmd')"
Rscript -e "rmarkdown::render('dmi_trading.Rmd')"
Rscript -e "rmarkdown::render('dmi_trading_eth.Rmd')"

cp ma_trading.html ma_trading_eth.html dmi_trading.html dmi_trading_eth.html crypto

