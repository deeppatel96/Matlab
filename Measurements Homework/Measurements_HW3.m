% Deep Patel   Measurements HW 3

%%  Problem 11
close all, clear all, clc

% Part a
R1a = linspace(500,1000,1000);
E0a = @(R1a) 10*R1a./(R1a+500) - 5;
figure;
plot(R1a,E0a(R1a),'r-'); grid on;
xlabel('R1 (ohms)');ylabel('E0 (V)');
title('Problem 11: Part a - Voltage Output with varying R1');

% Part b
R1b = linspace(500,600,1000);
R2b = linspace(500,600,1000);
E0b1 = @(R1b) -R1b./110 + 5;
E0b2 = @(R2b) (1100.-R2b)./110 - 5;
figure;
plot(R1b,E0b1(R1b),'b-',R2b,E0b2(R2b),'g-'); grid on;
xlabel('R1 (ohms)');ylabel('E0 (V)');
title('Problem 11: Part b - Voltage Output with R1 & R2 changing equally in opposite directions');


% Part c
R = linspace(500,600,1000);
E = @(R) 10*((R./(R+500)) - (R./(R+500)));
figure;
plot(R, E(R), 'r-');
xlabel('R1 & R3 (ohms)');ylabel('E0 (V)');
title('Problem 11: Part c - Voltage Output with R1 & R3 changing equally');



