#!/bin/bash
#55 9 * * * bash /home/pi/projects/cryptoblog/daily.sh
MYCMD=$(echo $0)
MYDIR=$(dirname $MYCMD)
cd $MYDIR

Rscript -e "rmarkdown::render('alerts.Rmd')"
cp alerts.html crypto
Rscript -e "rmarkdown::render('coins.Rmd')"
cp coins.html crypto

Rscript -e "rmarkdown::render('ma_trading.Rmd')"
scp -P 21098 ma_trading.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('ma_trading_eth.Rmd')"
scp -P 21098 ma_trading_eth.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto



