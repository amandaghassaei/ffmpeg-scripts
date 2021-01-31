#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied: pass in directory to process."
    exit 1
fi

# Split only on newlines (allow spaces in filename/directory).
OIFS="$IFS"
IFS=$'\n'

# In case height/width not divisible by 2, cut a row of px off:
# crop=floor(iw/2)*2:floor(ih/2)*2

for i in `find "$1" -name "*.webm" -type f`;
  do name=`echo "$i" | cut -d'.' -f1`
  echo "$i"
  ffmpeg -i "$i" -vf "crop=floor(iw/2)*2:floor(ih/2)*2" -crf 1 -c:v libx264 "${name}.mp4"
done