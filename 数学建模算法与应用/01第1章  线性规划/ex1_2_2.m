clc, clear
prob = optimproblem('ObjectiveSense', 'max')
c = [4;3]; b = [10;8;7];
a = [2,1;1,1;0,1]; lb = zeros(2,1);
x = optimvar('x',2,'LowerBound',0);
prob.Objective = c'*x;
prob.Constraints.con = a*x<=b;
[sol, fval, flage, out] = solve(prob)
sol.x  %显示决策变量的值