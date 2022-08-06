clc, clear
L = [1,2,5; 1,3,10; 1,4,11; 2,5,4
     3,4,4; 3,5,0; 4,6,15; 5,6,21
     5,7,25; 5,8,35; 6,7,0; 6,8,20; 7,8,15];
prob = optimproblem;
x = optimvar('x', 8, 'LowerBound',0)
prob.Objective = sum(x);
n = length(L); con = optimconstr(n);
for k = 1:n
    con(k) = x(L(k,2))>=x(L(k,1))+L(k,3);
end
prob.Constraints.con = con; 
[sol, fval, flag, out] = solve(prob)
xx = sol.x'  %显示最优解
