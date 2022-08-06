clc, clear, close all, w=20;
df=@(t,f,w)[w/sqrt((10+20*cos(t)-f(1))^2+...
    (20+15*sin(t)-f(2))^2)*(10+20*cos(t)-f(1))
    w/sqrt((10+20*cos(t)-f(1))^2+...
    (20+15*sin(t)-f(2))^2)*(20+15*sin(t)-f(2))];
t0=0; tf=5; %时间的终值是适当估计的
s1=ode45(@(t,x)df(t,x,w),[t0,tf],[0;0]); %求微分方程的数值解
d1=@(t)sqrt((deval(s1,t,1)-10-20*cos(t)).^2+...
    (deval(s1,t,2)-20-15*sin(t)).^2); %t时刻人和狗的距离
[tmin,fmin]=fminbnd(d1,0,tf) %求两者距离的最小值及对应的时间
t=0:0.1:tf; subplot(121), plot(t,d1(t))  %画出两者之间的距离
xlabel('$t$','Interpreter','latex'), ylabel('两者之间的距离')

w=5; tf=60; 
[t,s]=ode45(@(t,x)df(t,x,w),[t0,tf],[0;0]); %求微分方程的数值解
d2=sqrt((s(:,1)-10-20*cos(t)).^2+(s(:,2)-20-15*sin(t)).^2); %计算两者距离
subplot(122), plot(t,d2)  %画出两者之间的距离
xlabel('$t$','Interpreter','latex'), ylabel('两者之间的距离')