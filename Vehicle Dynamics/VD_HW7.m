% Deep Patel
% HW 7 - Vehicle Dynamics

%% Problem 15.11
clear all, close all, clc

W = 1850;
kf = 110;
kr = 130;
L = 110/12;
DI = 0.9;
oc1 = [];
oc2 = [];
for i = 0:30
    Wr = (0.35+(i/100))*W;
    Wf = W-Wr;
    b = (Wr*L)/(Wr+Wf);
    c = L-b;
    rad = (DI*b*c)^0.5;
    m = (1/32.17)*[W 0; 0 W*rad*rad];
    k = 12*[kf+kr, c*kr-b*kf; c*kr-b*kf, ((c)^2)*kr+((b)^2)*kf];

    syms w;
    eqn = (-w^2*m(1,1) + k(1,1))*(-w^2*m(2,2) + k(2,2)) - k(1,2)*k(2,1) == 0;
    sol = double(vpasolve(eqn,w));
    w1 = sol(3);
    w2 = sol(4);

    [Vec, Val] = eig(-w1^2 * m + k);
    Z1 = [Vec(2,1);Vec(2,2)];
    [Vec, Val] = eig(-w2^2 * m + k);
    Z2 = [Vec(1,1);Vec(2,1)];
    d1 = Z1(1)/Z1(2);
    d2 = Z2(1)/Z2(2);
    oc1 = [oc1 d1];
    oc2 = [oc2 d2];
end
oc1
oc2
Wrear = W*[0.35:0.01:0.65];
figure;
plot(Wrear, oc1,'r-'); grid on
xlabel('Wr (lb)','FontSize',14); ylabel('Locations of Center of Oscillations (ft)','FontSize',14);
title('Center of Oscillation - 1st Mode (bouncing)','FontSize',14);

figure;
plot( Wrear, oc2,'b-'); grid on
xlabel('Wr (lb)','FontSize',14); ylabel('Locations of Center of Oscillations (ft)','FontSize',14);
title('Center of Oscillation - 2nd Mode (pitching)','FontSize',14);

%% Problem 15.12
clear all, close all, clc

L = 2.7;
mass = 1350;
mr = 540;
DI = 0.9;
b = mr*L/mass;
c = L-b;
rad = (DI*b*c)^0.5;
kf = 3224.399757835894
kr = b/c*kf
m = [mass 0; 0 mass*rad*rad];
k = 12*[kf+kr, c*kr-b*kf; c*kr-b*kf, ((c)^2)*kr+((b)^2)*kf];

syms w;
eqn = (-w^2*m(1,1) + k(1,1))*(-w^2*m(2,2) + k(2,2)) - k(1,2)*k(2,1) == 0;
sol = double(vpasolve(eqn,w));
f1 = sol(3)/(2*pi)
f2 = sol(4)/(2*pi)

