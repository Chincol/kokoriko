function plotFrequencies(wavfile)
    [y, fs] = audioread(wavfile);
    spectrogram(y, 126, 32, [], fs, 'yaxis');
    N = size(y, 1);
    df = fs/N;
    w = (-(N/2):(N/2)-1)*df;
    y2 = fft(y(:,1),N)/N;
    y3 = fftshift(y2);
    plot(w, abs(y3));
end%function