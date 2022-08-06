clc, clear, close all, L=100; %求解时间长度
x=20:5:80; y=10:5:80; [x,y]=meshgrid(x,y);
u=0.2*x-0.005*x.*y; v=-0.5*y+0.01*x.*y;
quiver(x,y,u,v), hold on
dxy=@(t,z)[0.2*z(1)-0.005*z(1)*z(2)
          -0.5*z(2)+0.01*z(1)*z(2)]; %定义微分方程组的右端项
sol=ode45(dxy,[0,100],[70;40]);
xt=@(t)deval(sol,t,1); yt=@(t)deval(sol,t,2);
fplot(xt,yt,[0,L]), xlabel('$x$','Interpreter','latex')
ylabel('$y$','Interpreter','latex','Rotation',0)
figure(2), hold on
fplot(xt,[0,100],'--','LineWidth',1.5)  %画x(t)的解曲线
fplot(yt,[0,100],'LineWidth',1.5) %画y(t)的解曲线
xlabel('$t$','Interpreter','Latex')
legend({'$x(t)$','$y(t)$'},'Interpreter','latex')
fprintf('请在虚线上选取两个相邻的极小点！\n')
[t1,xx]=ginput(2) %用鼠标取x(t)上的相邻2个极小点
fprintf('请在实线上选取两个相邻的极小点！\n')
[t2,yy]=ginput(2) %用鼠标取y(t)上的相邻2个极小点
T1=diff(t1), T2=diff(t2)  %求近似的周期
[xt1,fx1]=fminbnd(xt,0,L)   %求x的最小点及最小值
[xt2,fx2]=fminbnd(@(t)-xt(t),0,L) %求x的最大点及最大值
[yt1,fy1]=fminbnd(yt,0,20)   %求y在[0,20]上的最小点及最小值
[yt2,fy2]=fminbnd(yt,20,40)   %求y在[20,40]上的最小点及最小值
T=yt2-yt1  %求精确的周期
[yt3,fy3]=fminbnd(@(t)-yt(t),0,L) %求y的最大点及最大值
