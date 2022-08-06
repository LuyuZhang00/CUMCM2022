clc, clear
syms x(t)  [3, 1]  %定义符号向量函数，x(t)后面有空格
A=[3 -1 1;2 0 -1;1 -1 2];
[s1,s2,s3]=dsolve(diff(x)==A*x,x(0)==ones(3,1)) 
