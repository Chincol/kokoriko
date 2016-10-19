function wavToHuman(wavfile)
	[y, fs] = audioread(wavfile);
	dt = 1/fs;
	t = 0:dt:length(y)*dt - dt;
	plot(t, y);
	xlabel('Seconds');
	ylabel('Amplitude');
end%function
