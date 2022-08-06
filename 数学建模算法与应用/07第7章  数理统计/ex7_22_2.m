clc, clear, close all
a = readmatrix('data7_22.txt')
Y = [a(:,2); a([1:end-1],7)]; %提取y的数据
X = [a(:,[3:5]); a([1:end-1],[8:10])];
md = fitlm(X, Y)
md2 = fitlm(X(:,[2,3]), Y)  %重新建立模型
rstool(X, Y)  %使用图形界面解法求二项式回归模型

