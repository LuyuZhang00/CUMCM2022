clc, clear, syms x
dy=diff(log((x+2)/(1-x)),x,3)
dy=simplify(dy)  %对符号函数进行化简
a=[0,0.5,2,4]; da=diff(a)