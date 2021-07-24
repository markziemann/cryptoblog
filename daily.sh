#!/bin/bash
#55 9 * * * bash /home/pi/projects/cryptoblog/daily.sh
MYCMD=$(echo $0)
MYDIR=$(dirname $MYCMD)
cd $MYDIR

Rscript -e "rmarkdown::render('alerts.Rmd')"
cp alerts.html crypto
sleep 11m
Rscript -e "rmarkdown::render('coins.Rmd')"
cp coins.html crypto

