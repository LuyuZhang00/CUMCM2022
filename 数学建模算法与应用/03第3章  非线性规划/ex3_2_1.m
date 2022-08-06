clc, clear, format long g
syms x1 x2  %定义符号变量
f=(339-0.01*x1-0.003*x2)*x1+(399-0.004*x1-0.01*x2)*x2-(400000+195*x1+225*x2)
f=simplify(f) %化简目标函数
f1=diff(f,x1), f2=diff(f,x2)  %求目标函数关于x1,x2的偏导数
[x10,x20]=solve(f1,f2)  %解代数方程求驻点
x10=round(double(x10))   %取整
x20=round(double(x20))   %取整
f0=subs(f,{x1,x2},{x10,x20})  %求目标函数的取值
f0=double(f0)
subplot(121), fmesh(f,[0,10000,0,10000]),title('') %画三维图形
xlabel('$x_1$','Interpreter','Latex')
ylabel('$x_2$','Interpreter','Latex')
subplot(122), c=fcontour(f,[0,10000,0,10000]) 
contour(c.XData, c.YData, c.ZData, 'ShowText','on') %等高线标注
xlabel('$x_1$','Interpreter','Latex')
ylabel('$x_2$','Interpreter','Latex')
p1=339-0.01*x10-0.003*x20  %计算19英寸的平均售价
p2=399-0.004*x10-0.01*x20  %计算21英寸的平均售价
c=400000+195*x10+225*x20  %计算总支出
rate=f0/c  %计算利润率

