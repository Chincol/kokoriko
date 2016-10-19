#!/usr/bin/env bash

__name__=$(basename "${BASH_SOURCE}")
read -r -d '' usage <<README
Usage:
${__name__} <PATH-TO-INPUT-DIR> <PATH-TO-OUTPUT-DIR>

Cannot handle spaces in path.
README

input="${1}"
output=$(realpath "${2}")

if [ -z "${input}" -o -z "${output}" ] ; then
	echo "${usage}"
	exit 1
fi

while read -r infilename; do
	infilename=$(realpath ${infilename})
	filename=$(basename "${infilename}")
	outfilename="${output}/${filename/.*}.mono.wav"
	./songToMono20.sh "${infilename}" "${outfilename}"
done < <(find -L "${input}" -name '*.wav' )
