subplot(121)
fimplicit3(@(x,y,z)x.^2/9+y.^2/4-z.^2,[-6,6,-4,4,-2,2])
subplot(122), x=@(s,t) 3*tan(s).*cos(t);
y=@(s,t) 2*tan(s).*sin(t); z=@(s,t) tan(s);
fsurf(x,y,z,[-1,1,0,2*pi])
