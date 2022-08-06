clc, clear, close all, a=zeros(9);
a(1,[2:9])=[2 1 3 4 4 2 5 4];
a(2,[3 9])=[4 1]; a(3,4)=1; a(4,5)=1;
a(5,6)=5; a(6,7)=2; a(7,8)=3; a(8,9)=5;
s=cellstr(strcat('v',int2str([0:8]')));
G=graph(a,s,'upper'); p=plot(G,'EdgeLabel',G.Edges.Weight);
T=minspantree(G,'Method','sparse') %Kruskal算法
L=sum(T.Edges.Weight), highlight(p,T)
