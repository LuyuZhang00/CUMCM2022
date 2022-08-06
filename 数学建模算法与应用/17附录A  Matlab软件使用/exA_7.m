clc, clear, close all
f = @(x,y,z)x.^2+(sqrt(y.^2+z.^2)-5).^2-16
subplot(121), fimplicit3(f,[-4,4,-9,9,-9,9])
x=@(u,v) 4*cos(u);
y=@(u,v) (5+4*sin(u)).*cos(v);
z=@(u,v) (5+4*sin(u)).*sin(v);
subplot(122), fsurf(x,y,z)
