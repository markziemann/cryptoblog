#!/bin/bash
#55 9 * * * bash /home/pi/projects/cryptoblog/daily.sh
MYCMD=$(echo $0)
MYDIR=$(dirname $MYCMD)
cd $MYDIR

Rscript -e "rmarkdown::render('alerts.Rmd')" && \
scp -P 21098 alerts.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto
cp alerts.html crypto

Rscript -e "rmarkdown::render('coins.Rmd')"
cp coins.html crypto

Rscript -e "rmarkdown::render('ma_trading.Rmd')" && \
  scp -P 21098 ma_trading.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('ma_trading_eth.Rmd')" && \
  scp -P 21098 ma_trading_eth.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('ma_trading_weekly.Rmd')" && \
  scp -P 21098 ma_trading_weekly.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('ma_trading_weekly_eth.Rmd')" && \
  scp -P 21098 ma_trading_weekly_eth.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('stablecoincap.Rmd')" && \
  scp -P 21098 stablecoincap.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto
