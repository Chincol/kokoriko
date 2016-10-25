function preemphasisFilter(wavfile)
    [y, fs] = audioread(wavfile);
    B = [1, -0.95];
    y2 = filter(B, 1, y);
    audiowrite(strcat(wavfile, '.pre'), y2, fs);
end