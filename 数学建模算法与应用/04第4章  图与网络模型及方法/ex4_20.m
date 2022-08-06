clc, clear, xy=load('data4_20.txt');
d=mandist(xy); %求xy的两两列向量间的绝对值距离
s=cellstr(strcat('v',int2str([1:9]')));  %构造顶点字符串
G=graph(d,s);  %构造无向图
T=minspantree(G);  %用默认的Prim算法求最小生成树
L=sum(T.Edges.Weight)  %计算最小生成树的权重
T.Edges  %显示最小生成树的边集
h=plot(G,'Layout','circle','NodeFontSize',12);  %画无向图
highlight(h,T,'EdgeColor','r','LineWidth',2)  %加粗最小生成树的边
