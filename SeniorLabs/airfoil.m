clear all, close all, clc

file = dlmread('SeniorLabs/airfoil_matlab.csv');

s0012 = file(1:19,1:7);
af0012 = file(1:19,9:15);       % 0012 AR=2,Span=5", ?O=10?
s1408 = file(22:40,1:7);
af1408 = file(22:40,9:15);      % 1408 AR=2,Span=5", ?O=10?
s2412 = file(43:61,1:7);
af2412 = file(43:61,9:15);      % 2412 AR=2,Span=5", ?O=10?
s4412 = file(64:82,1:7);
af4412 = file(64:82,9:15);      % 4412 AR=2,Span=5", ?O=10?

A0012 = af0012(:,3) - af0012(:,6) - s0012(:,3) - s0012(:,6);
N0012 = af0012(:,2) - af0012(:,5) - s0012(:,2) - s0012(:,5);
D0012 = A0012.*cosd(af0012(:,1)) + N0012.*sind(af0012(:,1))
L0012 = N0012.*cosd(af0012(:,1)) - A0012.*sind(af0012(:,1))

A1408 = af1408(:,3) - af1408(:,6) - s1408(:,3) - s1408(:,6);
N1408 = af1408(:,2) - af1408(:,5) - s1408(:,2) - s1408(:,5);
D1408 = A1408.*cosd(af1408(:,1)) + N1408.*sind(af1408(:,1))
L1408 = N1408.*cosd(af1408(:,1)) - A1408.*sind(af1408(:,1))

A2412 = af2412(:,3) - af2412(:,6) - s2412(:,3) - s2412(:,6);
N2412 = af2412(:,2) - af2412(:,5) - s2412(:,2) - s2412(:,5);
D2412 = A2412.*cosd(af2412(:,1)) + N2412.*sind(af2412(:,1));
L2412 = N2412.*cosd(af2412(:,1)) - A2412.*sind(af2412(:,1));

A4412 = af4412(:,3) - af4412(:,6) - s4412(:,3) - s4412(:,6);
N4412 = af4412(:,2) - af4412(:,5) - s4412(:,2) - s4412(:,5);
D4412 = A4412.*cosd(af4412(:,1)) + N4412.*sind(af4412(:,1));
L4412 = N4412.*cosd(af4412(:,1)) - A4412.*sind(af4412(:,1));

aoa = af4412(:,1)+10;            % angle of attack (sting angle plus 10)
rho = 1.225;                     % density in kg/m^3
S = ((5*0.0254)^2) / 2;          % plan area for all airfoils
v = 1.48e-5;                     % kinematic viscosity of air at 15 deg C
c = 5*0.0254/2;                  % chord length for all airfoils
rhoair = 0.002297                % air density in slugs/ft^3 at 72 degree F

V0012 = (2*(1.93*32.174/12.*af0012(:,4))/rhoair).^0.5*0.3048
V1408 = (2*(1.93*32.174/12.*af1408(:,4))/rhoair).^0.5*0.3048
V2412 = (2*(1.93*32.174/12.*af2412(:,4))/rhoair).^0.5*0.3048
V4412 = (2*(1.93*32.174/12.*af4412(:,4))/rhoair).^0.5*0.3048
Cl0012 = L0012./((rho * (V0012.^2) / 2) * S)
Cd0012 = D0012./((rho * (V0012.^2) / 2) * S)
Cl1408 = L1408./((rho * (V1408.^2) / 2) * S)
Cd1408 = D1408./((rho * (V1408.^2) / 2) * S)
Cl2412 = L2412./((rho * (V2412.^2) / 2) * S)
Cd2412 = D2412./((rho * (V2412.^2) / 2) * S)
Cl4412 = L4412./((rho * (V4412.^2) / 2) * S)
Cd4412 = D4412./((rho * (V4412.^2) / 2) * S)
Re0012 = mean(V0012)*c/v
Re1408 = mean(V1408)*c/v
Re2412 = mean(V2412)*c/v
Re4412 = mean(V4412)*c/v
Re7 = 5*0.2/v

figure;
plot(aoa, Cl0012, 'b-', aoa, Cl1408, 'r-', aoa, Cl2412, 'g-', aoa, Cl4412, 'm-'); grid on;
xlabel('Angle of Attack (Degrees)','FontSize',14); ylabel('C_{L}','FontSize',14);
title('C_{L} vs. Angle of Attack','FontSize',14);
legend('Airfoil 0012','Airfoil 1408','Airfoil 2412','Airfoil 4412','location','se')

figure;
plot(aoa, Cd0012, 'b-', aoa, Cd1408, 'r-', aoa, Cd2412, 'g-', aoa, Cd4412, 'm-'); grid on;
xlabel('Angle of Attack (Degrees)','FontSize',14); ylabel('C_{D}','FontSize',14);
title('C_{D} vs. Angle of Attack','FontSize',14);
legend('Airfoil 0012','Airfoil 1408','Airfoil 2412','Airfoil 4412','location','nw')

figure;
plot(Cd0012, Cl0012, 'b-', Cd1408, Cl1408, 'r-', Cd2412, Cl2412, 'g-', Cd4412, Cl4412, 'm-'); grid on;
xlabel('C_{D}','FontSize',14); ylabel('C_{L}','FontSize',14);
title('C_{L} vs. C_{D}','FontSize',14);
legend('Airfoil 0012','Airfoil 1408','Airfoil 2412','Airfoil 4412','location','ne')

Clt = aoa*pi/180*2*pi;
figure;
plot(aoa, Clt, 'b-'); grid on;
xlabel('Angle of Attack (Degrees)','FontSize',14); ylabel('C_{L}','FontSize',14);
title('C_{L} based on Theoretical Thin Airfoil Theory','FontSize', 14);




fprintf('%.2f\n', Cd4412)


