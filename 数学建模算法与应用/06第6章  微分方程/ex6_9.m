clc, clear, close all, syms y(x)
y=dsolve(diff(y)==-2*y+2*x^2+2*x, y(0)==1)
dy=@(x,y)-2*y+2*x^2+2*x;
[sx, sy]=ode45(dy, [0,0.5], 1)
fplot(y,[0,0.5]), hold on
plot(sx, sy, '*'); legend({'符号解','数值解'})
xlabel('$x$','Interpreter','Latex')
ylabel('$y$','Interpreter','Latex','Rotation',0)
