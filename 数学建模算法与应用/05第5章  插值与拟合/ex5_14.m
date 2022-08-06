clc, clear
x0=linspace(1,10,20); y0=linspace(3,20,20);
z0=1+2*log(x0)+3*y0;  %产生z=1+2lnx+3y的数据
g=fittype('a+b*log(x)+c*y', 'dependent', {'z'}, 'independent', {'x', 'y'})
f=fit([x0',y0'],z0',g,'StartPoint',rand(1,3))  %利用模拟数据拟合

