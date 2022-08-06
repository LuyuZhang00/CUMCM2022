clc, clear, close all
a=readmatrix('data7_18.txt')
[p,t,st]=anova1(a)
Fa=finv(0.95, t{2,3}, t{3,3})  %计算F分布的上alpha分位数

