clear all, close all, clc

air6 = dlmread('SeniorLabs/shocktube_data/6psig.txt');
air8 = dlmread('SeniorLabs/shocktube_data/8psig.txt');
air10 = dlmread('SeniorLabs/shocktube_data/10psig.txt');
air12 = dlmread('SeniorLabs/shocktube_data/12psig.txt');
air14 = dlmread('SeniorLabs/shocktube_data/14psig.txt');
air8ref = dlmread('SeniorLabs/shocktube_data/reflected8psig.txt');
he8 = dlmread('SeniorLabs/shocktube_data/8psigHE.txt');
dt = 1e-6;
t = 0:dt:0.025;
t = t(1:25000);
T1 = 298;
gammaAir = 1.4;
gammaHE = 1.666;
dist = 2.195-1.647;
a1 = (1.4*287*T1)^0.5;
v0 = -2.5000000000048317E-3;
P1 = 14.7;
% 6 psig Calibration Constant Calc
t1_6 = 2.496e-3;
t2_6 = 3.981e-3;
M1_6 = (dist/(t2_6-t1_6))/a1;
P2_6 = P1*(1+(2*gammaAir/(gammaAir+1))*(M1_6^2 - 1));
vp1_6 = 0.12;
vp2_6 = 0.069;
c1_6 = (P2_6-P1)/(vp1_6-v0)
c2_6 = (P2_6-P1)/(vp2_6-v0)

% 8 psig Calibration Constant Calc
t1 = 2.4969e-3;
t2 = 3.961e-3;
M1_8 = (dist/(t2-t1))/a1;
P2_8 = P1*(1+(2*gammaAir/(gammaAir+1))*(M1_8^2 - 1));
vp1_8 = 0.1452;
vp2_8 = 0.0858;
c1_8 = (P2_8-P1)/(vp1_8-v0)
c2_8 = (P2_8-P1)/(vp2_8-v0)

% Average of Calibration Constants
c1 = (c1_6+c1_8)/2
c2 = (c2_6+c2_8)/2

% Voltage Data for 10,12,14 psig air
vp1_10 = 0.1707;
vp2_10 = 0.0943;
vp1_12 = 0.2388;
vp2_12 = 0.1282;
vp1_14 = 0.2728;
vp2_14 = 0.1537;

% Time Data for 10,12,14 psig air
t1_10 = 2.4984e-3;
t2_10 = 3.931e-3;
t1_12 = 2.4986e-3;
t2_12 = 3.8971e-3;
t1_14 = 2.4985e-3;
t2_14 = 3.8781e-3;

% Measured Pressure ratios P2/P1 using voltages
P21ratio_6m1 = (P1 + c1*(vp1_6-v0))/P1
P21ratio_8m1 = (P1 + c1*(vp1_8-v0))/P1
P21ratio_10m1 = (P1 + c1*(vp1_10-v0))/P1
P21ratio_12m1 = (P1 + c1*(vp1_12-v0))/P1
P21ratio_14m1 = (P1 + c1*(vp1_14-v0))/P1

% Measured Pressure ratios P2/P1 using Equation
M1_10 = (dist/(t2_10-t1_10))/a1;
M1_12 = (dist/(t2_12-t1_12))/a1;
M1_14 = (dist/(t2_14-t1_14))/a1;
P21ratio_6m2 = (1+(2*gammaAir/(gammaAir+1))*(M1_6^2 - 1))
P21ratio_8m2 = (1+(2*gammaAir/(gammaAir+1))*(M1_8^2 - 1))
P21ratio_10m2 = (1+(2*gammaAir/(gammaAir+1))*(M1_10^2 - 1))
P21ratio_12m2 = (1+(2*gammaAir/(gammaAir+1))*(M1_12^2 - 1))
P21ratio_14m2 = (1+(2*gammaAir/(gammaAir+1))*(M1_14^2 - 1))

% Theoretical Pressure ratios P2/P1
a4 = a1;
P4_6 = 6+P1;
P4_8 = 8+P1;
P4_10 = 10+P1;
P4_12 = 12+P1;
P4_14 = 14+P1;
syms x
eqn = x*((1-((gammaAir-1)*(a1/a4)*(x-1))/(((2*gammaAir)*(2*gammaAir+(gammaAir+1)*(x-1)))^0.5))^(-2*gammaAir/(gammaAir-1))) == P4_6/P1;
P21ratio_6a = double(solve(eqn,x));
P21ratio_6a = abs(P21ratio_6a);
P21ratio_6a = P21ratio_6a(1)

eqn = x*((1-((gammaAir-1)*(a1/a4)*(x-1))/(((2*gammaAir)*(2*gammaAir+(gammaAir+1)*(x-1)))^0.5))^(-2*gammaAir/(gammaAir-1))) == P4_8/P1;
P21ratio_8a = double(solve(eqn,x));
P21ratio_8a = abs(P21ratio_8a);
P21ratio_8a = P21ratio_8a(1)

eqn = x*((1-((gammaAir-1)*(a1/a4)*(x-1))/(((2*gammaAir)*(2*gammaAir+(gammaAir+1)*(x-1)))^0.5))^(-2*gammaAir/(gammaAir-1))) == P4_10/P1;
P21ratio_10a = double(solve(eqn,x));
P21ratio_10a = abs(P21ratio_10a);
P21ratio_10a = P21ratio_10a(1)

eqn = x*((1-((gammaAir-1)*(a1/a4)*(x-1))/(((2*gammaAir)*(2*gammaAir+(gammaAir+1)*(x-1)))^0.5))^(-2*gammaAir/(gammaAir-1))) == P4_12/P1;
P21ratio_12a = double(solve(eqn,x));
P21ratio_12a = abs(P21ratio_12a);
P21ratio_12a = P21ratio_12a(1)

eqn = x*((1-((gammaAir-1)*(a1/a4)*(x-1))/(((2*gammaAir)*(2*gammaAir+(gammaAir+1)*(x-1)))^0.5))^(-2*gammaAir/(gammaAir-1))) == P4_14/P1;
P21ratio_14a = double(solve(eqn,x));
P21ratio_14a = abs(P21ratio_14a);
P21ratio_14a = P21ratio_14a(1)

% Percent Differences for Measured Methods 1 & 2
p6_1 = abs(P21ratio_6m1 - P21ratio_6a)/P21ratio_6a*100
p8_1 = abs(P21ratio_8m1 - P21ratio_8a)/P21ratio_8a*100
p10_1 = abs(P21ratio_10m1 - P21ratio_10a)/P21ratio_10a*100
p12_1 = abs(P21ratio_12m1 - P21ratio_12a)/P21ratio_12a*100
p14_1 = abs(P21ratio_14m1 - P21ratio_14a)/P21ratio_14a*100

p6_2 = abs(P21ratio_6m2 - P21ratio_6a)/P21ratio_6a*100
p8_2 = abs(P21ratio_8m2 - P21ratio_8a)/P21ratio_8a*100
p10_2 = abs(P21ratio_10m2 - P21ratio_10a)/P21ratio_10a*100
p12_2 = abs(P21ratio_12m2 - P21ratio_12a)/P21ratio_12a*100
p14_2 = abs(P21ratio_14m2 - P21ratio_14a)/P21ratio_14a*100


%%
y6p2 = P1 + c1.*(air6(:,1)-v0);
y6p3 = P1 + c2.*(air6(:,2)-v0);
y10p2 = P1 + c1.*(air10(:,1)-v0);
y10p3 = P1 + c2.*(air10(:,2)-v0);
y14p2 = P1 + c1.*(air14(:,1)-v0);
y14p3 = P1 + c2.*(air14(:,2)-v0);

figure;
plot(t,y6p2,'r',t,y6p3,'b'); grid on;
xlabel('Time (sec)','FontSize',14);
ylabel('Transducer Pressure (psia)','FontSize',14);
title('6 psig Driver Pressure Transducer Time Trace','FontSize',14);
lgd = legend('Transducer 2 (upstream)','Transducer 3 (downstream)','location','ne');
set(lgd,'FontSize',14);

figure;
plot(t,y10p2,'r',t,y10p3,'b'); grid on;
xlabel('Time (sec)','FontSize',14);
ylabel('Transducer Pressure (psia)','FontSize',14);
title('10 psig Driver Pressure Transducer Time Trace','FontSize',14);
lgd = legend('Transducer 2 (upstream)','Transducer 3 (downstream)','location','ne');
set(lgd,'FontSize',14);

figure;
plot(t,y14p2,'r',t,y14p3,'b'); grid on;
xlabel('Time (sec)','FontSize',14);
ylabel('Transducer Pressure (psia)','FontSize',14);
title('14 psig Driver Pressure Transducer Time Trace','FontSize',14);
lgd = legend('Transducer 2 (upstream)','Transducer 3 (downstream)','location','ne');
set(lgd,'FontSize',14);



%%
x = [P4_6/P1, P4_8/P1, P4_10/P1, P4_12/P1, P4_14/P1]
ya = [P21ratio_6a, P21ratio_8a, P21ratio_10a, P21ratio_12a, P21ratio_14a]
ym = [P21ratio_6m1, P21ratio_8m1, P21ratio_10m1, P21ratio_12m1, P21ratio_14m1]

figure;
plot(x,ya,'r',x,ym,'b'); grid on;
xlabel('Initial Driver Gas Pressure Ratio P4/P1','FontSize',14);
ylabel('Shock Strength Pressure Ratio P2/P1','FontSize',14);
title('Theoretical & Measured Shock Strength Pressure Ratio vs. Initial Pressure Ratio','FontSize',14);
lgd = legend('Theoretical','Measured','location','se');
set(lgd,'FontSize',14);

%% Mach Number Calculations using 3 methods & plots
syms x
eqn = ((2*gammaAir*(x^2)-(gammaAir-1))/(gammaAir+1))* ((1- (gammaAir-1)/(gammaAir+1)*(a1/a4)*(x-(1/x)))^(-2*gammaAir/(gammaAir-1))) == P4_6/P1;
Mach6a = double(solve(eqn,x));
Mach6a = abs(Mach6a);
Mach6a = Mach6a(1)

eqn = ((2*gammaAir*(x^2)-(gammaAir-1))/(gammaAir+1))* ((1- (gammaAir-1)/(gammaAir+1)*(a1/a4)*(x-(1/x)))^(-2*gammaAir/(gammaAir-1))) == P4_8/P1;
Mach8a = double(solve(eqn,x));
Mach8a = abs(Mach8a);
Mach8a = Mach8a(1)

eqn = ((2*gammaAir*(x^2)-(gammaAir-1))/(gammaAir+1))* ((1- (gammaAir-1)/(gammaAir+1)*(a1/a4)*(x-(1/x)))^(-2*gammaAir/(gammaAir-1))) == P4_10/P1;
Mach10a = double(solve(eqn,x));
Mach10a = abs(Mach10a);
Mach10a = Mach10a(1)

eqn = ((2*gammaAir*(x^2)-(gammaAir-1))/(gammaAir+1))* ((1- (gammaAir-1)/(gammaAir+1)*(a1/a4)*(x-(1/x)))^(-2*gammaAir/(gammaAir-1))) == P4_12/P1;
Mach12a = double(solve(eqn,x));
Mach12a = abs(Mach12a);
Mach12a = Mach12a(1)

eqn = ((2*gammaAir*(x^2)-(gammaAir-1))/(gammaAir+1))* ((1- (gammaAir-1)/(gammaAir+1)*(a1/a4)*(x-(1/x)))^(-2*gammaAir/(gammaAir-1))) == P4_14/P1;
Mach14a = double(solve(eqn,x));
Mach14a = abs(Mach14a);
Mach14a = Mach14a(1)

Mach6m1 = ((P21ratio_6m1-1)*((gammaAir+1)/(2*gammaAir))+1)^0.5
Mach8m1 = ((P21ratio_8m1-1)*((gammaAir+1)/(2*gammaAir))+1)^0.5
Mach10m1 = ((P21ratio_10m1-1)*((gammaAir+1)/(2*gammaAir))+1)^0.5
Mach12m1 = ((P21ratio_12m1-1)*((gammaAir+1)/(2*gammaAir))+1)^0.5
Mach14m1 = ((P21ratio_14m1-1)*((gammaAir+1)/(2*gammaAir))+1)^0.5

Mach6m2 = M1_6
Mach8m2 = M1_8
Mach10m2 = M1_10
Mach12m2 = M1_12
Mach14m2 = M1_14

Macha = [Mach6a, Mach8a, Mach10a, Mach12a, Mach14a]
Machm1 = [Mach6m1, Mach8m1, Mach10m1, Mach12m1, Mach14m1]
Machm2 = [Mach6m2, Mach8m2, Mach10m2, Mach12m2, Mach14m2]
pinit = [P4_6/P1, P4_8/P1, P4_10/P1, P4_12/P1, P4_14/P1]

figure;
plot(pinit,Macha,'r',pinit,Machm1,'b',pinit,Machm2,'g'); grid on;
xlabel('Initial Driver Pressure Ratio (P4/P1)','FontSize',14);
ylabel('Shock Wave Mach Number (Ms)','FontSize',14);
title('Calculated Mach # using 3 methods','FontSize',14);
lgd = legend('1:Theoretical','2: measured shock pressure ratios','3: measured time diff btw transducers','location','nw');
set(lgd,'FontSize',14);

% Percent Differences
pMach1 = abs(Machm1 - Macha)./Macha*100
pMach2 = abs(Machm2 - Macha)./Macha*100




%% Plots of original voltage data vs. time
figure;
plot(t,air6(:,1),'r', t, air6(:,2),'b'); grid on;
xlabel('time (sec)');ylabel('Voltage (V)');
title('6 psig Air');

figure;
plot(t,air8(:,1),'r', t, air8(:,2),'b'); grid on;
xlabel('time (sec)');ylabel('Voltage (V)');
title('8 psig Air');

figure;
plot(t,air10(:,1),'r', t, air10(:,2),'b'); grid on;
xlabel('time (sec)');ylabel('Voltage (V)');
title('10 psig Air');

figure;
plot(t,air12(:,1),'r', t, air12(:,2),'b'); grid on;
xlabel('time (sec)');ylabel('Voltage (V)');
title('12 psig Air');

figure;
plot(t,air14(:,1),'r', t, air14(:,2),'b'); grid on;
xlabel('time (sec)');ylabel('Voltage (V)');
title('14 psig Air');


%% Part 10-12 - Uncertainty
% Computing partial derivatives



P2 = 0.3905*0.1;







P21ratio = linspace(1,1.5,100)
MachTest = ((P21ratio-1).*((gammaAir+1)./(2*gammaAir))+1).^0.5;
% figure;
% plot(P21ratio,MachTest,'b')
slope1 = (MachTest(end)-MachTest(1))/(P21ratio(end)-P21ratio(1))

deltadistance = dist/1000;
deltaxdist = linspace(dist-deltadistance*10,dist+deltadistance*10,100);
deltatime = t2_6-t1_6;
MachTest2 = deltaxdist./deltatime/((gammaAir*287*T1)^0.5);
slope2 = (MachTest2(end)-MachTest2(1))/(deltaxdist(end)-deltaxdist(1))

deltatime = t2_6-t1_6;
deltaTIME = deltatime/10000;
deltatimearray = linspace(deltatime-deltaTIME*10,deltatime+deltaTIME*10,100);
MachTest3 = dist./deltatimearray./((gammaAir*287*T1)^0.5);
slope3 = (MachTest3(end)-MachTest3(1))/(deltatimearray(end)-deltatimearray(1))

dtemp = T1/1000000;
temparray = linspace(T1-dtemp,T1+dtemp,10);
deltaTIME = deltatime/10000;
deltatimearray = linspace(deltatime-deltaTIME*10,deltatime+deltaTIME*10,100);
MachTest4 = dist./deltatime./((gammaAir*287.*temparray).^0.5);
slope4 = (MachTest4(end)-MachTest4(1))/(temparray(end)-temparray(1))














%% 13 - corrected pressure trace graphs

figure;
plot(t,c1*air6(:,1)+P1,'r', t, c2*air6(:,2)+P1,'b'); grid on;
xlabel('time (sec)','FontSize',14);ylabel('Pressure (psia)','FontSize',14);
title('6 psig Driver Gas (Air) Corrected Pressure Trace','FontSize',14);
lgd = legend('Transducer Location 2: Upstream','Transducer Location 3: Downstream','location','ne');
set(lgd,'FontSize',14);

figure;
plot(t,c1*air8(:,1)+P1,'r', t, c2*air8(:,2)+P1,'b'); grid on;
xlabel('time (sec)','FontSize',14);ylabel('Pressure (psia)','FontSize',14);
title('8 psig Driver Gas (Air) Corrected Pressure Trace','FontSize',14);
lgd = legend('Transducer Location 2: Upstream','Transducer Location 3: Downstream','location','ne');
set(lgd,'FontSize',14);

figure;
plot(t,c1*air10(:,1)+P1,'r', t, c2*air10(:,2)+P1,'b'); grid on;
xlabel('time (sec)','FontSize',14);ylabel('Pressure (psia)','FontSize',14);
title('10 psig Driver Gas (Air) Corrected Pressure Trace','FontSize',14);
lgd = legend('Transducer Location 2: Upstream','Transducer Location 3: Downstream','location','ne');
set(lgd,'FontSize',14);

figure;
plot(t,c1*air12(:,1)+P1,'r', t, c2*air12(:,2)+P1,'b'); grid on;
xlabel('time (sec)','FontSize',14);ylabel('Pressure (psia)','FontSize',14);
title('12 psig Driver Gas (Air) Corrected Pressure Trace','FontSize',14);
lgd = legend('Transducer Location 2: Upstream','Transducer Location 3: Downstream','location','ne');
set(lgd,'FontSize',14);

figure;
plot(t,c1*air14(:,1)+P1,'r', t, c2*air14(:,2)+P1,'b'); grid on;
xlabel('time (sec)','FontSize',14);ylabel('Pressure (psia)','FontSize',14);
title('14 psig Driver Gas (Air) Corrected Pressure Trace','FontSize',14);
lgd = legend('Transducer Location 2: Upstream','Transducer Location 3: Downstream','location','ne');
set(lgd,'FontSize',14);
%% Part 14 - Effect of another Gas: Helium

figure;
plot(t,he8(:,1),'r', t, he8(:,2),'b'); grid on;
xlabel('time (sec)','FontSize',14);ylabel('Voltage (V)','FontSize',14);
title('8 psig Driver Gas (Helium) Voltage Trace','FontSize',14);
lgd = legend('Transducer Location 2: Upstream','Transducer Location 3: Downstream','location','ne');
set(lgd,'FontSize',14);

figure;
plot(t,c1*he8(:,1)+P1,'r', t, c2*he8(:,2)+P1,'b'); grid on;
xlabel('time (sec)','FontSize',14);ylabel('Pressure (psia)','FontSize',14);
title('8 psig Driver Gas (Helium) Corrected Pressure Trace','FontSize',14);
lgd = legend('Transducer Location 2: Upstream','Transducer Location 3: Downstream','location','ne');
set(lgd,'FontSize',14);

t1_he = 2.4984e-3;
t2_he = 3.931e-3;
MachHEm = (dist/(t2_he-t1_he))/a1

syms x
a4 = (gammaHE*2078*T1)^0.5;
eqn = x*((1-((gammaHE-1)*(a1/a4)*(x-1))/(((2*gammaAir)*(2*gammaAir+(gammaAir+1)*(x-1)))^0.5))^(-2*gammaHE/(gammaHE-1))) == P4_8/P1;
P21ratio_HEa = double(solve(eqn,x));
P21ratio_HEa = abs(P21ratio_HEa);
P21ratio_HEa = P21ratio_HEa(1)

vp1_HE = 0.1877;
vp2_HE = 0.1027;
P21ratio_HEm = (P1 + c1*(vp1_HE-v0))/P1

syms x
eqn = ((2*gammaAir*(x^2)-(gammaAir-1))/(gammaAir+1))* ((1- (gammaHE-1)/(gammaHE+1)*(a1/a4)*(x-(1/x)))^(-2*gammaHE/(gammaHE-1))) == P4_8/P1;
MachHEa = double(solve(eqn,x));
MachHEa = abs(MachHEa);
MachHEa = MachHEa(1)

percentIncreaseInHeliumMachNumberOverAirActual = (abs(MachHEa-Mach8a))/Mach8a*100
percentIncreaseInHeliumMachNumberOverAirMeasured = (abs(MachHEm-Mach8m1))/Mach8m1*100


%% Part 15 - Reflected Wave

figure;
plot(t,c1*air8ref(:,1)+P1,'r', t, c2*air8ref(:,2)+P1,'b'); grid on;
xlabel('time (sec)','FontSize',14);ylabel('Pressure (psia)','FontSize',14);
title('8 psig Driver Gas (Air) Corrected Pressure Trace for Shock Tube with End Wall','FontSize',14);
lgd = legend('Transducer Location 2: Upstream','Transducer Location 3: Downstream','location','ne');
set(lgd,'FontSize',14);

up = 2*a1/(gammaAir+1)*(Mach8a-(1/Mach8a))
a2 = (((2*gammaAir*(Mach8a^2) - (gammaAir-1))*((gammaAir-1)*(Mach8a^2) + 2)/(((gammaAir+1)^2)*Mach8a))^0.5)*a1

syms x
eqn = 2*a2/(gammaAir+1)*(x-(1/x)) == up;
Mr = double(solve(eqn,x));
Mr = abs(Mr);
Mr = Mr(1)

P5_2a = ((2*gammaAir*Mr^2 - (gammaAir-1))/(gammaAir+1))
P5a = P5_2a*P21ratio_8a*P1
P5m = 21.4517;
pdiffref = (abs(P5a-P5m))/P5a*100


