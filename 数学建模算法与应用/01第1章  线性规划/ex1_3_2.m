clc, clear
prob = optimproblem('ObjectiveSense','max');
x = optimvar('x',3,'LowerBound',0);
prob.Objective = 2*x(1) + 3*x(2)-5*x(3);
prob.Constraints.con1 = x(1)+x(2)+x(3) == 7;
prob.Constraints.con2 = 2*x(1)-5*x(2)+x(3) >=10;
prob.Constraints.con3 = x(1)+3*x(2)+x(3) <=12;
[sol,fval,flag,out]= solve(prob), sol.x
