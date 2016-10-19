function spectrogramToHuman(infilename)
	S = load(infilename);
	surf(S.times, S.freqs, S.matrix);
	set(gca, 'YScale', 'log');
    ylim([0, 200]);
end%function
