clc, clear
x0=[1:50]'; y0=2*cos(2*x0)+6*sin(2*x0);
lb=[-inf*ones(1,5),1]; ub=[inf*ones(1,5),1]; %w参数在最后一个位置，约束w=1
[f,g]=fit(x0,y0,'fourier2','Lower',lb,'Upper',ub)
