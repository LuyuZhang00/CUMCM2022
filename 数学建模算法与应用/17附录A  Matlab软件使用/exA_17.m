clc, clear
I1 = integral(@(x)1./(x.*(x.^2-3*x+2).^(1/3)), 2, inf)
f2=@(x,y) sqrt(1-x.^2-y.^2);
ymax2=@(x) sqrt(x-x.^2); ymin2=@(x) -ymax2(x);
I2=integral2(f2,0,1,ymin2,ymax2)
f3=@(x,y,z) z.^2.*log(x.^2+y.^2+z.^2+1)./(x.^2+y.^2+z.^2+1);
ymax3=@(x) sqrt(1-x.^2); ymin3=@(x) -ymax3(x);
zmax3=@(x,y) sqrt(1-x.^2-y.^2);
I3=integral3(f3,-1,1,ymin3,ymax3,0,zmax3)