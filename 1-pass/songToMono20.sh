#!/usr/bin/env bash
__name__="$(basename ${BASH_SOURCE})"
read -r -d '' usage <<README
Usage:
${__name__} <PATH-TO-WAV-FILE> <PATH-TO-OUTPUT>
README
#important variables
channels=1
rate=20000
input=${1}
output=${2}

ffmpeg -loglevel error -r ${rate} -ac ${channels} -i ${input} ${output}
