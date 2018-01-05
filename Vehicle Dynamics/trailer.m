tspan=[0 6];
x0=[0,0,0,-4.4,0,0];
[t1,x]=ode45('trailerV30',tspan,x0);
[t2,y]=ode45('trailerV60',tspan,x0);
[t3,z]=ode45('trailerV90',tspan,x0);

V=[8.66 16.66 25];
t=(0:0.1:6);
L=1.9;

figure
subplot(2,3,1)
plot(t1,x(:,1),'r',t2,y(:,1),'b',t3,z(:,1),'g')
ylabel('Xa'); xlabel('Time')
title('Xa versus Time')
axis([0 6 0 180])

subplot(2,3,2)
plot(t1,x(:,2),'r',t2,y(:,2),'b',t3,z(:,2),'g')
ylabel('Ya'); xlabel('Time')
title('Ya versus Time')
axis([0 6 0 5])

subplot(2,3,3)
plot(t1,x(:,3),'r',t2,y(:,3),'b',t3,z(:,3),'g')
ylabel('Theta1'); xlabel('Time')
title('Theta1 versus Time')
axis([0 6 0 .14])

subplot(2,3,4)
plot(t1,x(:,4),'r',t2,y(:,4),'b',t3,z(:,4),'g')
ylabel('Xd'); xlabel('Time')
title('Xd versus Time')
axis([0 6 0 180])

subplot(2,3,5)
plot(t1,x(:,5),'r',t2,y(:,5),'b',t3,z(:,5),'g')
ylabel('Yd'); xlabel('Time')
title('Yd versus Time')
axis([0 6 0 5])

subplot(2,3,6)
plot(t1,x(:,6),'r',t2,y(:,6),'b',t3,z(:,6),'g')
ylabel('Theta2'); xlabel('Time')
title('Theta2 versus Time')
axis([0 6 0 0.14])


figure
subplot(2,1,1)
plot(x(:,2),x(:,1),'r',y(:,2),y(:,1),'b',z(:,2),z(:,1),'g')
ylabel('Xa'); xlabel('Ya')
title('Ya versus Xa')

subplot(2,1,2)
plot(x(:,5),x(:,4),'r',y(:,5),y(:,4),'b',z(:,5),z(:,4),'g')
xlabel('Yd')
ylabel('Xd')
title('Yd versus Xd')

V=[8.66 16.66 25];
t=(0:0.1:6);
L=1.9;
s = 4.4
for ii=1:length(t)
if t(ii)<=2
    d1(ii)=pi/250.2;
    d2(ii)=pi/972.6;
    d3(ii)=pi/2240;
elseif t(ii)<4
    d1(ii)=0;
    d2(ii)=0;
    d3(ii)=0;
elseif t(ii)<=6
    d1(ii)=-pi/250.2;
    d2(ii)=-pi/972.6;
    d3(ii)=-pi/2240;
else
    d1(ii) = 0;
    d2(ii)=0;
    d3(ii)=0;
end
end

theta1 = [x(:, 3)];
theta2 = [x(:,6)];



a1A = ((V(1)^2).*tan(d1))/L;
a1D = ((V(1)^2).*tan(theta1-theta2))/s;
theta1V30= V(1).*tan(d1)/L;
thetadot2 = V(1).*cos(theta1-theta2).*tan(theta1-theta2)/s;

a2A=((V(2)^2).*tan(d2))/L;
a2D = ((V(2)^2).*tan(theta1-theta2))/s;
theta1V60= V(2).*tan(d2)/L;
thetadot21 = V(2).*cos(theta1-theta2).*tan(theta1-theta2)/s;

a3A=((V(3)^2).*tan(d3))/L;
a3D = ((V(3)^2).*tan(theta1-theta2))/s;
theta1V90= V(3).*tan(d3)/L;
thetadot210 = V(3).*cos(theta1-theta2).*tan(theta1-theta2)/s;


figure
plot(t,theta1V30,'r',t,theta1V60,'b',t,theta1V90,'g')
figure
plot(t1,thetadot2,'r',t1,thetadot21,'b',t1,thetadot210,'g')
figure
plot(t,a1A,'r',t,a2A,'b',t,a3A,'g')
figure
plot(t1,a1D,'r',t1,a2D,'b',t1,a3D,'g')