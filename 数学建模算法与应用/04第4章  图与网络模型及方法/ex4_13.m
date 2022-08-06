clc, clear, close all, n = 9;
nod =cellstr(strcat('v',int2str([0:n-1]')));
G = graph(); G = addnode(G,nod);
ed ={ 'v0','v1',2;'v0','v2',1;'v0','v3',3;'v0','v4',4
    'v0','v5',4;'v0','v6',2;'v0','v7',5;'v0','v8',4
    'v1','v2',4;'v1','v8',1;'v2','v3',1;'v3','v4',1
    'v4','v5',5;'v5','v6',2;'v6','v7',3;'v7','v8',5};
G = addedge(G,ed(:,1),ed(:,2),cell2mat(ed(:,3))); 
w = full(adjacency(G,'weighted'));
w(w==0) = 1000000; %这里1000000表示充分大的正实数
prob = optimproblem;
x = optimvar('x',n,n,'Type','integer','LowerBound',0,'UpperBound',1);
u = optimvar('u',n,'LowerBound',0);
prob.Objective = sum(sum(w.*x));
con1 = [1<=sum(x(1,:)); 1<=u(2:end); u(2:end)<=n-1];
con2 = [sum(x(:,[2:end]))'==1; u(1)==0]; 
con3 = optimconstr(n*(n-1)); k=0;
for i = 1:n
    for j = 2:n
        k=k+1; con3(k) = u(i)-u(j)+n*x(i,j)<=n-1;
    end
end
prob.Constraints.con1 = con1;
prob.Constraints.con2 = con2;
prob.Constraints.con3 = con3;
[sol,fval,flag,out] = solve(prob)
[i,j]=find(sol.x);
ind = [i'; j']  %输出树的顶点编号
