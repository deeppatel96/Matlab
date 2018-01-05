% Measurements Lab 3 Calculations

%%  A. Constant Stress
clear all, close all, clc

W = [2.2:1:8.2];

% Aluminum
AaU = [0.100 0.251 0.300 0.348 0.401 0.452 0.507]/5000;
AaD = [0.174 0.230 0.285 0.340 0.395 0.451 0.507]/5000;
AtU = [-0.038 -0.058 -0.078 -0.097 -0.115 -0.134 -0.153]/5000;
AtD = [-0.044 -0.063 -0.081 -0.099 -0.117 -0.135 -0.153]/5000;
AGF = 2.085;
eAaU = (4*AaU)./(AGF*(1-2*AaU));
eAaD = (4*AaD)./(AGF*(1-2*AaD));
eAtU = (4*AtU)./(AGF*(1-2*AtU));
eAtD = (4*AtD)./(AGF*(1-2*AtD));

figure;
plot(W,eAaU,'rv',W,eAaD,'bv',W,eAtU,'ro',W,eAtD,'bo'); grid on;
xlabel('Load Weight (lb)'); ylabel('Strain (in/in)');
axis([0 10 -1e-4 2e-4]);
legend('Axial Up','Axial Down','Transverse Up','Transverse Down','location','nw');

% Brass
BaU = [0.053 0.083 0.112 0.144 0.175 0.206 0.240]/5000;
BaD = [0.022 0.057 0.095 0.131 0.167 0.205 0.240]/5000;
BtU = [-0.029 -0.045 -0.057 -0.067 -0.079 -0.093 -0.108]/5000;
BtD = [-0.049 -0.059 -0.069 -0.078 -0.088 -0.099 -0.108]/5000;
BGF = 2.085;
eBaU = (4*BaU)./(BGF*(1-2*BaU));
eBaD = (4*BaD)./(BGF*(1-2*BaD));
eBtU = (4*BtU)./(BGF*(1-2*BtU));
eBtD = (4*BtD)./(BGF*(1-2*BtD));

figure;
plot(W,eBaU,'rv',W,eBaD,'bv',W,eBtU,'ro',W,eBtD,'bo'); grid on;
xlabel('Load Weight (lb)'); ylabel('Strain (in/in)');
axis([0 10 -1e-4 2e-4]);
legend('Axial Up','Axial Down','Transverse Up','Transverse Down','location','nw');

% Steel
SaU = [0.025 0.037 0.050 0.063 0.077 0.090 0.103]/5000;
SaD = [0.017 0.032 0.046 0.061 0.075 0.089 0.103]/5000;
StU = [-0.012 -0.018 -0.022 -0.027 -0.032 -0.036 -0.040]/5000;
StD = [-0.019 -0.023 -0.026 -0.030 -0.033 -0.037 -0.040]/5000;
SGF = 2.07;
eSaU = (4*SaU)./(SGF*(1-2*SaU));
eSaD = (4*SaD)./(SGF*(1-2*SaD));
eStU = (4*StU)./(SGF*(1-2*StU));
eStD = (4*StD)./(SGF*(1-2*StD));

figure;
plot(W,eSaU,'rv',W,eSaD,'bv',W,eStU,'ro',W,eStD,'bo'); grid on;
xlabel('Load Weight (lb)'); ylabel('Strain (in/in)');
axis([0 10 -1e-4 2e-4]); 
legend('Axial Up','Axial Down','Transverse Up','Transverse Down','location','nw');

SSGIaU = [11 16 21 26 32 40 45]*10e-6/SGF;
SSGIaD = [14 16 24 25 34 40 45]*10e-6/SGF;
SSGIa = (SSGIaU+SSGIaD)/2
figure;
plot(W,eSaU,'ro',W,SSGIa,'bv'); grid on;
xlabel('Load Weight (lb)'); ylabel('Strain (in/in)');
legend('Axial B&DVM','SGI','location','nw');

% There is a significant difference 




% Poisson's Ratio for Up and Down and then take Average
% Thus hysteresis made a big difference between loading and unloading the
% beam but the average of them gave relatively accurate results.
figure;
plot(eAaU,eAtU,'rv',eBaU,eBtU,'bv',eSaU,eStU,'go'); grid on;
P1U = polyfit(eAaU,eAtU,1);
yfit1 = P1U(1)*eAaU+P1U(2);
P2U = polyfit(eBaU,eBtU,1);
yfit2 = P2U(1)*eBaU+P2U(2);
P3U = polyfit(eSaU,eStU,1);
yfit3 = P3U(1)*eSaU+P3U(2);
hold on;
plot(eAaU,yfit1,'r-',eBaU,yfit2,'b-.',eSaU,yfit3,'g--');
xlabel('Weight (lb)'); ylabel('Strain (in/in)');
legend('Aluminum','Brass','Steel','location','ne');

hold on;
plot(eAaD,eAtD,'rv',eBaD,eBtD,'bv',eSaD,eStD,'go'); grid on;
P1D = polyfit(eAaD,eAtD,1);
yfit1 = P1D(1)*eAaD+P1D(2);
P2D = polyfit(eBaD,eBtD,1);
yfit2 = P2D(1)*eBaD+P2D(2);
P3D = polyfit(eSaD,eStD,1);
yfit3 = P3D(1)*eSaD+P3D(2);
hold on;
plot(eAaD,yfit1,'r-',eBaD,yfit2,'b-.',eSaD,yfit3,'g--');
xlabel('Transverse Strain (in/in)'); ylabel('Axial Strain (in/in)');
legend('Aluminum','Brass','Steel','location','ne');

vA = -(P1U(1)+P1D(1))/2
vB = -(P2U(1)+P2D(1))/2
vS = -(P3U(1)+P3D(1))/2

% Averages
eAa = (eAaU + eAaD)/2;
eBa = (eBaU + eBaD)/2;
eSa = (eSaU + eSaD)/2;
eAt = (eAtU + eAtD)/2;
eBt = (eBtU + eBtD)/2;
eSt = (eStU + eStD)/2;

x = 7.875;
b = 2.64;
h = 0.315;
sA = 6*W*x/(b*h.^2)
x = 7.875;
b = 2.629;
h = 0.32;
sB = 6*W*x/(b*h.^2)
x = 7+(9/16);
b = 2.496;
h = 0.357;
sS = 6*W*x/(b*h.^2)
% divide stress by 0.0001450 to convert to Pa
EA = sA/eAa
EB = sB/eBa
ES = sS/eSa

figure;
plot(eAa,sA,'rv',eBa,sB,'bv',eSa,sS,'go',eAa,eAa*EA,'r-',eBa,eBa*EB,'b-',eSa,eSa*ES,'g-'); grid on;
xlabel('Strain (in/in)'); ylabel('Stress (psi)');
legend('Aluminum','Brass','Steel','Aluminum E','Brass E','Steel E','location','se');


%%  B. Cantilever Beam with Strain Rosette
clear all, close all, clc

d = [0 0.1 0.2 0.3 0.4]
e1 = [3 10 15 20 27]/1e6
e2 = [50 157 265 369 474]/1e6
e3 = [70 214 398 513 701]/1e6

ea = ((e2+e1)/2 + (1/(2.^(1/2)))*(((e2-e3).^2)+(e3-e1).^2).^(1/2))
eb = ((e2+e1)/2 - (1/(2.^(1/2)))*(((e2-e3).^2)+(e3-e1).^2).^(1/2))
thetap = 0.5 * atan((e1-2*e2+e3)./(e1-e2))

E = 10.4*10^6
v = 0.33

oa = E * (ea + v.*eb)./(1-(v.^2))
ob = E * (eb + v.*ea)./(1-(v.^2))
L = 10;
b = 1;
h = 0.131;
x = 8 + (15/16);
c = h/2;
I = b*(h.^3)/12;
F = 3*E*I*d/(L.^3);
ox = F*x*c/I