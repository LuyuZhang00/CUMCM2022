clc, clear, syms k positive integer
X0 = [500; 1000; 500];
L = [0,4,3;0.5,0,0;0,0.25,0];
L = sym(L);  %转换为符号矩阵
X1 = L * X0, X2 = L * X1, X3 = L * X2
p = charpoly(L)  %计算特征多项式
r = roots(p)  %计算符号特征值
[P, D] = eig(L)  %计算符号特征向量和特征值
XL = P*diag([1,0,0])*inv(P)*X0
tc = inv(P)*X0; c = tc(1)
