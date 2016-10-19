#!/usr/bin/env python3

import matplotlib.pyplot as plt
import numpy
import scipy.io
import sys
import argparse

USAGE='''Plots a spectrogram.
'''

parser = argparse.ArgumentParser(description=USAGE)
parser.add_argument('sgram', type=str, help='Input spectrogram data')


def main(inp):
	data = scipy.io.loadmat(inp)
	print(data['times'])
	plt.pcolormesh(data['times'], data['freqs'], data['matrix'])
	plt.ylabel('Frequency [Hz]')
	plt.xlabel('Time [sec]')
	plt.show

if __name__ == '__main__':
	try:
		args = parser.parse_args()
		inp = args.sgram
		main(inp)
		sys.exit(0)
	except IndexError:
		parser.print_help()
		sys.exit(1)
