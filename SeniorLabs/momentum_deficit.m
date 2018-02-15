% Deep Patel
% Section 19
% Momentum Deficit Lab

%% 
clear all, close all, clc
% Calibration Curve

vft = [0 10 20 30 40 50];
vm = vft.*0.3048;
V = [1.595 2.347 2.94 3.45 3.91 4.28];

x = V;
y = vm;
p = polyfit(x,y,2);
x1 = linspace(1.5,4.5);
y1 = polyval(p,x1);
figure;
plot(x, y*3.28084, 'o', x1,y1*3.28084, 'Markersize', 12); grid on;
xlabel('Voltage (V)'); ylabel('Velocity (ft/s)');
title('Calibration Curve');
axis([1.5 4.5 -5 60]);

% Calculations

w = 0.5*0.0254;                % width or Diameter of rod in meters
rhoWater = 1.0002E+3;          % kg/m^3
rhoAir = 1.2725;               % kg/m^3
dvWater = 1.4833E-3;           % kg/m*s
dvAir = 1.7450E-5;             % kg/m*s
kvWater = 1.4830E-6;           % m^2/s
kvAir = 1.3714E-5;             % m^2/s
L = 3*0.0254;                  % Length of rod in meters
V = [4.02 4.04 4.08 4.08 4.08 4.10 4.10 4.09 4.11 4.11 4.11 4.10 4.11 4.10 4.11 4.11 4.11 4.11 4.10 4.10 4.10;
     4.03 4.06 4.10 4.10 4.10 4.10 4.07 4.03 3.94 3.83 3.65 3.55 3.59 3.67 3.83 3.95 4.03 4.09 4.12 4.13 4.15;
     4.04 4.06 4.10 4.09 4.08 4.05 4.02 3.98 3.94 3.88 3.85 3.81 3.85 3.87 3.92 3.94 3.99 4.03 4.06 4.10 4.12;];
U = [polyval(p,V(1,:)); polyval(p,V(2,:)); polyval(p,V(3,:));]

U1 = sum(U(1,:))/size(U,2)
Uavg = (U(2,:)+U(3,:))/2;
Y = [2:-0.2:-2]
figure;
plot(U(1,:)*3.28084,Y,'k',U(2,:)*3.28084,Y,'g',U(3,:)*3.28084,Y,'r',Uavg*3.28084,Y,'b.-'); grid on;
xlabel('Velocity (ft/s)'); ylabel('Y Location (ft)');
title('Free Stream and Drag Force Velocity Profiles');
legend('Free Stream U1 Profile','Velocity Profile at 5.5" Behind','Velocity Profile at 13.56" Behind','Average Velocity Profile of 5.5" & 13.56" Behind','location','nw');


% Drag Force
n = size(U,2)-1
dy = 2*L/n
Fd1 = 0;
for i = 1:(size(U,2)-1)
    s = ( (U1-U(2,i)) + (U1-U(2,i+1)) )/2   ;
    Fd1 = Fd1 + s * dy;
end
Fd1 = Fd1 * rhoAir

Fd2 = 0;
for i = 1:(size(U,2)-1)
    s = ( (U1-U(3,i)) + (U1-U(3,i+1)) )/2   ;
    Fd2 = Fd2 + s * dy;
end
Fd2 = Fd2 * rhoAir

Fd = (Fd1 + Fd2) / 2

% Reynolds Number

Re = U1*w/kvAir

% Drag Coefficient
A = w * 2*L;
Cd1 = 2*Fd1 / (rhoAir * A * U1*U1)
Cd2 = 2*Fd2 / (rhoAir * A * U1*U1)

Cd = (Cd1+Cd2)/2

% System Drag Force
Usys = 2*5280/3600/3.28084
Resys = Usys*w/kvWater
Fdsys = rhoWater*(Usys^2)*Fd/(rhoAir*(U1^2))



% Error
e1 = 0;
for i = 1:(size(U,2)-1)
    e1 = e1 + dy*((U(2,i)-U1)*0.01)^2 ;
end
e1 = e1^0.5
e2 = 0;
for i = 1:(size(U,2)-1)
    e2 = e2 + dy*((U(2,i)-U1)*0.01)^2 ;
end
e2 = e2^0.5
e = (e1+e2)/2



esys1 = rhoWater*(Usys^2)*-2*Fd/(rhoAir*(U1^3))*0.01*13.7006
esys2 = rhoWater*(Usys^2)/(rhoAir*(U1^2))*0.0067

esys = (esys1^2 + esys2^2)^0.5

esys/Fdsys
