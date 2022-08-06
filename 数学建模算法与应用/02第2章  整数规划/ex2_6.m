clc, clear, c = load('data2_6.txt');
prob = optimproblem;
x = optimvar('x',4,5,'Type','integer','LowerBound',0,'UpperBound',1);
prob.Objective = sum(sum(c.*x));
prob.Constraints.con1 = sum(x,1)==1;
prob.Constraints.con2 = sum(x,2)<=2;
[sol, fval, flag] = solve(prob), sol.x