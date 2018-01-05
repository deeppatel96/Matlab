%% Deep Patel Measurements Lab 1
clear all, close all, clc

% Part a
f = [100, 1000, 2000, 4000, 5000]
w = f.*(2*pi)
tau = 108/(10.^6)
V_ratio = [0.997, 0.838, 0.603, 0.378, 0.307]
x = w*tau

figure;
plot(x, V_ratio, 'r-o')
xlabel('tau*omega'); ylabel('V_out / V_in'); 
title('3a: First Order Magnitude Response Curve')

% Part b
tau2 = 102/(10.^6)
M = 1./((1 + (w.*tau2).^2).^(0.5))
figure;
plot(w, V_ratio, 'r-o',w,M,'b-o')
xlabel('omega'); ylabel('V_out / V_in'); 
legend('experimental','theoretical'); 
title('3b: First Order Magnitude Response Curve')
