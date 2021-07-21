#!/bin/bash

MYCMD=$(echo $0)
MYDIR=$(dirname $MYCMD)
cd $MYDIR

Rscript -e "rmarkdown::render('alerts.Rmd')"
cp alerts.html crypto

MASIGNAL=$(grep SIGNAL_ alerts.html | grep '<pre><code>' \
| grep -v 'SIGNAL_NONE' | wc -l)

if [ "$MASIGNAL" -gt 0 ] ; then

  echo "There is a new crypto market alert - visit https://blinder.cc/crypto/alerts.html for more details" \
  | mail -s "Crypto market alert" mark.ziemann@gmail.com

fi

