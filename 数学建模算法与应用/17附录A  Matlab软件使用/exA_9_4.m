x = @(u,v) exp(-abs(u)/10).*sin(5*abs(v));
y = @(u,v) exp(-abs(u)/10).*cos(5*abs(v));
z = @(u,v) u;  fsurf(x,y,z)
