clc, clear, m=2; n=6;
d=load('data14_4.txt');
a=d([1,2],:)'; b=d([3,4],:)';
prob=optimproblem('ObjectiveSense','max');
u=optimvar('u',m,'LowerBound',0); 
v=optimvar('v',m,'LowerBound',0); %列向量
prob.Constraints.con1 = a*u>=b*v;
for j=1:n
    fprintf('第%d个学校计算结果如下：\n',j)
    prob.Objective=b(j,:)*v;
    prob.Constraints.con2 = a(j,:)*u==1;
    [sol,fval]=solve(prob)
    su=sol.u, sv=sol.v  %显示最优解
end   
