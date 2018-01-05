% Measurements Lab 6 Calculations

%%  1. 
clear all, close all, clc

% Part a
RT = 23;                 % Room temp in degrees C

% Part b
T0 = 3.2;                % Ice bath temp in degrees C

% Part c
RTD_R0 = 100.9;       % Ohms

% Part d
T_R0 = 7.05693e3;        % Ohms

% Part e
Ve = 2.701e-3;           % Volts

% Part f
Vf = 0.725e-3;           % Volts

% Part g-h
T = [0 25.1 35.1 45.1 55.1];                    % degrees C
T_K = [0 25.1 35.1 45.1 55.1]+273.15;                    % K
V = [0 1.037 1.378 1.750 2.161]*1e-3;            % Volts
RTD = [RTD_R0/1000 0.110013 0.11387 0.11768 0.12153]*1e3;     % Ohms
Therm = [T_R0/1000 2.2428 1.4697 0.98199 0.67362]*1e3;    % Ohms


a = polyfit(T,(RTD./RTD_R0)-1,1)
xa = 0:0.05:60;
ya = a(1)*xa + a(2);

b = polyfit((1./T_K)-(1/273.15),log(Therm./T_R0),1)
xb = -7:0.05:0;
yb = b(1)*xb + b(2);

figure;
plot(T,(RTD./RTD_R0)-1,'ro',xa,ya,'k-','MarkerSize',12,'LineWidth',2); grid on;
xlabel('T-T_{0} (K)'); ylabel('R/R_{0} - 1');
axis([0 60 0 0.25])
legend('R/R_{0}','Linear R/R_{0}','location','nw')

figure;
plot((1./T_K)-(1/273.15),log(Therm./T_R0),'bo',xb,yb,'k-','MarkerSize',12,'LineWidth',2); grid on;
xlabel('1/T - 1/T_{0} (K^{-1})'); ylabel('ln(R/R_{0})');
axis([-0.0007 0 -2.5 0])
legend('R/R_{0}','Linear R/R_{0}','location','nw')


% Part i: Thermopile
RTD_Ri = 0.1225e3;       % Ohms
T_Ri = 0.67153e3;        % Ohms
Vi = 3.476e-3;           % Volts
Ti = 55.4;               % degrees C

T_RTD = (RTD_Ri/RTD_R0-1)/a(1)
T_Therm = (1/((log(T_Ri/T_R0)/b(1)) + (1/273.15)))-273.15


temp = [25.1 35.1 45.1 55.1];
emf_t = [1 1.407 1.817 2.23]
emf_m = [1.037 1.378 1.750 2.161];

figure;
plot(temp,emf_t,'ro-',temp,emf_m,'bo-','MarkerSize',10,'LineWidth',2); grid on;
axis([20 60 0.8 2.5])
xlabel('Temperature (C)'); ylabel('emf (mV)');
legend('Measured emf','True emf','location','nw')

(2.1975-2.161)/2.161



%%  1. 
clear all, close all, clc

% text file extraction
J = dlmread('lab6j.txt', '', 1, 0);    % Initial
G = dlmread('lab6g.txt', '', 1, 0);    % Initial

dt = 0.001;

% Initial
Ji1 = J(6850:7250,1);
Ji2 = J(7500:11500,2);

tji1 = 0:dt:(dt*length(Ji1)-dt);
tji2 = 0:dt:(dt*length(Ji2)-dt);

Ti1 = (Ji1-J(7800,1))./(Ji1(1)-J(7800,1));
yji1 = (log(Ti1)).';
l1 = polyfit(tji1,yji1,1);
yji1l = l1(1)*tji1 + l1(2);
tau_thicki = -1/l1(1)
h_thicki = 8700*520*1.59e-3/(3*tau_thicki)

Ti2 = (Ji2-J(15000,2))./(Ji2(1)-J(15000,2));
yji2 = (log(Ti2)).';
l2 = polyfit(tji2,yji2,1);
yji2l = l2(1)*tji2 + l2(2);
tau_thini = -1/l2(1)
h_thini = 8700*520*0.8e-3/(3*tau_thini)

% End
Je1 = J(18300:40000,1);
Je2 = J(19000:40000,2);
%
tje1 = 0:dt:(dt*length(Je1)-dt);
tje2 = 0:dt:(dt*length(Je2)-dt);

Te1 = (Je1-J(end,1))./(Je1(1)-J(end,1));
yje1 = (log(Te1)).';
l1 = polyfit(tje1,yje1,1);
yje1l = l1(1)*tje1 + l1(2);
tau_thicke = -1/l1(1)
h_thicke = 8700*520*1.59e-3/(3*tau_thicke)

Te2 = (Je2-J(end,2))./(Je2(1)-J(end,2));
yje2 = (log(Te2)).';
l2 = polyfit(tje2,yje2,1);
yje2l = l2(1)*tje2 + l2(2);
tau_thine = -1/l2(1)
h_thine = 8700*520*0.8e-3/(3*tau_thine)





% Temperature Curve Times for parts j & g
tj = 0:dt:(dt*size(J,1)-dt);
tg = 0:dt:(dt*size(G,1)-dt);

% Part j
figure;
plot(tj,J(:,1),'r.',tj,J(:,2),'b.'); grid on;
xlabel('Time (sec)','fontsize',12); ylabel('Temperature (\circ C)','fontsize',12);
legend('Thick','Thin','location','ne')

% Part g
figure;
plot(tg,G(:,1),'r.',tg,G(:,2),'b.'); grid on;
xlabel('Time (sec)','fontsize',12); ylabel('Temperature (\circ C)','fontsize',12);
legend('Thin','Thick','location','se')

% Initial exponential curve- thick
figure;
plot(tji1,Ji1,'r.'); grid on;
xlabel('Time (sec)','fontsize',12); ylabel('Temperature (\circ C)','fontsize',12);

% Initial exponential curve- thin
figure;
plot(tji2,Ji2,'r.'); grid on;
xlabel('Time (sec)','fontsize',12); ylabel('Temperature (\circ C)','fontsize',12);

% Initial linear curve- thick
figure;
subplot(2,1,1);
plot(tji1,yji1,'r.',tji1,yji1l,'k-','LineWidth',3); grid on;
axis([0 0.4 -3 0])
xlabel('Time (sec)','fontsize',12); ylabel('ln(T - T_{\infty} / T_{0} - T_{\infty})','fontsize',12);
title('Thick Thermocouple','fontsize',12);
legend('Actual Data Points','Linear Fit','location','ne')

% Initial linear curve- thin
subplot(2,1,2);
plot(tji2,yji2,'r.',tji2,yji2l,'k-','LineWidth',3); grid on;
xlabel('Time (sec)','fontsize',12); ylabel('ln(T - T_{\infty} / T_{0} - T_{\infty})','fontsize',12);
axis([0 4 -3 0]);
title('Thin Thermocouple','fontsize',12);
legend('Actual Data Points','Linear Fit','location','ne')

% End exponential curve- thick
figure;
plot(tje1,Je1,'r.'); grid on;
xlabel('Time (sec)'); ylabel('Temperature (\circ C)');

% End exponential curve- thin
figure;
plot(tje2,Je2,'r.'); grid on;
xlabel('Time (sec)'); ylabel('Temperature (\circ C)');

% End linear curve- thick
figure;
subplot(2,1,1);
plot(tje1,yje1,'r.',tje1,yje1l,'k-','LineWidth',3); grid on;
axis([0 20 -2 0])
xlabel('Time (sec)','fontsize',12); ylabel('ln(T - T_{\infty} / T_{0} - T_{\infty})','fontsize',12);
title('Thick Thermocouple','fontsize',12);
legend('Actual Data Points','Linear Fit','location','ne')

% End linear curve- thin
subplot(2,1,2);
plot(tje2,yje2,'r.',tje2,yje2l,'k-','LineWidth',3); grid on;
xlabel('Time (sec)','fontsize',12); ylabel('ln(T - T_{\infty} / T_{0} - T_{\infty})','fontsize',12);
axis([0 20 -2 0]);
title('Thin Thermocouple','fontsize',12);
legend('Actual Data Points','Linear Fit','location','ne')


