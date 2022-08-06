clc, clear, close all
a=[1 1 1 1;1 1 1 0;1 1 0 1;1 0 1 1;1 0 1 0
   0 1 0 1;0 1 0 0;0 0 1 0;0 0 0 1; 0 0 0 0]; %每一行是一个可行状态
b=[1 0 0 0;1 1 0 0;1 0 1 0;1 0 0 1]; %每一行是一个转移状态
w=zeros(10); %邻接矩阵初始化
for i=1:9
    for j=i+1:10
        for k=1:4
            if strfind(xor(a(i,:),b(k,:)),a(j,:))
                w(i,j)=1;
            end
        end
    end
end
[i,j,v]=find(w);  %找非零元素
s=cellstr(int2str([1:10]'));  %构造顶点字符串
G=graph(i,j,v,s)  %构造无向图
[p,d]=shortestpath(G,1,10)  %求最短路径和最短距离
h=plot(G,'Layout','circle','NodeFontSize',12,'EdgeColor','k') 
highlight(h,p,'LineWidth',2,'LineStyle','--') %最短路径虚线加粗
