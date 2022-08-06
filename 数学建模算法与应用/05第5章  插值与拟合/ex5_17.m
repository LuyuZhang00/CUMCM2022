clc, clear
g=@(a,b,c,d,k,x)(a+b*x).*(x<k)+(c+d*x).*(x>=k); %定义匿名函数
g=fittype(g) %生成fittype类型的函数类
x=[0.81;0.91;0.13;0.91;0.63;0.098;0.28;0.55;0.96;0.96;0.16;0.97;0.96];
y=[0.17;0.12;0.16;0.0035;0.37;0.082;0.34;0.56;0.15;-0.046;0.17;-0.091;-0.071];
f=fit(x,y,g,'StartPoint',[1, 0, 1, 0, 0.5])  %函数拟合
plot(f,x,y), legend({'原始数据点','拟合的曲线'})
xlabel('$x$','Interpreter','Latex')
ylabel('$y$','Interpreter','Latex','Rotation',0)
