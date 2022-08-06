clc, clear
a = 1 - 0.2^(1/12); m = 1.109 * 10 ^ 5;
w = [5.07, 11.55, 17.86, 22.99];
prob = optimproblem('ObjectiveSense', 'max');
x = optimvar('x', 4, 'LowerBound',10^7);
k = optimvar('k', 'LowerBound', 0, 'UpperBound', 0.874);
n = m/2*(1-a-0.42*k)^8*x(3)+m*(1-a-k)^8*x(4);
b = 1.22*10^11/(1.22*10^11+n);
prob.Objective = 0.42*k*w(3)*(1-(1-a-0.42*k)^8)/(a+0.42*k)*x(3)+ ...
                 k*w(4)*(1-(1-a-k)^8)/(a+k)*x(4);
con = [x(1) == b*n; x(2) == (1-a)^12*x(1); x(3) == (1-a)^12*x(2)
       x(4) == (1-a-0.42*k)^8*(1-a)^4*x(3)];
prob.Constraints.con = con;
x0.x = 10^11*rand(4,1); x0.k = rand;
[sol, f, flag, out] = solve(prob, x0)
