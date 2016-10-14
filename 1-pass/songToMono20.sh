#!/usr/bin/env bash
__name__="$(basename ${BASH_SOURCE})"
read -r -d '' usage <<README
Usage:
${__name__} <PATH-TO-WAV-FILE> <PATH-TO-OUTPUT>
README
#important variables
channels=1
rate=20000

input=${1:-x}
output=${2:-x}
test "${input}" != x -a "${output}" != x
areArgumentsSet=$?
if [ ! $areArgumentsSet ] ; then
	echo $usage
fi

test -f "${output}"
willOutputBeRewritten=$?
if [ $willOutputBeRewritten ] ; then
	read -r -d '' errorMsg <<TOPRINT
Output "${output}" already exists. Please delete the file to proceed.
TOPRINT
	(>&2 echo "${errorMsg}")
	exit -1
fi

test -f "${input}"
doesInputExists=$?
if [ ! $doesInputExists ] ; then
	read -r -d '' errorMsg <<TOPRINT
Input file "${input}" does not exist.
TOPRINT
	(>&2 echo "${errorMsg}")
	exit -2
fi

outputdir=$(basename "${output}")
test -f "${input}" -a -d "${outputdir}" -a
doesOutputDirectoryExist=$?
if [ ! $doesOutputDirectoryExist ] ; then
	read -r -d errorMsg <<TOPRINT
Output directory "${outputdir}" does not exist.
TOPRINT
	(>&2 echo "${errorMsg}")
	exit -3
fi

ffmpegPath=$(which ffmpeg)
whichFfmpeg=${ffmpegPath:-x}
test ${whichFfmpeg} != "x"
doesFfmpegExists=$?
if [ ! ${doesFfmpegExist} ] ; then
	read -r -d errorMsg <<TOPRINT
Command ffmpeg is not installed. Please install to use this script.
TOPRINT
	(>&2 echo "${errorMsg}")
	exit -4
fi

ffmpeg \
	-i ${input} \
	-channels ${channels} \
	-rate ${rate} \
	${output}
