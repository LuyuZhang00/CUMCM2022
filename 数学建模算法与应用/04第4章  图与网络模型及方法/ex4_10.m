clc, clear, close all
a=zeros(6); a(1,[2 5])=[20 15];
a(2,[3:5])=[20 60 25];
a(3,[4 5])=[30 18]; a(5,6)=15;
s=cellstr(strcat('v',int2str([1:6]')));
G=graph(a,s,'upper'); d=distances(G)
plot(G,'EdgeLabel',G.Edges.Weight,'Layout','force')
d1=max(d,[],2)  %逐行求最大值
[d2,ind]=min(d1) %求向量的最小值,及最小值的地址
v=find(d(ind,:)==d2)  %求向量中取值为d2的地址
