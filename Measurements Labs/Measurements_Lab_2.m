% Measurements Lab 2 Results

%%  1. Room
clear all, close all, clc

% Part a
L = [288.9, 289.3, 289.1, 289, 289.2, 289.1];
W = [227.5, 227.5, 227.3, 227.4, 227.5, 227.6];

% Mean dimensions of room
Lm = sum(L)/size(L,2)
Wm = sum(W)/size(W,2)

Ld = 0; Wd = 0;
for i = 1:size(L,2)
    Ld = Ld + (L(i)-Lm)^2;
    Wd = Wd + (W(i)-Wm)^2;
end

% Standard Deviation
Ls = Ld^0.5
Ws = Wd^0.5


% Part b



%%  2. L-Block

% Part a

% Tape Measure
T1 = [0.611 0.591 0.597];
T2 = [0.521 0.522 0.518];
T3 = [1.041 1.042 1.041];
T4 = [2.3689 2.3641 2.3664];
T5 = [0.250 0.250 0.2495];
T6 = [0.251 0.251 0.254];
T7 = [2.010 2.013 2.010];
T8 = [2.014 2.010 2.011];

% Mean dimensions for tape measure (in inches)
mT1 = sum(T1)/3
mT2 = sum(T2)/3
mT3 = sum(T3)/3
mT4 = sum(T4)/3
mT5 = sum(T5)/3
mT6 = sum(T6)/3
mT7 = sum(T7)/3
mT8 = sum(T8)/3

uT1 = 0;
uT2 = 0;
uT3 = 0;
uT4 = 0;
uT5 = 0;
uT6 = 0;
uT7 = 0;
uT8 = 0;
for i = 1:size(T1,2)
    uT1 = uT1 + (T1(i)-mT1)^2;
    uT2 = uT2 + (T2(i)-mT2)^2;
    uT3 = uT3 + (T3(i)-mT3)^2;
    uT4 = uT4 + (T4(i)-mT4)^2;
    uT5 = uT5 + (T5(i)-mT5)^2;
    uT6 = uT6 + (T6(i)-mT6)^2;
    uT7 = uT7 + (T7(i)-mT7)^2;
    uT8 = uT8 + (T8(i)-mT8)^2;
end

% Uncertainty in inches (2 standard deviations)
uT1 = uT1^0.5
uT2 = uT2^0.5
uT3 = uT3^0.5
uT4 = uT4^0.5
uT5 = uT5^0.5
uT6 = uT6^0.5
uT7 = uT7^0.5
uT8 = uT8^0.5

% Caliper
C1 = [0.602 0.595 0.599];
C2 = [0.521 0.520 0.519];
C3 = [1.043 1.041 1.042];
C4 = [2.366 2.3612 2.3612];
C5 = [0.251 0.2525 0.2495];
C6 = [0.254 0.254 0.254];
C7 = [2.011 2.010 2.012];
C8 = [2.009 2.010 2.012];

% Mean dimensions for caliper (in inches)
mC1 = sum(C1)/3
mC2 = sum(C2)/3
mC3 = sum(C3)/3
mC4 = sum(C4)/3
mC5 = sum(C5)/3
mC6 = sum(C6)/3
mC7 = sum(C7)/3
mC8 = sum(C8)/3

uC1 = 0;
uC2 = 0;
uC3 = 0;
uC4 = 0;
uC5 = 0;
uC6 = 0;
uC7 = 0;
uC8 = 0;
for i = 1:size(T1,2)
    uC1 = uC1 + (C1(i)-mC1)^2;
    uC2 = uC2 + (C2(i)-mC2)^2;
    uC3 = uC3 + (C3(i)-mC3)^2;
    uC4 = uC4 + (C4(i)-mC4)^2;
    uC5 = uC5 + (C5(i)-mC5)^2;
    uC6 = uC6 + (C6(i)-mC6)^2;
    uC7 = uC7 + (C7(i)-mC7)^2;
    uC8 = uC8 + (C8(i)-mC8)^2;
end

% Uncertainty in inches (2 standard deviations)
uC1 = uC1^0.5
uC2 = uC2^0.5
uC3 = uC3^0.5
uC4 = uC4^0.5
uC5 = uC5^0.5
uC6 = uC6^0.5
uC7 = uC7^0.5
uC8 = uC8^0.5

% Part b

% Tape measure

vT  = (mT8*mT5*mT4)+((mT7-mT5)*mT6*mT4)-(pi*mT1*mT1/4*mC5)

pT1 = uT1/mT1;
pT4 = uT4/mT4;
pT5 = uT5/mT5;
pT6 = uT6/mT6;
pT7 = uT7/mT7;
pT8 = uT8/mT8;

uT = ((pT1*2)+(2*pT4)+(3*pT5)+pT6+pT7+pT8)*vT

% Caliper

vC  = (mC8*mC5*mC4)+((mC7-mC5)*mC6*mC4)-(pi*mC1*mC1/4*mC5)

pC1 = uC1/mC1;
pC4 = uC4/mC4;
pC5 = uC5/mC5;
pC6 = uC6/mC6;
pC7 = uC7/mC7;
pC8 = uC8/mC8;

uC = ((pC1*2)+(2*pC4)+(3*pC5)+pC6+pC7+pC8)*vC


% Part d
format long
% number of parts defective per 100000 parts
x = 100000 - ((1 - 1/(3.5*10^6))^8 * 100000)
format short
% Money wasted, at most
m = vC*0.85
