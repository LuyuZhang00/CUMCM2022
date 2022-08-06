f = @(x,y,z) x.^2/4+y.^2/10-z.^2/8-1;
subplot(121), fimplicit3(f,[-20,20,-20,20,-15,15])
x=@(u,v)2*cosh(v).*cos(u);
y=@(u,v)sqrt(10)*cosh(v).*sin(u);
z=@(u,v)2*sqrt(2)*sinh(v);
subplot(122), fmesh(x,y,z,[0,2*pi,-pi,pi])
