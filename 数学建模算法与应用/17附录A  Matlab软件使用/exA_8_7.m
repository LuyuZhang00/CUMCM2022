subplot(121), fimplicit3(@(x,y,z)x.^2/9+y.^2/4-1)
x=@(u,v)3*cos(u); y=@(u,v)2*sin(u); z=@(u,v)v;
subplot(122), fsurf(x,y,z)
