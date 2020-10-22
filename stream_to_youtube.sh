#!/bin/bash
#########################################################################
# YouTube CLI Livestream Screencaster                                   #
#                                                                       #
#   Live Screencast directly to YouTube from the CLI (via ffmpeg).      #
#                                                                       #
#   You need to edit the file with your key and start the stream via    #
#   YouTube's Creator Studio, first.                                    #
#                                                                       #
# Part of HopeSeekr's BashScripts Collection                            #
# https://github.com/hopeseekr/BashScripts/                             #
#                                                                       #
# Copyright © 2020 Theodore R. Smith <theodore@phpexperts.pro>          #
# GPG Fingerprint: 4BF8 2613 1C34 87AC D28F  2AD8 EB24 A91D D612 5690   #
#                                                                       #
# License: Creative Commons Attribution v4.0 International              #
#########################################################################

VBR="2500k"                                   # Bitrate de la vidéo en sortie
FPS="25"                                      # FPS de la vidéo en sortie
QUAL="medium"                                 # Preset de qualité FFMPEG
YOUTUBE_URL="rtmp://a.rtmp.youtube.com/live2" # URL de base RTMP youtube

SOURCE="udp://239.255.139.0:1234" # Source UDP (voir les annonces SAP)
KEY="xxxx-xxxx-xxxx-xxxx"         # Clé à récupérer sur l'event youtube

ffmpeg \
    -i "$SOURCE" -deinterlace \
    -vcodec libx264 -pix_fmt yuv420p -preset $QUAL -r $FPS -g $(($FPS * 2)) -b:v $VBR \
    -acodec libmp3lame -ar 44100 -threads 6 -qscale 3 -b:a 712000 -bufsize 512k \
    -f flv "$YOUTUBE_URL/$KEY"
