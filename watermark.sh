#!/bin/bash

ffmpeg -i "$1" -i /code/SurviveCorona.how/src/assets/transparent_hopeseekr_twitter.png -filter_complex "overlay=10:10" -codec:a copy "$2"
