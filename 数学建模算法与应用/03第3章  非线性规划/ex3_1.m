clc, clear, prob = optimproblem;
x = optimvar('x',2,'LowerBound',0);
prob.Objective = sum(x.^2)-4*x(1)+4;
con = [-x(1)+x(2)-2 <= 0
x(1)^2-x(2)+1 <= 0];  %不等式约束
prob.Constraints.con = con;
x0.x = rand(2,1)  %非线性规划必须赋初值
[sol,fval,flag,out] = solve(prob,x0), sol.x
