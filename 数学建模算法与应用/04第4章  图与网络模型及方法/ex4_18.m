clc, clear
NN = cellstr(strcat('v',int2str([2:5]')));  %构造中间节点
NN = {'vs',NN{:},'vt'};  %添加发点和收点
L={'vs','v2',5,3; 'vs','v3',3,6; 'v2','v4',2,8; 'v3','v2',1,2
   'v3','v5',4,2; 'v4','v3',1,1; 'v4','v5',3,4; 'v4','vt',2,10
   'v5','vt',5,2};
G = digraph; G = addnode(G, NN);
G1 = addedge(G,L(:,1),L(:,2),cell2mat(L(:,3)));
[M, F] = maxflow(G1,'vs','vt')  %求最大流

G2 = addedge(G, L(:,1), L(:,2), cell2mat(L(:,4)));
c = full(adjacency(G1, 'weighted'));  %导出容量矩阵
b = full(adjacency(G2, 'weighted'));  %导出费用矩阵
f = optimvar('f',6,6,'LowerBound',0);
prob = optimproblem; prob.Objective = sum(sum(b.*f));
con1 = [sum(f(1,:))==M
        sum(f(:,[2:end-1]))'==sum(f([2:end-1],:),2)
        sum(f(:,end))==M];
prob.Constraints.con1 = con1;
prob.Constraints.con2 = f<=c;
[sol, fval, flag, out] = solve(prob)
ff = sol.f  %显示最小费用最大流对应的矩阵
