clc, clear, close all
a = zeros(8); a(1,[2:4])=[6,4,5]; 
a(2,[3,5,6])=[3,9,9]; a(3,[4:7])=[5,6,7,3];
a(4,[3,7])=[2,5]; a(5,8)=12;
a(6,[5,8])=[8,10]; a(7,[6,8])=[4,15];
prob = optimproblem('ObjectiveSense','max');
f = optimvar('f',8,8,'LowerBound',0);
v = optimvar('v'); prob.Objective = v;
con1 = [sum(f(1,:))==v
        sum(f(:,[2:end-1]))'==sum(f([2:end-1],:),2)
        sum(f(:,8))==v];
prob.Constraints.con1 = con1;
prob.Constraints.con2 = f<=a;
[sol, fval, flag, out] = solve(prob)
ff = sol.f  %显示最大流对应的矩阵

