function spectrogramToHuman(infilename)
	S = load(infilename);
	surf(S.times, S.freqs, S.matrix);
end%function
