clc, clear, close all
a=readmatrix('data7_21.txt')'  %注意矩阵转置 
[p,t,st]=anova2(a,2)
