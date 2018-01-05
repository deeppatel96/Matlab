function xa = f1(va,theta1a)
L = 1.9;
t0 = 2;
delta0 = 3.14 * 5/180;
va1 = 30*1000/3600;
theta1dota = va1*delta0/L;
[ta theta1a] = ode45(@(ta, theta1a) theta1dota,[0 t0], 0)
xa = va*cos(theta1a);
