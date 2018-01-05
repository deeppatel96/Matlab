%% Deep Patel
% Vehicle Dynamics Computer Project 2

%%
clear all, close all, clc

% Number 1
Cf = -250 * 180 / pi;
Cr = -250 * 180 / pi;
W = 3500;
m = W / 32.17;
Ig = 2550;
 
% Case 1
V = 120;
b = 3.6;
L = 8.7;
c = L - b;
M = [m*V 0; 0 Ig];
A = [Cf+Cr, (1/V)*(b*Cf - c*Cr) - m*V; b*Cf-c*Cr, (1/V)*((b.^2)*Cf+(c.^2)*Cr)];
[u1, v1] = eig(A,M);

% Case 2
V = 120;
b = 4.6;
L = 8.7;
c = L - b;
M = [m*V 0; 0 Ig];
A = [Cf+Cr, (1/V)*(b*Cf - c*Cr) - m*V; b*Cf-c*Cr, (1/V)*((b.^2)*Cf+(c.^2)*Cr)];
[u2, v2] = eig(A,M);

% Case 3
V = 60;
b = 3.6;
L = 8.7;
c = L - b;
M = [m*V 0; 0 Ig];
A = [Cf+Cr, (1/V)*(b*Cf - c*Cr) - m*V; b*Cf-c*Cr, (1/V)*((b.^2)*Cf+(c.^2)*Cr)];
[u3, v3] = eig(A,M);

% Case 4
V = 60;
b = 4.6;
L = 8.7;
c = L - b;
M = [m*V 0; 0 Ig];
A = [Cf+Cr, (1/V)*(b*Cf - c*Cr) - m*V; b*Cf-c*Cr, (1/V)*((b.^2)*Cf+(c.^2)*Cr)];
[u4, v4] = eig(A,M);

% Eigenvalues for all 4 Cases
v1
v2
v3
v4

%%
clear all, clc
T = 1.15;
t = linspace(0, 6*T, 10000);
tspan = [0 6*T];
y0 = [0 0 0];
[t1, x1] = ode45('eigen1', tspan, y0);
[t2, x2] = ode45('eigen2', tspan, y0);
[t3, x3] = ode45('eigen3', tspan, y0);
[t4, x4] = ode45('eigen4', tspan, y0);

ar1 = [];
af1 = [];
ar2 = [];
af2 = [];
ar3 = [];
af3 = [];
ar4 = [];
af4 = [];
V = [120 120 60 60];
L = 8.7;
b = [3.6 4.6 3.6 4.6];
c = L-b;
for i = 1:length(t1)
    if t1(i)<=T
        d = 1.4*pi/180;
    elseif t1(i)<(2*T)
        d = -1.4*pi/180;
    else
        d = 0;
    end
    v = V(1)*sin(x1(i,1));
    u = V(1)*cos(x1(i,1));
    ar1 = [ar1 atan((v - c(1)*x1(i,2))/u)];
    af1 = [af1 atan((v + b(1)*x1(i,2))/u) - d];
end
for i = 1:length(t2)
    if t2(i)<=T
        d = 1.4*pi/180;
    elseif t2(i)<(2*T)
        d = -1.4*pi/180;
    else
        d = 0;
    end
    v = V(2)*sin(x2(i,1));
    u = V(2)*cos(x2(i,1));
    ar2 = [ar2 atan((v - c(2)*x2(i,2))/u)];
    af2 = [af2 atan((v + b(2)*x2(i,2))/u) - d];
end
for i = 1:length(t3)
    if t3(i)<=T
        d = 1.4*pi/180;
    elseif t3(i)<(2*T)
        d = -1.4*pi/180;
    else
        d = 0;
    end
    v = V(3)*sin(x3(i,1));
    u = V(3)*cos(x3(i,1));
    ar3 = [ar3 atan((v - c(3)*x3(i,2))/u)];
    af3 = [af3 atan((v + b(3)*x3(i,2))/u) - d];
end
for i = 1:length(t4)
    if t4(i)<=T
        d = 1.4*pi/180;
    elseif t4(i)<(2*T)
        d = -1.4*pi/180;
    else
        d = 0;
    end
    v = V(4)*sin(x4(i,1));
    u = V(4)*cos(x4(i,1));
    ar4 = [ar4 atan((v - c(4)*x4(i,2))/u)];
    af4 = [af4 atan((v + b(4)*x4(i,2))/u) - d];
end


% Plots
figure;
plot(t1,x1(:,1),'r',t2,x2(:,1),'b',t3,x3(:,1),'g',t4,x4(:,1),'m'); grid on;
title('Beta');
xlabel('Time (sec)'); ylabel('Amplitudes');
legend('Case 1','Case 2','Case 3','Case 4','location','ne');

figure;
plot(t1,x1(:,2),'r',t2,x2(:,2),'b',t3,x3(:,2),'g',t4,x4(:,2),'m'); grid on;
title('Gamma');
xlabel('Time (sec)'); ylabel('Amplitudes');
legend('Case 1','Case 2','Case 3','Case 4','location','ne');

figure;
plot(t1,x1(:,3),'r',t2,x2(:,3),'b',t3,x3(:,3),'g',t4,x4(:,3),'m'); grid on;
title('Psi');
xlabel('Time (sec)'); ylabel('Amplitudes');
legend('Case 1','Case 2','Case 3','Case 4','location','ne');

figure;
plot(t1,ar1,'r',t2,ar2,'b',t3,ar3,'g',t4,ar4,'m'); grid on;
title('Alpha Rear');
xlabel('Time (sec)'); ylabel('Amplitudes');
legend('Case 1','Case 2','Case 3','Case 4','location','ne');

figure;
plot(t1,af1,'r',t2,af2,'b',t3,af3,'g',t4,af4,'m'); grid on;
title('Alpha Front');
xlabel('Time (sec)'); ylabel('Amplitudes');
legend('Case 1','Case 2','Case 3','Case 4','location','ne');

%%
clear all, clc

% Number 3
Cf = -250 * 180 / pi;
Cr = -250 * 180 / pi;
W = 3500;
m = W / 32.17;
Ig = 2550;

b = 4.6;
L = 8.7;
c = L - b;
start = 200;
fin = 1400;
z1 = zeros(fin-start,1);
z2 = zeros(fin-start,1);
for i = start:fin
    V = i/10;
    M = [m*V 0; 0 Ig];
    A = [Cf+Cr, (1/V)*(b*Cf - c*Cr) - m*V; b*Cf-c*Cr, (1/V)*((b.^2)*Cf+(c.^2)*Cr)];
    [u, v] = eig(A,M);
    z1(i-start+1) = v(1,1);
    z2(i-start+1) = v(2,2);
end
vel = (start/10):0.1:(fin/10);

figure;
plot(vel, real(z1), 'r-',vel, real(z2), 'b-'); grid on;
title('Real Part of Eigenvalue');
xlabel('Velocity (ft/s)'); ylabel('Eigenvalue Amplitude (real part)');
legend('Eigenvalue 1','Eigenvalue 2','location','se');

figure;
plot(vel, imag(z1), 'r-',vel, imag(z2), 'b-'); grid on;
title('Imaginary Part of Eigenvalue');
xlabel('Velocity (ft/s)'); ylabel('Eigenvalue Amplitude (imaginary part)');
legend('Eigenvalue 1','Eigenvalue 2','location','se');

% Answer: critical velocity = 140 ft/s


%% Discussion

% Discuss the effects speed and CG (center of mass) location on vehicle 
% handling, and note any cases that violate the assumptions made in the model.

% The differences between the four cases observed become apparent when 
% looking at the graphs of the sideslip angle beta, angular velocity omega, 
% heading angle psi, front slip angle alpha f, and rear slip angle alpha r. 
% For all of these plots, the case with the higher velocity of 120 ft/s and 
% CG that is closer to the back (oversteer vehicle) has the highest amplitudes 
% and thus is the most unstable. For example, the sideslip angle decreases the
% fastest for Case 2 as a turn is made and when a turn to the other side
% is made, that vehicle takes longer to adjust to the change, whereas an
% understeer vehicle and even the other oversteer case at lower velocity
% are able to adjust quickly. You can see from the beta graph that the
% highest amplitude is of course in high velocity oversteer case but the
% second is high velocity understeer and then low velocity oversteer. This
% suggests that velocity has a bigger effect on side slip angle that the CG
% location. Next, we look at the angular velocity of the vehicles. Here, it
% seems obvious to guess that the oversteer cases are going to dominate in
% their unstability and high angular velocities. This is certainly true in
% our findings, but one difference between this and side slip angle is that
% in the angular velocity graph, the low velocity oversteer case is
% slightly higher than the high velocity understeer case, suggesting that
% the location of the CG has more effect than velocity on angular velocity.
% This makes sense intuitively, because moving the CG back even a little
% bit changes the center of rotation, which changes the rotating motion
% significantly. These graphs ultimately support our assumptions on the
% effect of the CG and velocity on vehicle handling and ease of control.
