#!/usr/bin/env bash
__name__="$(basename ${BASH_SOURCE})"
read -r -d '' usage <<README
Usage:
${__name__} <PATH-TO-WAV-FILE>

Plots mono wav file in matlab.
README

input="${1}"
if [ -z "${input}" ] ; then
	echo "${usage}"
	exit 1
fi

read -r -d '' matlab_commands <<MATLAB
wavToHuman('${input}');
MATLAB

matlab -nosplash -r "${matlab_commands}"
