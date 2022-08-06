clc, clear, syms y(t)
dy=diff(y); d2y=diff(y,2); d3y=diff(y,3); %定义y的前3阶导数，是为了赋初值
u=exp(-t)*cos(t);
y=dsolve(diff(y,4)+10*diff(y,3)+35*diff(y,2)+50*diff(y)+24*y==diff(u,2),...
    y(0)==0,dy(0)==-1,d2y(0)==1,d3y(0)==1)

