clc, clear, close all
a=readmatrix('data7_5_1.txt'); a=a(~isnan(a)); %去掉NaN值
pd=fitdist(a, 'Normal'), qqplot(a,pd)  %Matlab工具箱直接画Q-Q图
sa=sort(a); %把a按照从小到大排列
n=length(a); pi=([1:n]-1/2)/n;
yi=norminv(pi,pd.mu,pd.sigma)'; %计算对应的yi值
hold on, plot(yi,sa,'o') %再重新描点画Q-Q图

