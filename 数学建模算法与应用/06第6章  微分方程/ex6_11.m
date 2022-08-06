clc, clear, close all, rng(2)  %为了进行一致性比较，每次运行取相同随机数
sigma=10; rho=28; beta=8/3; T=80;
g=@(t,f)[sigma*(f(2)-f(1)); rho*f(1)-f(2)-f(1)*f(3); f(1)*f(2)-beta*f(3)]; 
xyz0=rand(3,1); %初始值
[t,xyz]=ode45(g,[0,T],xyz0); %求数值解
subplot(121), plot3(xyz(:,1),xyz(:,2),xyz(:,3)) %轨线图
xlabel('$x(t)$','Interpreter','latex')
ylabel('$y(t)$','Interpreter','latex') 
zlabel('$z(t)$','Interpreter','latex'), box on  %加盒子线以突出立体感
so=ode45(g,[0,T],xyz0+0.00001) %初值变化后，再求数值解
xyz2=deval(so,t); %返回值为3行的矩阵，计算对应的x,y,z的值
subplot(122), plot(t,xyz(:,1)-xyz2(1,:)','.-') 
xlabel('$x(t)$','Interpreter','latex')
ylabel('$x_1(t)-x_2(t)$','Interpreter','latex')
