clc, clear, close all
a=readmatrix('data7_5_1.txt'); a=a(~isnan(a)); %去掉NaN值
[f,x]=ecdf(a) %计算经验分布函数的取值
ecdf(a)  %画经验分布函数图形
grid on, xlabel('$x$','Interpreter','Latex')
ylabel('$F(x)$','Interpreter','Latex')
writematrix([x,f], 'data7_5_2.xlsx')


