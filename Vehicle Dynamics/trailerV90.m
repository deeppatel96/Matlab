function xdot = trailerV90(t,x)
L=1.9;
s=4.4;
V=25;

if t<=2
    d=pi/2240;
elseif t<4
    d=0;
elseif t<=6
    d=-pi/2240;
else
    d = 0;
end

dx(1)=V*cos(x(3));
dx(2)=V*sin(x(3));
dx(3)=V*d/L;
dx(4)=V*cos(x(3)-x(6))*cos(x(6));
dx(5)=V*cos(x(3)-x(6))*sin(x(6));
dx(6)=(V*sin(x(3)-x(6)))/s;


xdot=[dx(1);dx(2);dx(3);dx(4);dx(5);dx(6)];
end