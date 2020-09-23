#!/bin/bash

dir=${1-$PWD}

# @see https://stackoverflow.com/a/18617295/430062
files=($dir/*)
printf "%s\n" "${files[RANDOM % ${#files[@]}]}"

