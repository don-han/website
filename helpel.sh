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
DRAFTDIR=$INPUTDIR/draft

TODATE=$(date +'%Y-%m-%d')
SLUG=$(echo $NAME | sed -e 's/[^[:alnum:]]/-/g' | tr -s '-' | tr A-Z a-z)
EXT=md
FILE_NAME="${TODATE}_${SLUG}.$EXT"

ARTFILE=$ARTDIR/$FILE_NAME
PAGESFILE=$PAGESDIR/$FILE_NAME
DRAFTFILE=$DRAFTDIR/$FILE_NAME


if [[ -z $PRIMARY_TAG ]]; then
    POST_NAME=${NAME}
else
    PRIMARY_TAG=$(echo $PRIMARY_TAG | tr A-Z a-z)
    POST_NAME="[${PRIMARY_TAG}] ${NAME}"
fi


if [[ $CMD == "newpost" ]]; then
    echo "Title: $POST_NAME" >  $DRAFTFILE
    echo "Slug: $SLUG" >> $DRAFTFILE
    echo "Date: $TODATE" >> $DRAFTFILE
    echo "status: draft" >> $DRAFTFILE
    echo ""              >> $DRAFTFILE
    echo ""              >> $DRAFTFILE
fi


if [[ $CMD == "newpage" ]]; then
    echo "Title: $POST_NAME" >  $PAGESDIR/$FILE_NAME
    echo "Slug: $SLUG" >> $PAGESDIR/$FILE_NAME
    echo "status: draft" >> $PAGEDIR/$FILE_NAME
    echo ""              >> $PAGESDIR/$FILE_NAME
    echo ""              >> $PAGESDIR/$FILE_NAME
fi


