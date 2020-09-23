#!/bin/bash

mkdir -p x265
VIDEO=${1%.*}
#time ffmpeg -y -hide_banner -hwaccel qsv -hwaccel_device /dev/dri/renderD128 -i "$1" -c:v libx265 -preset faster -x265-params crf=27 -c:a copy "x265/${VIDEO}.mkv"
#time ffmpeg -y -hide_banner -hwaccel vaapi -vaapi_device /dev/dri/renderD128 -hwaccel_output_format vaapi -i "$1" -c:v hevc_qsv -preset slower -x265-params crf=27 -c:a copy 

# For "${@:2}" @see https://stackoverflow.com/a/9057392/430062

time LIBVA_DRIVER_NAME=iHD ffmpeg -y -hwaccel qsv -qsv_device /dev/dri/renderD128 -hwaccel_output_format qsv -i "$1" -c:v hevc_qsv -b:v 2500k -maxrate 6000k -bufsize 1200 -c:a copy "${@:2}" "x265/${VIDEO}.mkv" 
if [ "$?" -eq 0 ]; then
    mkdir -p x264
    mv "$1" x264
fi

