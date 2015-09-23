#!/bin/bash
# Inspired by https://github.com/getpelican/pelican/wiki/Tips-n-Tricks
CMD="$1"
NAME="$2"
PRIMARY_TAG="$3"

if [[ -z $CMD ]]; then
   echo "Please give which command to execute"
   exit 1
fi

if [[ -z $NAME ]]; then
    echo "Please provide name of the file"
    exit 1
fi
BASEDIR=$(pwd)
INPUTDIR=$BASEDIR/content

ARTDIR=$INPUTDIR/articles
PAGESDIR=$INPUTDIR/pages

TODATE=$(date +'%Y-%m-%d')
SLUG=$(echo $NAME | sed -e 's/[^[:alnum:]]/-/g' | tr -s '-' | tr A-Z a-z)
EXT=md
FILE_NAME="${TODATE}_${SLUG}"

if [[ -z $PRIMARY_TAG ]]; then
    POST_NAME=${NAME}
else
    PRIMARY_TAG=$(echo $PRIMARY_TAG | tr A-Z a-z)
    POST_NAME="[${PRIMARY_TAG}] ${NAME}"
fi


if [[ $CMD == "newpost" ]]; then
    echo "Title: $POST_NAME" >  $ARTDIR/$FILE_NAME.$EXT
    echo "Slug: $SLUG" >> $ARTDIR/$FILE_NAME.$EXT
    echo "Date: $TODATE" >> $ARTDIR/$FILE_NAME.$EXT
    echo ""              >> $ARTDIR/$FILE_NAME.$EXT
    echo ""              >> $ARTDIR/$FILE_NAME.$EXT
fi


if [[ $CMD == "newpage" ]]; then
    echo "Title: $POST_NAME" >  $PAGESDIR/$FILE_NAME.$EXT
    echo "Slug: $SLUG" >> $PAGESDIR/$FILE_NAME.$EXT
    echo ""              >> $PAGESDIR/$FILE_NAME.$EXT
    echo ""              >> $PAGESDIR/$FILE_NAME.$EXT
fi


