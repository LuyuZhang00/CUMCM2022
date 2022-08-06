clc, clear, close all, format long g
M =10000; prob = optimproblem; 
x = optimvar('x',6,1,'LowerBound',0);
r=[0.05,0.28,0.21,0.23,0.25]; %收益率
p=[0, 0.01, 0.02, 0.045, 0.065]; %交易费率
q=[0, 0.025, 0.015, 0.055, 0.026]'; %风险损失率
%w = 0:0.1:1 
w = [0.766, 0.767, 0.810, 0.811, 0.824, 0.825, 0.962, 0.963, 1.0]
V = []; %风险初始化
Q = []; %收益初值化
X = []; %最优解的初始化
prob.Constraints.con1 = (1+p)*x(1:end-1)==M;
prob.Constraints.con2 = q(2:end).*x(2:end-1)<=x(end);
for i = 1:length(w)
    prob.Objective = w(i)*x(end)-(1-w(i))*(r-p)*x(1:end-1);
    [sol,fval,flag,out]=solve(prob);
    xx = sol.x; V=[V,max(q.*xx(1:end-1))];
    Q=[Q,(r-p)*xx(1:end-1)]; X=[X; xx'];
    plot(V, Q, '*-'); grid on
    xlabel('风险（元）'); ylabel('收益（元）')
end
V, Q, format

