#!/bin/bash

# first get a list of coins that have backtesting data.
find ../coin_script/ \
| grep summary_ | grep html$ \
| rev | cut -d '/' -f1 | rev \
| cut -d '.' -f1 | cut -d '_' -f2 > coins.txt

# now make the alerts_xx.Rmd script for each
for COIN in `cat coins.txt` ; do

  echo $COIN
  coin=$(echo $COIN | tr '[:upper:]' '[:lower:]' )
  sed "s/TRX/${COIN}/g" alerts_TRX.Rmd \
  | sed "s/trx/${coin}/g" > tmp
  mv tmp alerts_${COIN}.Rmd

done
