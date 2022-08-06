clc, clear
a=readmatrix('data7_5_1.txt'); a=a(~isnan(a)); %去掉NaN值
pd=fitdist(a, 'Normal')
[yn,xn]=ecdf(a);  %计算经验分布函数值
y = cdf(pd, xn);   %计算原假设分布函数值
Dn=max(abs(yn-y))  %计算统计量的值
LJ=1.36/sqrt(length(a)) %计算拒绝域的临界值
[h,p,st,cv]=kstest(a,'CDF',pd) %直接调用工具箱函数进行KS检验
