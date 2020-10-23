#!/usr/bin/env bash
#########################################################################
# Video Watermarker                                                     #
#                                                                       #
#   Easily embed your own image watermark onto videos (via ffmpeg).     #
#                                                                       #
# Part of HopeSeekr's BashScripts Collection                            #
# https://github.com/hopeseekr/BashScripts/                             #
#                                                                       #
# Copyright © 2020 Theodore R. Smith <theodore@phpexperts.pro>          #
# GPG Fingerprint: 4BF8 2613 1C34 87AC D28F  2AD8 EB24 A91D D612 5690   #
#                                                                       #
# License: Creative Commons Attribution v4.0 International              #
#########################################################################

# @FIXME: This *really* needs to be abstracted out.
ffmpeg -i "$1" -i /code/SurviveCorona.how/src/assets/transparent_hopeseekr_twitter.png -filter_complex "overlay=10:10" -codec:a copy "$2"
