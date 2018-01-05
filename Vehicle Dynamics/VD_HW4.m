% Vehicle Dynamics HW 4

clear all, clc, close all

n = 0;
alpha = [0 1 2 3 4 5 6 7]
F = [0 500 1000 1500 1950 2400 2850 3100]
alpha = [zeros(1,n) alpha];
F = [zeros(1,n) F];

figure;
plot(alpha, F, 'bo-');
grid on;

length(alpha)
length(F)
q1 = 0;
q2 = 0;
q3 = 0;
q4 = 0
y1 = 0;
y2 = 0;
y3 = 0;
for i = 1:length(alpha)
    q1 = q1 + alpha(i);
    q2 = q2 + alpha(i).^2;
    q3 = q3 + alpha(i).^3;
    q4 = q4 + alpha(i).^4;
    y1 = y1 + F(i);
    y2 = y2 + alpha(i)*F(i);
    y3 = y3 + (alpha(i).^2) * F(i);
end
q1
q2
q3
q4
y1
y2
y3

x = [length(alpha) q1 q2; q1 q2 q3; q2 q3 q4]
y = [y1 y2 y3]'

A = inv(x)* y


x1 = linspace(0,7,1000);
y1 = x1*A(2)+A(3)*(x1.^2);
hold on;
plot(x1,y1,'r')





