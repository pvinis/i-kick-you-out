#!/usr/bin/env bash

FIREFOX_PROFILE=37i9qgqx.default-release
PATH_TO_HISTORY=~/Library/Application\ Support/Firefox/Profiles/$FIREFOX_PROFILE
PATH_TO_TMP_SUBDIR=/tmp/i-kick-you-out

# copy the file so it's not locked and we don't mess with the original
mkdir -p "$PATH_TO_TMP_SUBDIR"
cp "$PATH_TO_HISTORY"/places.sqlite "$PATH_TO_TMP_SUBDIR"/places.sqlite

# get latest meeting url
LAST_ZOOM=$(sqlite3 "$PATH_TO_TMP_SUBDIR"/places.sqlite "select url from moz_places where url like '%zoom.us/j%' order by last_visit_date desc limit 1")

# to debug, in case zoom makes funky things with the original url
# sqlite3 "$PATH_TO_TMP_SUBDIR"/places.sqlite "select url from moz_places where url like '%zoom.us/j%' order by last_visit_date desc limit 7"

LAST_ZOOM=$(echo "$LAST_ZOOM" | sed 's/[&?]status.*//')

echo "Zoom, you don't kick me out. I KICK YOU OUT."
echo "Joining $LAST_ZOOM"

open $LAST_ZOOM
