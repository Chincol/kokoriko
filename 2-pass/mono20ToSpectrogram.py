#!/usr/bin/env python3

from scipy import signal
import scipy.io.wavfile
import numpy
import sys

USAGE='''
Usage: {} <Input file> <Output file>

Converts a Mono20Image to a Spectrogram. Spectrogram produces three files.
<Output file>.matrix holds the spectrogram information.
<Output file>.freqs holds the information of the y-axis.
<Output file>.time time holds the information of the x-axis.
'''.format(__file__)

def main(inp, out):
	rate, data = scipy.io.wavfile.read(inp)
	freqs, times, matrix = signal.spectrogram(data)
	matrix.dump('{}.matrix'.format(out))
	freqs.dump('{}.freqs'.format(out))
	times.dump('{}.times'.format(out))

if __name__ == '__main__':
	#try:
		inp = sys.argv[1]
		out = sys.argv[2]
		main(inp, out)
		sys.exit(0)
	#except IndexError:
		print(USAGE)	
		sys.exit(1)
