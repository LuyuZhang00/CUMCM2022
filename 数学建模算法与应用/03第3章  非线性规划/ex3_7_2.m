clc, clear, prob = optimproblem;
x = optimvar('x',3,'LowerBound',0);
prob.Objective = sum(x.^2)+8;
con1 = [-x(1)^2+x(2)-x(3)^2 <= 0
x(1)+x(2)^2+x(3)^3 <= 20];  %非线性不等式约束
con2 = [-x(1)-x(2)^2+2 == 0
         x(2)+2*x(3)^2 == 3]; %非线性等式约束
prob.Constraints.con1 = con1;
prob.Constraints.con2 = con2;
x0.x=rand(3,1);  %非线性规划必须赋初值
[sol,fval,flag,out]= solve(prob,x0), sol.x

