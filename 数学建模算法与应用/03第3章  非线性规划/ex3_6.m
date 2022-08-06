clc, clear, prob=optimproblem;  %最小值问题
x=optimvar('x',2); 
prob.Objective = 100*(x(2)-x(1)^2)^2+(1-x(1))^2;
x0.x=rand(2,1)  %初始值
[sol,fval,flag,out]=solve(prob,x0), sol.x
