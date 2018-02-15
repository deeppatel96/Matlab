clear all, close all, clc

file = dlmread('Section 19.txt');
frSP = dlmread('vib.txt');

sineW = file(1:4097,:);            % Sine Wave (Function Generator) Waveform                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
sineS = file(4098:4609,:);         % Sine Wave (Function Generator) Spectra                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
squareW = file(4610:8706,:);       % Square Wave (Function Generator) Waveform                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
squareS = file(8707:9218,:);       % Square Wave (Function Generator) Spectra
fr1W = file(9219:17412,:);         % Free Response (Acc. Location 1, Node of 2nd Mode) Waveform                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
fr1S = file(17413:17924,:);        % Free Response (Acc. Location 1, Node of 2nd Mode) Spectra                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
fr2W = file(17925:26118,:);        % Free Response (Acc. Location 2, End of beam) Waveform   
fr2S = file(26119:26630,:);        % Free Response (Acc. Location 2, End of beam) Spectra
frrW = file(26631:30727,:);        % Frequency Response (at Resonance) Waveform
frrS = file(30728:end,:);          % Frequency Response (at Resonance) Spectra



% Part 1
y = @(t) 0.05*sin(2*2*pi*t);
y1 = @(t) 0.0644*sin(2*2*pi*t);
y5 = @(t) 0.0644*sin(2*2*pi*t) + 0.0215*sin(6*2*pi*t) + 0.0129*sin(10*2*pi*t) + 0.009176*sin(14*2*pi*t) + 0.007127*sin(18*2*pi*t);
yall = @(t) 0.0644*sin(2*2*pi*t) + 0.0215*sin(6*2*pi*t) + 0.0129*sin(10*2*pi*t) + 0.009176*sin(14*2*pi*t) + 0.007127*sin(18*2*pi*t) + 0.005824*sin(22*2*pi*t) + 0.004982*sin(26*2*pi*t) + 0.004311*sin(30*2*pi*t) + 0.003762*sin(34*2*pi*t) + 0.003391*sin(38*2*pi*t) + 0.003096*sin(42*2*pi*t) + 0.002776*sin(46*2*pi*t) + 0.002567*sin(50*2*pi*t) + 0.002328*sin(54*2*pi*t) + 0.002242*sin(58*2*pi*t) + 0.00212*sin(62*2*pi*t) + 0.001971*sin(66*2*pi*t) + 0.001811*sin(70*2*pi*t) + 0.00177*sin(74*2*pi*t) + 0.001594*sin(78*2*pi*t) + 0.001559*sin(82*2*pi*t);

time = [0.49 0.5523 0.6236 0.6944 0.7652 0.836 0.907 0.9776 1.0489 1.1192 1.19 1.2605 1.331 1.401 1.4715 1.5418 1.6124 1.6831 1.7537 1.8245];
amp = [2.08 1.958 1.7969 1.7041 1.6455 1.597 1.5576 1.5186 1.499 1.4551 1.441 1.4112 1.3965 1.3672 1.3574 1.333 1.3232 1.2988 1.2891 1.2647];

p = polyfit(log(time),log(amp),1)  % Exponential fit
m = p(1)
b = exp(p(2))
fit = @(time) b*time.^m
for i = 1:19
    delta(i) = log(amp(i)/amp(i+1));
    T(i) = time(i+1)-time(i);
end
delta
T
w1 =  15.87
zeta = delta/(2*pi)
zeta1 = - m / w1


% Sine Wave (Function Generator) Waveform  
figure;
plot(sineW(:,1),sineW(:,3),sineW(:,1),y(sineW(:,1))); grid on;
xlabel('Time (s)'); ylabel('Waveform Amplitude (VDC)');
title('Sine Waveform');
axis([0 2 -0.06 0.07])
legend('Measured Waveform','Reconstructed Waveform','location','ne');

% Sine Wave (Function Generator) Spectra  
figure;
plot(sineS(:,1),sineS(:,3)); grid on;
xlabel('Frequency (Hz)'); ylabel('Amplitude Spectra (VDC)');
title('Sine Frequency Spectra');
axis([0 20 -0 0.06])

% Square Wave (Function Generator) Waveform  
figure;
subplot(3,1,1)
plot(squareW(:,1),squareW(:,3),squareW(:,1),y1(squareW(:,1))); grid on;
xlabel('Time (s)'); ylabel('Waveform Amplitude (VDC)');
title('Square Waveform a - with 1 peak from amplitude spectrum');
axis([0 2 -0.06 0.06])

% Square Wave (Function Generator) Waveform  
subplot(3,1,2)
plot(squareW(:,1),squareW(:,3),squareW(:,1),y5(squareW(:,1))); grid on;
xlabel('Time (s)'); ylabel('Waveform Amplitude (VDC)');
title('Square Waveform b - with 5 peaks from amplitude spectrum');
axis([0 2 -0.06 0.06])

% Square Wave (Function Generator) Waveform 
subplot(3,1,3)
plot(squareW(:,1),squareW(:,3),squareW(:,1),yall(squareW(:,1))); grid on;
xlabel('Time (s)'); ylabel('Waveform Amplitude (VDC)');
title('Square Waveform c - with all peaks from amplitude spectrum');
axis([0 2 -0.06 0.06])

% Square Wave (Function Generator) Spectra
figure;
plot(squareS(:,1),squareS(:,3)); grid on;
xlabel('Frequency (Hz)'); ylabel('Amplitude Spectra (VDC)');
title('Square Frequency Spectra');

% Free Response (Acc. Location 1, Node of 2nd Mode) Waveform                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
figure;
plot(fr1W(:,1),fr1W(:,3)); grid on;
xlabel('Time (s)'); ylabel('Waveform Amplitude (VDC)');
title('Free Response (Acc. Location 1, Node of 2nd Mode) Waveform');

% Free Response (Acc. Location 1, Node of 2nd Mode) Spectra                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
figure;
plot(fr1S(:,1),fr1S(:,3)); grid on;
xlabel('Frequency (Hz)'); ylabel('Amplitude Spectra (VDC)');
title('Free Response (Acc. Location 1, Node of 2nd Mode) Spectra');

% Free Response (Acc. Location 2, End of beam) Waveform   
figure;
plot(fr2W(:,1),fr2W(:,3)); grid on;
xlabel('Time (s)'); ylabel('Waveform Amplitude (VDC)');
title('Free Response (Acc. Location 2, End of beam) Waveform');

% Free Response (Acc. Location 2, End of beam) Spectra
figure;
plot(fr2S(:,1),fr2S(:,3)); grid on;
xlabel('Frequency (Hz)'); ylabel('Amplitude Spectra (VDC)');
title('Free Response (Acc. Location 2, End of beam) Spectra');

% Amplitude vs Time of Free Response (Acc. Location 1, Node of 2nd Mode)
figure;
plot(time, amp,'k',time, fit(time),'b');
text(0.91,1.6,'\leftarrow   1.5385 * exp(0.0219 * w1 * t)','Color','blue','FontSize',14)
xlabel('Time (s)'); ylabel('Peak Amplitude (VDC)');
title('Amplitude of Peak Values for Free Response (Acc. Location 1, Node of 2nd Mode)');
legend('Actual Amplitude Peaks','Exponential Fit','location','ne'); % ,'Curve Fit Envelope'

% Frequency Response (at Resonance) Waveform Input
figure;
subplot(2,1,1)
plot(frrW(:,1),frrW(:,2)); grid on;
xlabel('Time (s)'); ylabel('Waveform Amplitude (VDC)');
title('Frequency Response (at Resonance) Waveform Input');

% Frequency Response (at Resonance) Waveform Output
subplot(2,1,2)
plot(frrW(:,1),frrW(:,3)); grid on;
xlabel('Time (s)'); ylabel('Waveform Amplitude (VDC)');
title('Frequency Response (at Resonance) Waveform Output');


% Frequency Response (at Resonance) Spectra Input
figure;
subplot(2,1,1)
plot(frrS(:,1),frrS(:,2)); grid on;
xlabel('Frequency (Hz)'); ylabel('Amplitude Spectra (VDC)');
title('Frequency Response (at Resonance) Spectra Input');

% Frequency Response (at Resonance) Spectra Output
subplot(2,1,2)
plot(frrS(:,1),frrS(:,3)); grid on;
xlabel('Frequency (Hz)'); ylabel('Amplitude Spectra (VDC)');
title('Frequency Response (at Resonance) Spectra Output');

%% frSP is the matrix obtained in Part 3 of the Spectral Peak
table = [frSP(:,1) frSP(:,3) frSP(:,5)]
A50in = table(end,2)
A50out = table(end,3)
ratio = (table(:,3)*A50in)./(table(:,2)*A50out)
wwr = table(:,1)/13.5
G = table(:,3)/(zeta1 * pi)


figure;
plot(wwr,ratio,'b',wwr, G, 'k'); grid on;
xlabel('w/wr'); ylabel('(w / wr)^2 |Gr (i?)|');
title('Frequency Response');
legend('Experimental', 'Theoretical','location','ne');


