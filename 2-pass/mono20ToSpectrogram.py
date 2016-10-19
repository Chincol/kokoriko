#!/usr/bin/env python3

from scipy import signal
import scipy.io.wavfile
import numpy
import sys
import argparse


USAGE='''Converts a Mono20 wav file to a spectrogram.
Saves the result in a .mat file to allow the use of matlab.'''

parser = argparse.ArgumentParser(description=USAGE)
parser.add_argument('wav', type=str, help='Input audio file')
parser.add_argument('out', type=str, help='Output spectrogram file')
parser.add_argument('--sampling-frequency', default=20000, type=int, help='Sampling frequency')
parser.add_argument('--overlap', type=int, help='Number of points to overlap between segments')
args = parser.parse_args()

def main(inp, out):
	rate, data = scipy.io.wavfile.read(inp)
	freqs, times, matrix = signal.spectrogram(data, fs=args.sampling_frequency)
	saveas = { 'freqs' : freqs,
		'times' : times,
		'matrix' : matrix,
	}
	scipy.io.savemat(out, saveas)

if __name__ == '__main__':
	try:
		inp = args.wav
		out = args.out
		main(inp, out)
		sys.exit(0)
	except IndexError:
		parser.print_help()
		sys.exit(1)
