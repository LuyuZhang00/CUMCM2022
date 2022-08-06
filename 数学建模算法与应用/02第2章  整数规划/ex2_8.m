clc, clear, n=10^7;
x=unifrnd(0,12,[1,n]); y=unifrnd(0,9,[1,n]);
pinshu=sum(y<x.^2 & x<=3)+sum(y<12-x & x>=3);
area_appr=12*9*pinshu/n


        
