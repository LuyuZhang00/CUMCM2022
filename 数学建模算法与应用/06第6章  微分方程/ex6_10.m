clc, clear, close all
dy=@(x,y)[y(2); sqrt(1+y(2)^2)/5/(1-x)];
[x,y]=ode45(dy,[0,0.999999],[0;0])
plot(x, y(:,1)), xlabel('$x$','Interpreter','Latex')
ylabel('$y$','Interpreter','Latex','Rotation',0)
