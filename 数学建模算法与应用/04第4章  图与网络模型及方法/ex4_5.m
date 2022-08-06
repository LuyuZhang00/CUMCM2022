clc, clear, close all
E = [1, 3, 10; 1, 4, 60; 2, 3, 5; 2, 4, 20; 3, 4, 1];
G = graph(E(:,1), E(:,2), E(:,3));
W1 = adjacency(G,'weighted'), W2 = incidence(G)
plot(G,'Layout','force','EdgeLabel',G.Edges.Weight)
