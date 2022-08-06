clc, clear, close all
mu=1/82.45; lamda=1-mu;
dz=@(t,z)[z(2); 2*z(4)+z(1)-lamda*(z(1)+mu)/((z(1)+mu)^2+z(3)^2)^(3/2)-...
          mu*(z(1)-lamda)/((z(1)+lamda)^2+z(3)^2)^(3/2)
          z(4); -2*z(2)+z(3)-lamda*z(3)/((z(1)+mu)^2+z(3)^2)^(3/2)-...
          mu*z(3)/((z(1)+lamda)^2+z(3)^2)^(3/2)];
[t,z]=ode45(dz,[0,100],[1.2 0 0 -1.0494])
plot(z(:,1), z(:,3), 'k')  %画轨迹图
xlabel('$x$', 'Interpreter', 'latex')
ylabel('$y$', 'Interpreter', 'latex', 'Rotation', 0)
