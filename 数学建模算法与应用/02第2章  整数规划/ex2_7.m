clc, clear, a = load('data2_7.txt');
d = dist(a) %求两两列向量之间的距离
n=10; prob = optimproblem;
x = optimvar('x',n,'Type','integer','LowerBound',0,'UpperBound',1)
y = optimvar('y',n,n,'Type','integer','LowerBound',0,'UpperBound',1);
prob.Objective = sum(x);
con1 = [1<=sum(y)'; sum(y,2)<=5];
con2 = optimconstr(2*n^2);
con3 = optimconstr(n); k=0;
for i = 1:n
    for j = 1:n
        k = k+1;
        con2(2*k-1) = d(i,j)*y(i,j)<=10*x(i);
        con2(2*k) = y(i,j)<=x(i);
    end
end
for i = 1:n
    con3(i) = x(i)==y(i,i);
end
prob.Constraints.con1 = con1;
prob.Constraints.con2 = con2;
prob.Constraints.con3 = con3;
[sol, fval, flag] = solve(prob)
xx = sol.x, yy = sol.y 

        
