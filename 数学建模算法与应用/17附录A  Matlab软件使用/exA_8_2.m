f=@(x,y,z) x.^2/9-y.^2/4-z.^2-1;
subplot(121), fimplicit3(f,[-180,180,-200,200,-60,60])
x=@(u,v)3*sinh(u); y=@(u,v)2*cosh(u).*cos(v);
z=@(u,v)cosh(u).*sin(v);
subplot(122), fsurf(x,y,z)