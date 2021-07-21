#!/bin/bash

MYCMD=$(echo $0)
MYDIR=$(dirname $MYCMD)
cd $MYDIR

Rscript -e "rmarkdown::render('alerts.Rmd')"
cp alerts.html crypto

Rscript -e "rmarkdown::render('coins.Rmd')"
cp coins.html crypto

