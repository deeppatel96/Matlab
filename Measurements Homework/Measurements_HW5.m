% Deep Patel    Measurements    HW 5

%% Problem 5 (8.24)
clear all, close all, clc

T = [0.00 20.50 40.00 60.43 80.25 100.65];
emf = [0.010 1.038 2.096 3.207 4.231 5.336];
P1 = polyfit(emf,T,1)
P2 = polyfit(emf,T,2)
P3 = polyfit(emf,T,3)
x = 0:0.05:6;
y1 = @(x) P1(1)*x + P1(2);
y2 = @(x) P2(1)*x.^2 + P2(2)*x + P2(3);
y3 = @(x) P3(1)*x.^3 + P3(2)*x.^2 + P3(3)*x + P3(4);

figure;
hold on
plot(emf,T,'k.','MarkerSize',20); grid on;
plot(x,y1(x),'r-')
plot(x,y2(x),'g-')
plot(x,y3(x),'b-')
title('Problem 5 (8.24) Polynomial Fits','FontSize',14)
xlabel('EMF (mV)','FontSize',14);ylabel('Temperature (°C)','FontSize',14);
legend('Data','1st Order Fit','2nd Order Fit','3rd Order Fit','location','nw')

s1 = 0;
for i = 1:length(T)
    s1 = s1 + (T(i) - y1(emf(i))).^2;
end
s1 = s1.^0.5

s2 = 0;
for i = 1:length(T)
    s2 = s2 + (T(i) - y2(emf(i))).^2;
end
s2 = s2.^0.5

s3 = 0;
for i = 1:length(T)
    s3 = s3 + (T(i) - y3(emf(i))).^2;
end
s3 = s3.^0.5

%% Problem 6 (10.2)
clc, clear all, close all
U1 = [25.31 22.48 21.66 15.24 5.12];
U2 = [24.75 22.20 21.53 13.20 6.72];
U3 = [25.10 22.68 21.79 14.28 5.35];
r = [1 3 5 7 9];
A = r*2*2*pi;
Q1 = U1.*A;
Q1s = sum(Q1);
Q2 = U2.*A;
Q2s = sum(Q2);
Q3 = U3.*A;
Q3s = sum(Q3);
Q = (Q1s+Q2s+Q3s)/3
