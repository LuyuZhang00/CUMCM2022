clc, clear, a = zeros(4);
a(1,[2:4])=[15,10,11];
a(2,[3,4])=[5,6]; a(3,4)=1;
G = graph(a,'upper');
d = distances(G,'Method','positive')

