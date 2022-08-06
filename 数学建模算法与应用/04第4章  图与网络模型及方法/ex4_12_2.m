clc, clear, close all
nod =cellstr(strcat('v',int2str([0:8]')));
G = graph; G = addnode(G,nod);
ed ={ 'v0','v1',2;'v0','v2',1;'v0','v3',3;'v0','v4',4
    'v0','v5',4;'v0','v6',2;'v0','v7',5;'v0','v8',4
    'v1','v2',4;'v1','v8',1;'v2','v3',1;'v3','v4',1
    'v4','v5',5;'v5','v6',2;'v6','v7',3;'v7','v8',5};
G = addedge(G,ed(:,1),ed(:,2),cell2mat(ed(:,3))); 
p=plot(G,'EdgeLabel',G.Edges.Weight);
T=minspantree(G), L=sum(T.Edges.Weight)
highlight(p,T)
