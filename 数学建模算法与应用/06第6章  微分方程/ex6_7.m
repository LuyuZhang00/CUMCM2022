clc,clear
syms x(t)  [3,1]  %定义符号向量函数，x(t)后面有空格
A=[1,0,0;2,1,-2;3,2,1]; B=[0;0;exp(t)*cos(2*t)];
x0=[0;1;1]; %初值条件
[s1,s2,s3]=dsolve(diff(x)==A*x+B,x(0)==x0) %求符号解
