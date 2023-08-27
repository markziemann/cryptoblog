#!/bin/bash
#55 9 * * * bash /home/pi/projects/cryptoblog/daily.sh
HR=$(date --utc '+%d-%m-%Y %H:%M:%S' | cut -d ' ' -f2 | cut -d ':' -f1)
if [ $HR -lt 23 ] ; then sleep 1h ; fi
MYCMD=$(echo $0)
MYDIR=$(dirname $MYCMD)
cd $MYDIR
git pull
shopt -s expand_aliases
alias SCP='scp -P 21098 -i /home/mdz/.ssh/mdza/id_rsa -o HostKeyAlgorithms=+ssh-rsa -o PubkeyAcceptedKeyTypes=+ssh-rsa'
Rscript -e "rmarkdown::render('index0.Rmd')"
Rscript -e "rmarkdown::render('alerts/alerts.Rmd')" && \
SCP alerts/alerts.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto
SCP index.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/index.html

for RMD in alerts/alerts_*Rmd ; do
  COIN=$(echo $RMD | sed 's#alerts/alerts_##' | sed 's/.Rmd//')
  echo $COIN $RMD
  Rscript -e "rmarkdown::render('${RMD}')"
  SCP alerts/alerts_${COIN}.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/coins/${COIN}
done

sleep 15m

#Rscript -e "rmarkdown::render('coins.Rmd')"
#cp coins.html crypto

Rscript -e "rmarkdown::render('ma_trading_btc.Rmd')" && \
  SCP ma_trading_btc.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('ma_trading_eth.Rmd')" && \
  SCP ma_trading_eth.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('ma_trading_xmr.Rmd')" && \
  SCP ma_trading_xmr.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('ma_trading_ethbtc.Rmd')" && \
  SCP ma_trading_ethbtc.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('ma_trading_weekly_btc.Rmd')" && \
  SCP ma_trading_weekly_btc.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('ma_trading_weekly_eth.Rmd')" && \
  SCP ma_trading_weekly_eth.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('ma_trading_weekly_xmr.Rmd')" && \
  SCP ma_trading_weekly_xmr.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('ma_cross_btc.Rmd')" && \
  SCP ma_cross_btc.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('ma_cross_eth.Rmd')" && \
  SCP ma_cross_eth.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('ma_cross_xmr.Rmd')" && \
  SCP ma_cross_xmr.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('dmi_trading_btc.Rmd')" && \
  SCP dmi_trading_btc.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('dmi_trading_eth.Rmd')" && \
  SCP dmi_trading_eth.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('dmi_trading_xmr.Rmd')" && \
  SCP dmi_trading_xmr.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('tsi_trading_btc.Rmd')" && \
  SCP tsi_trading_btc.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('tsi_trading_eth.Rmd')" && \
  SCP tsi_trading_eth.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('tsi_trading_xmr.Rmd')" && \
  SCP tsi_trading_xmr.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('rsi2_trading_btc.Rmd')" && \
  SCP rsi2_trading_btc.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('rsi2_trading_eth.Rmd')" && \
  SCP rsi2_trading_eth.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('rsi2_trading_xmr.Rmd')" && \
  SCP rsi2_trading_xmr.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('stoch_trading_btc.Rmd')" && \
  SCP stoch_trading_btc.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('stoch_trading_eth.Rmd')" && \
  SCP stoch_trading_eth.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('stoch_trading_xmr.Rmd')" && \
  SCP stoch_trading_xmr.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('donchian_channel_btc.Rmd')" && \
  SCP donchian_channel_btc.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('donchian_channel_eth.Rmd')" && \
  SCP donchian_channel_eth.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('donchian_channel_xmr.Rmd')" && \
  SCP donchian_channel_xmr.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('kst_trading_btc.Rmd')" && \
  SCP kst_trading_btc.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('kst_trading_eth.Rmd')" && \
  SCP kst_trading_eth.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('kst_trading_xmr.Rmd')" && \
  SCP kst_trading_xmr.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('stablecoincap.Rmd')" && \
  SCP stablecoincap.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('rsi_watch.Rmd')" && \
  SCP rsi_watch.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('risk_index.Rmd')" && \
  SCP risk_index.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('volatility_size.Rmd')" && \
  SCP volatility_size.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('keltner_channels.Rmd')" && \
  SCP keltner_channels.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('pivots.Rmd')" && \
  SCP pivots.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('ensembl_ma_trading.Rmd')" && \
  SCP ensembl_ma_trading.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('ma_temporal2.Rmd')" && \
  SCP ma_temporal2.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto

Rscript -e "rmarkdown::render('ensemble/ensembl_trading_btc.Rmd')" && \
Rscript -e "rmarkdown::render('ensemble/ensembl_trading_eth.Rmd')" && \
Rscript -e "rmarkdown::render('ensemble/ensembl_trading_xmr.Rmd')" && \
  SCP ensemble/ensembl_trading_*.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/crypto/

cd coin_script
Rscript -e "rmarkdown::render('coin_script.Rmd')" && \
  SCP coin_script.html mdzascfs@mdz-analytics.com:/home/mdzascfs/public_html/coins
