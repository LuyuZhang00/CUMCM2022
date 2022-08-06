clc, clear, close all
a=zeros(6); %邻接矩阵初始化
a(1,[2:6])=[15 20 27 37 54];
a(2,[3:6])=[15 20 27 37];
a(3,[4:6])=[16 21 28];
a(4,[5,6])=[16 21]; a(5,6)=17;  %输入有向图的邻接矩阵
s=cellstr(strcat('v',int2str([1:6]')));
G=digraph(a,s);  %构造赋权有向图
p=plot(G,'Layout','force','EdgeColor','k','NodeFontSize',12);
[path,d,edge]=shortestpath(G,1,6)  
highlight(p,'Edges',edge)
