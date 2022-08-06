clc, clear
c = [1:4]'; b = [-2,-1,-1/2]';
a = [1,-1,-1,1;1,-1,1,-3;1,-1,-2,3];
prob = optimproblem; x = optimvar('x',4); 
obj = @(x) c'*abs(x);
prob.Objective=fcn2optimexpr(obj,x);
prob.Constraints.con = a*x<=b;
x0.x = rand(4,1);  %非线性规划需要初值
[sol,fval,flag,out]=solve(prob,x0)
xx = sol.x


