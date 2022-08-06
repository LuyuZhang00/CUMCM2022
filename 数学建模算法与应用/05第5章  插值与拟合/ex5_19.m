clc, clear, close all, rng(1) %为了一致性比较，随机数种子是确定的
x0=linspace(-6,6,50); y0=linspace(-5,5,60);
[X0,Y0]=meshgrid(x0,y0); %生成网格数据
XX0=X0(:); YY0=Y0(:); %展开为长的列向量
zxy=@(c,xy)exp(-((xy(:,1)-c(1)).^2+(xy(:,2)-c(2)).^2)/2/c(3)^2);
Z0=zxy([1,4,6],[XX0,YY0])+normrnd(0,1,size(XX0)); %生成模拟数据函数值
c1=lsqcurvefit(zxy,rand(1,3),[XX0,YY0],Z0)  %拟合未知参数的值
f=fittype('exp(-((x-mu1)^2+(y-mu2)^2)/2/s^2)',...
    'independent',{'x','y'},'dependent','z');
[c2,gof]=fit([XX0,YY0],Z0,f,'StartPoint',rand(3,1)) %用fit拟合参数
f=@(x,y,c)exp(-((x-c(1)).^2+(y-c(2)).^2)/2/c(3)^2);
subplot(121); fsurf(@(x,y)f(x,y,[1,4,6]))  %画原来函数的图形
subplot(122); fsurf(@(x,y)f(x,y,c1)) %画拟合函数的图形
