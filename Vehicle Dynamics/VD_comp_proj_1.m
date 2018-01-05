% Deep Patel

% Vehicle Dynamics Computer Project 1

% Fall 2017

%%
clear all, close all, clc

% Calculations
L = 1.9;
s = 4.4;
V = [30*1000/3600 60*1000/3600 90*1000/3600];
t = linspace(0, 6, 10000);
tspan = [0 6];
y0 = [0 0 0 -4.4 0 0];
[t30, x1] = ode45('f30', tspan, y0);
[t60, x2] = ode45('f60', tspan, y0);
[t90, x3] = ode45('f90', tspan, y0);

for j = 1:length(t)
    if (t(j) >= 0 && t(j) <= 2)
        delta1(j) = pi * 0.75/180;
        delta2(j) = pi * 0.18560853/180;
        delta3(j) = pi * 0.080357/180;
    elseif (t(j) >= 2 && t(j) <= 4)
        delta1(j) = 0;
        delta2(j) = 0;
        delta3(j) = 0;
    elseif (t(j) >= 4 && t(j) <= 6)
        delta1(j) = -pi * 0.75/180;
        delta2(j) = -pi * 0.18560853/180;
        delta3(j) = -pi * 0.080357/180;
    else
        delta1(j) = 0;
        delta2(j) = 0;
        delta3(j) = 0;
    end
end

theta1 = [x1(:, 3)];
theta2 = [x1(:,6)];

a30A = ((V(1)^2).*tan(delta1))/L;
a30D = ((V(1)^2).*tan(theta1-theta2))/s;
theta1dot30 = V(1).*tan(delta1)/L;
theta2dot30 = V(1).*cos(theta1-theta2).*tan(theta1-theta2)/s;

a60A=((V(2)^2).*tan(delta2))/L;
a60D = ((V(2)^2).*tan(theta1-theta2))/s;
theta1dot60 = V(2).*tan(delta2)/L;
theta2dot60 = V(2).*cos(theta1-theta2).*tan(theta1-theta2)/s;

a90A=((V(3)^2).*tan(delta3))/L;
a90D = ((V(3)^2).*tan(theta1-theta2))/s;
theta1dot90 = V(3).*tan(delta3)/L;
theta2dot90 = V(3).*cos(theta1-theta2).*tan(theta1-theta2)/s;

% Plots
figure;
plot(t30,x1(:,1),'r',t60,x2(:,1),'c',t90,x3(:,1),'g',t30,x1(:,4),'r-.',t60,x2(:,4),'c-.',t90,x3(:,4),'g-.'); grid on;
title('Time vs X Position');
xlabel('Time (s)'); ylabel('X Position (m)');
axis([0 6 -10 160]);
legend('Xa @ 30km/h','Xa @ 60km/h','Xa @ 90km/h','Xd @ 30km/h','Xd @ 60km/h','Xd @ 90km/h','location','nw');

figure;
plot(t30,x1(:,2),'r',t60,x2(:,2),'c',t90,x3(:,2),'g',t30,x1(:,5),'r-.',t60,x2(:,5),'c-.',t90,x3(:,5),'g-.');  grid on;
xlabel('Time (s)'); ylabel('Y Position (m)');
title('Time vs Y Position');
axis([0 6 0 4]); 
legend('Ya @ 30km/h','Ya @ 60km/h','Ya @ 90km/h','Yd @ 30km/h','Yd @ 60km/h','Yd @ 90km/h','location','se');

figure;
plot(t30,x1(:,3),'r',t60,x2(:,3),'c',t90,x3(:,3),'g',t30,x1(:,6),'r-.',t60,x2(:,6),'c-.',t90,x3(:,6),'g-.');  grid on;
xlabel('Time (s)'); ylabel('Theta (radians)');
title('Time vs Angular Orientation of Vehicle & Trailer');
axis([0 6 0 .14]);
legend('Theta1 @ 30km/h','Theta1 @ 60km/h','Theta1 @ 90km/h','Theta2 @ 30km/h','Theta2 @ 60km/h','Theta2 @ 90km/h','location','nw');

figure;
subplot(1,2,1)
plot(x1(:,2),x1(:,1),'r',x2(:,2),x2(:,1),'c',x3(:,2),x3(:,1),'g');  grid on;
xlabel('Ya (m)'); ylabel('Xa (m)'); 
title('Vehicle Path');
axis([0 4 0 150]);
legend('@ 30km/h','@ 60km/h','@ 90km/h','location','nw');

subplot(1,2,2)
plot(x1(:,5),x1(:,4),'r',x2(:,5),x2(:,4),'c',x3(:,5),x3(:,4),'g');  grid on;
xlabel('Yd (m)'); ylabel('Xd (m)');
title('Trailer Path');
axis([0 4 0 150]);
legend('@ 30km/h','@ 60km/h','@ 90km/h','location','nw');

figure;
plot(t,theta1dot30,'r',t,theta1dot60,'c',t,theta1dot90,'g');  grid on;
xlabel('Time (s)'); ylabel('Theta 1 Dot (rad/s)');
title('Time vs Angular Velocity of Vehicle');
legend('@ 30km/h','@ 60km/h','@ 90km/h','location','ne');

figure;
plot(t30,theta2dot30,'r',t30,theta2dot60,'c',t30,theta2dot90,'g');  grid on;
xlabel('Time (s)'); ylabel('Theta 2 Dot (rad/s)');
title('Time vs Angular Velocity of Trailer');
legend('@ 30km/h','@ 60km/h','@ 90km/h','location','ne');

figure;
plot(t,a30A,'r',t,a60A,'c',t,a90A,'g'); grid on;
title('Time vs. Lateral Acceleration of Vehicle');
xlabel('Time (s)'); ylabel('Aa (m/s^2)');
legend('@ 30km/h','@ 60km/h','@ 90km/h','location','ne');

figure;
plot(t30,a30D,'r',t30,a60D,'c',t30,a90D,'g'); grid on;
title('Time vs. Lateral Acceleration of Trailer');
xlabel('Time (s)'); ylabel('Ad (m/s^2)')
legend('@ 30km/h','@ 60km/h','@ 90km/h','location','ne');


