r = @(s,t) 2 + sin(7*s + 5*t);
x = @(s,t) r(s,t).*cos(s).*sin(t);
y = @(s,t) r(s,t).*sin(s).*sin(t);
z = @(s,t) r(s,t).*cos(t);
fmesh(x,y,z,[0, 2*pi, 0, pi]), alpha(0.8)
