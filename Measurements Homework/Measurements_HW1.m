% Deep Patel    Measurements    HW 1

%% Problem 1 (1.12)
clear all, close all, clc

xi = [0, 1, 2, 3, 4, 5];
yi = [.1, 1.1, 2.1, 3, 4.1, 5];

xd = [5, 4, 3, 2, 1, 0];
yd = [5, 4.2, 3.2, 2.2, 1.2, .2];

figure;
plot(xi,yi,'ro-',xd,yd,'b*-'); grid on;
xlabel('x');ylabel('y');title('Voltmeter Calibration Data');
legend('Increasing mV','Decreasing mV','Location','se')


%% Problem 2a (1.14)
clear all, close all, clc
% Part c
x = [0:1:9];
y = x;
for i = 1:10
    y(i) = 2*x(i)^0.5;
end

figure;
plot(x,y,'ro-'); grid on;
xlabel('x (m)');ylabel('y (V)');title('Problem 1.14c: Rectangular Coordinate Format');

figure;
loglog(x,y,'b*-'); grid on;
xlabel('log(x)  (m)');ylabel('log(y) (V)');title('Problem 1.14c Solution: Full-Log Format');

% Part d
x = [0:1:9];
y = x;
for i = 1:10
    y(i) = 10*x(i)^4;
end

figure;
plot(x,y,'ro-'); grid on;
xlabel('x (m)');ylabel('y (V)');title('Problem 1.14d: Rectangular Coordinate Format');

figure;
loglog(x,y,'b*-'); grid on;
xlabel('log(x) (m)');ylabel('log(y) (V)');title('Problem 1.14d Solution: Full-Log Format');

% Part e
x = [0:1:9];
y = x;
for i = 1:10
    y(i) = 10*exp(-2*(i));
end

figure;
plot(x,y,'ro-'); grid on;
xlabel('x (m)');ylabel('y (V)');title('Problem 1.14e: Rectangular Coordinate Format');

figure;
semilogy(x,y,'b*-'); grid on;
xlabel('x (m)');ylabel('log(y) (V)');title('Problem 1.14e Solution: Semilog Format');

%% Problem 6 (3.5)
clear all, clc

x = [32:0.1:120];
y = @(x) 120-88*exp(-x/30);



figure;
plot(x,y(x),'ro-'); grid on;
xlabel('x (m)');ylabel('y (V)');title('Problem 3.5: Time Response of Thermometer');
