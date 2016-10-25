function medianFilter(wavfile)
    [y, fs] = audioread(wavfile);
    y_median = medfilt1(y, 10);
    audiowrite(strcat(wavfile, '.median'), y_median, fs);
end