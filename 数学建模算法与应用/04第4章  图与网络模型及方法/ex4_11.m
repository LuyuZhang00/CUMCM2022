clc, clear, a = zeros(6);
a(1,[2,5])=[18,15]; a(2,[3:5])=[20,60,12];
a(3,[4,5])=[30,18]; a(4,6)=10; a(5,6)=15;
b = a+a';  %输入完整的邻接矩阵
b(b==0)=1000000;  %这里1000000表示充分大的正实数
prob = optimproblem;
x = optimvar('x',6,6,'Type','integer','LowerBound',0,'UpperBound',1);
prob.Objective = sum(sum(b.*x));
con1 = optimconstr(4);
for i =setdiff([1:6],[2,4])
    con1(i) = sum(x(i,:))==sum(x(:,i));
end
prob.Constraints.con1 = con1;
prob.Constraints.con2 = [sum(x(2,:))==1; sum(x(:,2))==0; sum(x(:,4))==1];
[sol,fval,flag,out]= solve(prob), xx=sol.x
[i,j] = find(xx);  %找非零元素的行标和列标
ij = [i'; j']

