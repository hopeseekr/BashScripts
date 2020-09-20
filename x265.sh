#!/bin/bash

AUDIO=copy
if [ ! -z "$2" ]; then
    AUDIO="$2"
fi

CRF=27
if [ ! -z "$3" ]; then
    CRF="$3"
fi

mkdir -p x265
time ffmpeg -y -hide_banner -hwaccel qsv -hwaccel_device /dev/dri/renderD128 -i "$1" -c:v libx265 -preset faster -x265-params crf=${CRF} -c:a ${AUDIO} "x265/$1.mkv"
