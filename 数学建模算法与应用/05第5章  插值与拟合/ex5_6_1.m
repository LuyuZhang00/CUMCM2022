clc, clear, close all, a=load('data5_6.txt');
x0=a(1:3:end,:); x0=x0'; x0=x0(:); %提取点的横坐标
y1=a(2:3:end,:); y1=y1'; y1=y1(:); %提出下边界的纵坐标
y2=a(3:3:end,:); y2=y2'; y2=y2(:); %提出上边界的纵坐标
plot(x0,y1,'*-'), hold on, plot(x0,y2,'.-')
pp1=csape(x0,y1); pp2=csape(x0,y2); %计算三次样条插值函数
dp1=fnder(pp1); dp2=fnder(pp2); %求三次样条插值函数的导数
L1=integral(@(x)sqrt(1+fnval(dp1,x).^2)+...
    sqrt(1+fnval(dp2,x).^2),x0(1),x0(end))  %计算地图上的弧长
L2=L1/18*40  %换算成边界的实际长度
S1=integral(@(x)fnval(pp2,x)-fnval(pp1,x),x0(1),x0(end))  %计算地图上面积
S2=S1/18^2*1600  %换算成实际面积
delta=(S2-41288)/41288  %计算与精确值的相对误差


