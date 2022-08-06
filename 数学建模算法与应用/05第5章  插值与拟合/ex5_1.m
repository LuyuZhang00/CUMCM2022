clc, clear
x0=[1:6]'; y0=[16, 18, 21, 17, 15, 12]';
A=vander(x0), p=A\y0
x=[1.5, 2.6];
yh=polyval(p,x)  %求估计值