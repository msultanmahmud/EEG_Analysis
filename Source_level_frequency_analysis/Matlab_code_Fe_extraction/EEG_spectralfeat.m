%%% This code is written by Sultan Mahmud on 11 Nov 2018 for spectral
%%% analysis
function [thetaBand, alphaBand,betaBand,gammaBand]  = EEG_spectralfeat(EEGSignal,fs)

[n_electrodes,sing_length] = size(EEGSignal);
%welch_window_size=1;

thetaBand = nan(1, n_electrodes);
alphaBand= nan(1, n_electrodes);
betaBand = nan(1, n_electrodes);
gammaBand = nan(1, n_electrodes);


for iElec = 1:n_electrodes

    %[Pxx1,F1] = pwelch(x,63,20,[],fs);
    %[Pxx2,F2] = pwelch(x,128,[],[],fs);
    %[Pxx3,F3] = pwelch(x,128*15,[],[],fs);
    
    % Welch?s power spectral density estimate
    %[pxx,f] = pwelch(x,window,noverlap,f,fs)
    %If you omit noverlap or specify noverlap as empty, a value is used to obtain 50% overlap between segments.

    [Pxx,F] = pwelch(EEGSignal(iElec,:),[],[],[],fs);
    %% This is the band frequency accroding to the Dr. Bidelman induced paper
    thetaBand(iElec) = bandpower(Pxx,F,[5 8],'psd');
    alphaBand(iElec)= bandpower(Pxx,F,[9 13],'psd');
    betaBand(iElec)=bandpower(Pxx,F,[14 30],'psd');
    gammaBand(iElec)=bandpower(Pxx,F,[31 45],'psd');
    
%     plot(F,Pxx)
%     hold on
%     xlim([4,45])
    
end

end
