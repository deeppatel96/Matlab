% Deep Patel
% Math 481
% Brownian Motion Computer Assignment

clear all, close all, clc

N = 10000;                  % Number of data points in Brownian motion
X = -1 + (2)*rand(N,1);     % Gives a random number between -1 and 1
Y = zeros(N+1,1);
Y(1) = 0;
for i = 1:N
    Y(i+1) = Y(i)+X(i);
end
% Y = cumsum(X);              % Gets the cumulative sum of the random number X
t = linspace(0,10,N+1);       % Sets an arbitrary time vector between time 0 and 10 seconds

% Plot
figure;
plot(t,Y,'r'); grid on;
xlabel('Time (s)','FontSize',14); ylabel('Y(t)','FontSize',14);
title('Brownian Motion Y(t)','FontSize',14);
