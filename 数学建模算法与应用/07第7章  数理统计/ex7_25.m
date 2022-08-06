clc, clear
a = readmatrix('data7_25.txt');
X = a(:,[1:end-1]); Y = a(:,end);
md = fitlm(X,Y)   %拟合线性回归模型
mdl = stepwiselm(X, Y, 'y~1+x1+x2+x3+x4') %逐步线性回归
