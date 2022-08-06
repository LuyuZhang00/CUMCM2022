clc, clear, format long g
h=[-1,-0.15;-0.15,-2]; 
f=[98;277]; a=[1,1;1,-2]; b=[100;0];
prob = optimproblem('ObjectiveSense','max');
x = optimvar('x',2,'LowerBound',0);
prob.Objective = x'*h*x+f'*x;
prob.Constraints.con = a*x<=b;
[sol,fval,flag,out]= solve(prob)
sol.x  %显示最优解
format short  %恢复到短小数的显示格式
