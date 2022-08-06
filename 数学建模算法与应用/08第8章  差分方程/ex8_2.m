clc, clear, a=readmatrix('data6_18.txt');
x=a([2:2:6],:)'; x=x(~isnan(x));
A = [x(1:end-1), x(1:end-1).^2];  %构造线性方程组系数矩阵
cs = pinv(A) * x(2:end)  %求最小二乘解
y2010 = [x(end), x(end)^2] * cs  %求2010年的预测值