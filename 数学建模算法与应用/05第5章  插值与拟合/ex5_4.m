clc, clear, close all
x0=[0   3   5   7   9   11   12   13   14  15];
y0=[0  1.2  1.7  2.0  2.1  2.0  1.8  1.2   1.0  1.6];
x=0:0.1:15; y1=lagrange(x0,y0,x);  %拉格朗日插值
y2=interp1(x0,y0,x);  %分段线性插值
y3=interp1(x0,y0,x,'spline');  %三次样条插值
pp4=csape(x0,y0); y4=fnval(pp4,x); %三次样条插值
yx5=griddedInterpolant(x0,y0,'spline') %三次样条插值 
y5=yx5(x); [y1',y2',y3',y4',y5']  %五种插值函数比较
subplot(1,3,1), plot(x,y1), title('朗格朗日插值')
subplot(1,3,2), plot(x,y2), title('分段线性插值')
subplot(1,3,3), plot(x,y3), title('三次样条插值')
dx=diff(x); dy=diff(y3);
dy_dx=dy./dx; dy_dx0=dy_dx(1)
ytemp=y3(131:151); ymin=min(ytemp);
index=find(y3==ymin); 
xmin=x(index); [xmin,ymin] 
