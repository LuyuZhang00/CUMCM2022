clc, clear, a = load('data3_8.txt');
mu = mean(a), F = cov(a)
x = optimvar('x',3,'LowerBound',0);
x0.x = rand(3,1); prob1 = optimproblem;
prob1.Objective = x'*F*x;
prob1.Constraints.con1= sum(x)==1;
prob1.Constraints.con2 = mu*x>=0.15;
[sol1,fval1,flag1,out1] = solve(prob1, x0)
sol1.x  %显示最优解

prob2 = optimproblem('ObjectiveSense','max');
prob2.Objective = mu*x;
prob2.Constraints.con1 = sum(x)==1;
prob2.Constraints.con2 = x'*F*x<=0.09;
[sol2,fval2,flag2,out2]= solve(prob2, x0)
sol2.x  %显示最优解
