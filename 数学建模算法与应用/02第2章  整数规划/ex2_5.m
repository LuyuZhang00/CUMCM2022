clc, clear, prob = optimproblem;
x = optimvar('x',6,'Type','integer','LowerBound',0);
prob.Objective = sum(x);
con = optimconstr(6);
a = [35,40,50,45,55,30];
con(1) = x(1)+x(6)>=35;
for i =1 :5
    con(i+1) = x(i)+x(i+1)>=a(i+1);
end
prob.Constraints.con = con;
[sol, fval, flag] = solve(prob), sol.x