% Deep Patel
% HW 6 - Vehicle Dynamics

%% Problem 14.28
clear all, close all, clc

g = 9.807;
b = 1.35;
c = 1.15;
W = 17000;
m = W / g;
I = 1600;
Cf = -114000;
Cr = -126000;
V = 25;
delta = 0.9*pi/180;
Nbeta = b*Cf - c*Cr;
Nomega = (1/V)*((b.^2)*Cf+(c.^2)*Cr);
Ndelta = -b*Cf;
Ybeta = Cf + Cr;
Yomega = (1/V)*(b*Cf - c*Cr);
Ydelta = -Cf;

Q = -Nbeta*Yomega + m*V*Nbeta + Ybeta*Nomega;
Ainv = (1/Q) * [Nomega, -Yomega + m*V; -Nbeta, Ybeta];
ans = - Ainv * [Ydelta; Ndelta]*delta

%% Problem 14.32
clear all, close all, clc

g = 9.807;
L = 2.75;
c = 0.56*L;
b = L-c;
m = 1650;
W = m*9.807;
I = 3200;
C = -1320*180/pi;
Wf = W*c/L;
Wr = W*b/L;
Rs = 50;
delta = 6.1*pi/180;
Kprime = Wr/C - Wf/C
K = Kprime/(g*L);
V = (Rs*delta/(K*L) - (1/K)).^(0.5)

%% Problem 15.1
clear all, close all, clc

ms = 300;
mu = 40;
ks = 15000;
kt = 160000;

m = [ms 0; 0 mu];
k = [ks -ks;-ks ks+kt];

w1 = 7.458;
w2 = 65.34;

A1 = (-(w1^2))*m + k
A2 = (-(w2^2))*m + k

% These are estimation of values; actual values are computed on paper
[U,S,V] = svd(-A1,'econ');
b1 = V(:,size(A1,2))

[U,S,V] = svd(A2,'econ');
b2 = V(:,size(A2,2))







