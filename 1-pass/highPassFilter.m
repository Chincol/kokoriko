function highPassFilter(wavfile)
    [y, fs] = audioread(wavfile);
    % Loads a high pass filter that allows frequencies higher than 200 Hz
    % expects an input of 20kHz
    load('filter.mat');
    hpfy = filter(Hhp, y);
    save(strcat(wavfile,'.highpass.mat'), 'hpfy');
end%function