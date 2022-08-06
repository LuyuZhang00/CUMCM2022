clc, clear, d=load('data5_15.txt');
xy0=d([1,2],:)'; z0=d(3,:)';
g=fittype('a*exp(b*x)+c*y^2','dependent','z','independent',{'x', 'y'})
[f,st]=fit(xy0,z0,g,'StartPoint',rand(1,3))


