clc, clear
x0=[5.764  6.286  6.759  7.168  7.408]';
y0=[0.648  1.202  1.823  2.526  3.360]';
a=[x0.^2, x0.*y0, y0.^2, x0, y0]; 
b=-ones(5,1); c=a\b
fxy=@(x,y)c(1)*x.^2+c(2)*x.*y+c(3)*y.^2+c(4)*x+c(5)*y+1; %定义匿名函数
h=fimplicit(fxy,[3.5,8,-1,5]), title('')
set(h,'Color','k','LineWidth',1.5)
xlabel('$x$','Interpreter','Latex')
ylabel('$y$','Interpreter','Latex','Rotation',0)
