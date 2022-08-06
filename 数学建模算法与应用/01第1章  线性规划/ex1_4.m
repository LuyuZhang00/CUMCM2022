clc, clear
prob = optimproblem
x = optimvar('x',4,4,'LowerBound',0);
prob.Objective = 2800*sum(x(:,1))+4500*sum(x(1:3,2))+...
    6000*sum(x(1:2,3))+7300*x(1,4);
prob.Constraints.con = [sum(x(1,:))>=15,
    sum(x(1,2:4))+sum(x(2,1:3))>=10,
    x(1,3)+x(1,4)+x(2,2)+x(2,3)+x(3,1)+x(3,2)>=20,
    x(1,4)+x(2,3)+x(3,2)+x(4,1)>=12];
[sol,fval,flag,out]= solve(prob), sol.x
