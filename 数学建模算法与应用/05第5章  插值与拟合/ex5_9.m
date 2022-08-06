clc, clear, t=[0:7]'; 
y=[27.0, 26.8, 26.5, 26.3, 26.1, 25.7, 25.3, 24.8]';
tb=mean(t); yb=mean(y);
ahat=sum((t-tb).*(y-yb))/sum((t-tb).^2) %编程计算
bhat=yb-ahat*tb
a=[t,ones(8,1)];
cs=a\y  %解超定线性方程组求拟合参数
