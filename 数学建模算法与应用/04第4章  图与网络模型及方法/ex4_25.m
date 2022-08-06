clc, clear
L = [1,2,5; 1,3,10; 1,4,11; 2,5,4
     3,4,4; 3,5,0; 4,6,15; 5,6,21
     5,7,25; 5,8,35; 6,7,0; 6,8,20; 7,8,15];
n = 8; N=size(L,1); obj=0; %目标函数初始化
prob = optimproblem('ObjectiveSense','max');
x = optimvar('x', n, n, 'Type','integer','LowerBound',0,'UpperBound',1);
for k=1:N
    obj=obj+x(L(k,1),L(k,2))*L(k,3);
end
con=optimconstr(n);
ind1=find(L(:,1)==1); con(1)=sum(x(1,L(ind1,2)))==1;
for i=2:n-1
    out=find(L(:,1)==i); in=find(L(:,2)==i);
    con(i)=sum(x(i,L(out,2)))==sum(x(L(in,1),i));
end
indn=find(L(:,2)==n); con(n)=sum(x(L(indn,1),n))==1;
prob.Constraints.con = con; prob.Objective=obj;
[sol, fval] = solve(prob), xx = sol.x  %显示最优解
[i,j] = find(xx); ij = [i'; j']


