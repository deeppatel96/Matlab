function xd = f60(t, x)
L = 1.9;
s = 4.4;
V = 60*1000/3600;

if (t>=0 && t<=2)
    delta = pi * 0.18560853/180;
elseif (t>=2 && t<=4)
    delta = 0;
elseif (t>=4 && t<=6)
    delta = -pi * 0.1856853/180;
else
    delta = 0;
end

dx(1) = V * cos(x(3));
dx(2) = V * sin(x(3));
dx(3) = V * delta/L;
dx(4) = V * cos(x(3)-x(6)) * cos(x(6));
dx(5) = V * cos(x(3)-x(6)) * sin(x(6));
dx(6) = (V * cos(x(3)-x(6))*(x(3)-x(6)))/s;

xd = [dx(1); dx(2); dx(3); dx(4); dx(5); dx(6)];

end

