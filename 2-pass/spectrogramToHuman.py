#!/usr/bin/env python3

import matplotlib
matplotlib.use('Agg')
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
	plt.pcolormesh(data['times'][0], data['freqs'][0], data['matrix'])
	plt.ylabel('Frequency [Hz]')
	plt.xlabel('Time [sec]')
	plt.savefig('spec.pdf')

if __name__ == '__main__':
	try:
		args = parser.parse_args()
		inp = args.sgram
		main(inp)
		sys.exit(0)
	except IndexError:
		parser.print_help()
		sys.exit(1)
