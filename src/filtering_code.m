% Load the 'noisy voice' recording
[voice_noisy, fs] = audioread('voice_noisy.wav');

% Get signal parameters
N = length(voice_noisy);
duration = N/fs;
t = (0:N-1)/fs;

% Original Noisy Voice Signal Analysis
% Time domain analysis
figure(1);
subplot(2,1,1);
plot(t, voice_noisy);
title('Original Noisy Voice Signal - Time Domain');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Frequency domain analysis
f = (0:N-1)*(fs/N);
voice_fft = fft(voice_noisy);
voice_magnitude = abs(voice_fft);

subplot(2,1,2);
plot(f(1:N/2), voice_magnitude(1:N/2));
title('Original Noisy Voice Signal - Frequency Domain');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Design IIR Butterworth High-pass Filter
order_iir = 10;
fc_iir = 440;

[b_iir, a_iir] = butter(order_iir, fc_iir/(fs/2), 'high');

% Apply IIR High-pass Filter (using 'filtfilt' for zero-phase filtering)
voice_filtered_iir_hp = filtfilt(b_iir, a_iir, voice_noisy);

% SNR Calculation
snr_before = snr(voice_noisy);
snr_after = snr(voice_filtered_iir_hp);
disp(['SNR Before: ', num2str(snr_before)]);
disp(['SNR After: ', num2str(snr_after)]);

% Filtered Voice Signal Analysis
% Time Domain Analysis
figure(2);

subplot(2,1,1);
plot(t, voice_filtered_iir_hp);
title('Filtered Voice Signal - Time Domain');
xlabel('Time (s)'); 
ylabel('Amplitude');
grid on;

% Frequency Domain Analysis
fft_iir_lp = abs(fft(voice_filtered_iir_hp));

subplot(2,1,2);
plot(f(1:N/2), fft_iir_lp(1:N/2));
title('Filtered Voice Signal - Frequency Domain');
xlabel('Frequency (Hz)'); 
ylabel('Magnitude');
grid on;

% Save the filtered audio
audiowrite('voice_filtered.wav', voice_filtered_iir_hp, fs);

% Play Audio Samples
fprintf('\n=== Audio Playback ===\n');
fprintf('Press Enter to play original noisy audio...\n');
pause;
sound(voice_noisy, fs);

fprintf('Press Enter to play filtered audio...\n');
pause;
sound(voice_filtered_iir_hp, fs);