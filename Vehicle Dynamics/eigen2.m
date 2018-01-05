function xdot = eigen2(t,x)
T = 1.15;
V = 120;
Cf = -250 * 180 / pi;
Cr = -250 * 180 / pi;
b = 4.6;
L = 8.7;
c = L - b;
W = 3500;
m = W / 32.17;
Ig = 2550;

if t<=T
    d = 1.4*pi/180;
elseif t<(2*T)
    d = -1.4*pi/180;
else
    d = 0;
end

dx(1)= (Cf+Cr)/(m*V)*x(1) + ((1/(m*V.^2))*(b*Cf - c*Cr) -1)*x(2) - Cf/(m*V)*d;
dx(2)= (b*Cf-c*Cr)/Ig*x(1) + 1/(Ig*V)*((b.^2)*Cf + (c.^2)*Cr)*x(2) - b*Cf/Ig*d;
dx(3)= x(2);

xdot=[dx(1);dx(2);dx(3)];

end

