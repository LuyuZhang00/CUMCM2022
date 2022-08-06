clc, clear, a=load('data5_6.txt');
x0=a(1:3:end,:); x0=x0'; x0=x0(:); %提取点的横坐标
y1=a(2:3:end,:); y1=y1'; y1=y1(:); %提出下边界的纵坐标
y2=a(3:3:end,:); y2=y2'; y2=y2(:);
L1=trapz(x0,sqrt(1+gradient(y1,x0).^2)); %计算下边界的长度
L2=trapz(x0,sqrt(1+gradient(y2,x0).^2)); %计算上边界的长度
L=L1+L2; %计算地图上边界的长度
LL=L/18*40 %计算实际的边界长度
S=trapz(x0,y2-y1); %计算地图上的近似面积
SS=S/18^2*1600  %换算成实际近似面积
