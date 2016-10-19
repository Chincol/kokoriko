#!/usr/bin/env bash

__name__="$(basename ${BASH_SOURCE})"
read -r -d '' usage <<README
Usage:
${__name__} <PATH-TO-WAV-FILE> <PATH-TO-OUTPUT>

Cannot handle spaces in path.
README
#important variables
channels=1
rate=20000
input="${1}"
output="${2}"

if [ -z "${input}" -o -z "${output}" ] ; then
	echo "${usage}"
	exit 1
fi

ffmpeg -i "${input}" -r "${rate}" -ac "${channels}" "${output}"
