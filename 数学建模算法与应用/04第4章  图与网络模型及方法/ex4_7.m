clc, clear, close all, a=zeros(11);
a(1,2)=2;a(1,3)=8;a(1,4)=1;
a(2,3)=1;a(2,3)=6;a(2,5)=1;
a(3,4)=7;a(3,5)=5;a(3,6)=1;a(3,7)=2;
a(4,7)=9; a(5,6)=3;a(5,8)=2;a(5,9)=9;
a(6,7)=4;a(6,9)=6; a(7,9)=3;a(7,10)=1;
a(8,9)=7;a(8,11)=9; 
a(9,10)=1;a(9,11)=2; a(10,11)=4;
s=cellstr(strcat('v',int2str([1:11]')));  %顶点字符串
G=graph(a,s,'Upper');  %利用邻接矩阵的上三角元素构造无向图
[p,d]=shortestpath(G,1,11) %求最短路径和最短距离
h=plot(G,'EdgeLabel',G.Edges.Weight);  %画无向图
highlight(h,p,'EdgeColor','r','LineWidth',2) %最短路径加粗

