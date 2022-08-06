clc, clear, a=load('data5_12.txt');
t0=a(1,:); y0=log(a(2,:));
p=polyfit(t0,y0,1), p(2)=exp(p(2))

