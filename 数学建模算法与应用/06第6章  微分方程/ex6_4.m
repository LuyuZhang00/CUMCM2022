clc, clear, syms y(x)  %定义符号函数ｙ，自变量为x
dy=diff(y);  %定义y的一阶导数，目的是下面赋初值
y=dsolve(diff(y,2)-2*diff(y)+y==exp(x), y(0)==1, dy(0)==-1)
