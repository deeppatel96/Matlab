% Deep Patel    Measurements    HW 2

%% Problem 1 (4.6)
clear all, close all, clc

f = [51.9,51.0,50.3,49.6,51.0,50.0,48.9,50.5,50.9,52.4,51.3,50.7,52.0,...
    49.4,49.7,50.5,50.7,49.4,49.9,49.2]
K = (1.87 * ((size(f,2)-1)^0.4)) + 1
x = [1 2 3 4 5 6 7 8]

figure;
hist(f, K); xlabel('x'); ylabel('f(x)'); 
title('Problem 1 (4.6)  Histogram');

%% Problem 2 (4.9)
clear all, close all, clc

f1 = [51.9, 51.0, 50.3, 49.6, 51.0, 50.0, 48.9, 50.5, 50.9, 52.4, 51.3,... 
    50.7, 52.0, 49.4, 49.7, 50.5, 50.7, 49.4, 49.9, 49.2];
f2 = [51.9, 48.7, 51.1, 51.7, 49.9, 48.8, 52.5, 51.7, 51.3, 52.6, 49.4,... 
    50.3, 50.3, 50.2, 50.9, 52.1, 49.3, 50.7, 50.5, 49.7];
f3 = [51.1, 50.1, 51.4, 50.5, 49.7, 51.6, 51.0, 49.5, 52.4, 49.5, 51.6,... 
    49.4, 50.8, 50.8, 50.2, 50.1, 52.3, 48.9, 50.4, 51.5];

% Sample Size (same for all)
N = size(f1,2)

% Sample Mean Values
xm1 = sum(f1)/N
xm2 = sum(f2)/N
xm3 = sum(f3)/N

s1 = 0;
s2 = 0;
s3 = 0;
for i = 1:N
    s1 = s1 + ((f1(i) - xm1)^2);
    s2 = s2 + ((f2(i) - xm2)^2);
    s3 = s3 + ((f3(i) - xm3)^2);
end

% Standard Deviations
s1 = (s1/(N-1))^(1/2)
s2 = (s2/(N-1))^(1/2)
s3 = (s3/(N-1))^(1/2)

% Degrees of Freedom for all
v = N-1

% Standard Deviation of the means
sm1 = s1/(N^(1/2))
sm2 = s2/(N^(1/2))
sm2 = s3/(N^(1/2))

%% Problem 4 (4.19)
clear all, close all, clc

x = [204.5, 231.1, 157.5, 190.5, 261.6, 127.0, 216.6, 172.7, 243.8, 291.0]
N = 10
xm = sum(x)/N       % Mean
s = 0;
for i = 1:N
    s = s + ((x(i)-xm)^2);
end
s = s/(N-1)         % Variance
sd = s^(1/2)        % Standard Deviation
z = (203-xm)/sd     % z variable
p = 1 - normcdf(z)  % Probability of >203 micrometers

%% Problem 5 (4.25)
clear all, close all, clc

N1 = 16;
N2 = 21;
N3 = 9;
x1 = 32;
x2 = 30;
x3 = 34;
s1 = 3;
s2 = 2;
s3 = 6;

% Pooled mean value:
xm = (N1*x1 + N2*x2 + N3*x3) / (N1 + N2 + N3)

v1 = N1-1;
v2 = N2-1;
v3 = N3-1;

% Pooled sample standard deviation
sp = ((v1*s1*s1 + v2*s2*s2 + v3*s3*s3) / (v1 + v2 + v3))^(.5)

% Pooled sample standard deviation of the means
spm = sp / ((N1+N2+N3)^0.5)

%Degrees of freedom
dof = v1+v2+v3
tvPs = 2.021*spm

% Range in which the true mean should lie with 95% confidence
range = [xm-tvPs, xm+tvPs]

%% Problem 6 (4.27)
clear all, close all, clc

% Using Chauvenet?s criterion b/c it is a small data set

x = [923 932 908 932 919 916 927 931 926 923];
N = 10;
xm = sum(x) / N
v = 0;
for i = 1:N
    v = v + (xm-x(i))^2;
end
v = v/(N-1)         % variance
sd = v^0.5          % standard deviation
sdm = sd / (N^0.5)  % standard deviation of the means
tvP = 3.169         % for P = 99%
tvPs = tvP*sdm
range = [xm - tvPs, xm + tvPs]

% 908 is an outlier because it is very far from the range of 99 prob

x = [923 932 932 919 916 927 931 926 923];
N = 9;

% True mean
txm = sum(x) / N        

%% Problem 7 (4.30)
clear all, close all, clc

N = 5;
X = [0.4 1.1 1.9 3.0 5.0]
Y = [2.7 3.6 4.4 5.2 9.2]

p = polyfit(X,Y,3)
x1 = linspace(0,6);
y1 = polyval(p,x1);
figure;
plot(X,Y,'bo')
hold on
plot(x1,y1,'r-')
hold off
xlabel('X'); ylabel('Y');
title('Problem 4.30: 3rd order polynomial fit');

K = [3*p(1), 2*p(2), p(3)]
Kx = [0 0 0 0 0];
yc = [0 0 0 0 0];
for i = 1:N
    Kx(i) = K(1)*X(i)^2 + K(2)*X(i) + K(3);
    yc(i) = p(1)*X(i)^3 + p(2)*X(i)^2 + p(3)*X(i) + p(4);
end
% Static Sensitivity
Kx
% Regression Model Y values
yc

sd = 0;
for i = 1:N
    sd = sd + (Y(i) - yc(i))^2;
end
sd = sd / (N-1);
% Standard Deviation
sd = sd^0.5

% Mean of x data
xm = sum(X) / N;
t = 2.77;

% Equation 4.39 interval
tvPs = t*sd/(N^0.5)