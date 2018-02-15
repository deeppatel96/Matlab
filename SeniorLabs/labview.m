clear all, close all, clc

A = dlmread('labviewa1.txt');
timeA = A(:,1)
waveAmpA = A(:,2);
freqA = A(:,3);
freqAmpA = A(:,4);

B = dlmread('labviewa2.txt');
timeB = B(:,1)
waveAmpB = B(:,2);
freqB = B(:,3);
freqAmpB = B(:,4);

C = dlmread('labviewa3.txt');
timeC = C(:,1);
waveAmpC = C(:,2);
freqC = C(:,3);
freqAmpC = C(:,4);

D = dlmread('labviewa4.txt');
timeD = D(:,1);
waveAmpD = D(:,2);
freqD = D(:,3);
freqAmpD = D(:,4);

E = dlmread('labviewa5.txt');
timeE = E(:,1);
waveAmpE = E(:,2);
freqE = E(:,3);
freqAmpE = E(:,4);

F = dlmread('labviewa6.txt');
timeF = F(:,1);
waveAmpF = F(:,2);
freqF = F(:,3);
freqAmpF = F(:,4);


figure;
subplot(3,1,1);
plot(timeA(1:100), waveAmpA(1:100), 'r-'); grid on;
xlabel('Time (seconds)'); ylabel('Amplitude (voltage)');
title('500 Hz Sine Wave');
axis([0 0.008 -1.5 1.5]);

subplot(3,1,2);
plot(timeB(1:100), waveAmpB(1:100), 'b-'); grid on;
xlabel('Time (seconds)'); ylabel('Amplitude (voltage)');
title('1000 Hz Sine Wave');
axis([0 0.008 -1.5 1.5]);

subplot(3,1,3);
plot(timeC(1:100), waveAmpC(1:100), 'k-'); grid on;
xlabel('Time (seconds)'); ylabel('Amplitude (voltage)');
title('3000 Hz Sine Wave');
axis([0 0.008 -1.5 1.5]);

figure;
plot(timeF(1:100), waveAmpF(1:100), 'b-'); grid on;
xlabel('Time (seconds)'); ylabel('Amplitude (voltage)');
title('Triangle Wave');
axis([0 0.008 -1.5 1.5]);


figure;
subplot(2,1,1);
plot(timeE(1:100), waveAmpE(1:100), 'b-'); grid on;
xlabel('Time (seconds)'); ylabel('Amplitude (voltage)');
title('1000 Hz Input Sine Wave measured at 2500 Hz Sampling Rate');
axis([0 0.008 -1.5 1.5]);

subplot(2,1,2);
plot(timeD(1:100), waveAmpD(1:100), 'r-'); grid on;
xlabel('Time (seconds)'); ylabel('Amplitude (voltage)');
title('1000 Hz Input Sine Wave measured at 500 Hz Sampling Rate');
axis([0 0.008 -1.5 1.5]);

figure;
plot(timeD(1:100), waveAmpD(1:100), 'r-'); grid on;
xlabel('Time (seconds)'); ylabel('Amplitude (voltage)');
title('Zoom out view of: 1000 Hz Input Sine Wave measured at 500 Hz Sampling Rate');
axis([0 0.08 -1.5 1.5]);
set(gca, 'XTick', [0 0.008 0.016 0.024 0.032 0.040 0.048 0.056 0.064 0.072 0.08])

%%

clear all, close all, clc

T = readtable('deep_thermo.xlsx');
A = table2array(T)
time = A(:,1)*0.5;
waveAmp = A(:,2);

figure;
plot(time, waveAmp,'r-'); grid on;
xlabel('Time (seconds)'); ylabel('Temperature (degrees C)');
title('Temperature vs. Time');






