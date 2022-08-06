clc, clear, close all
x0=[129,140,103.5,88,185.5,195,105,157.5,107.5,77,81,162,162,117.5];
y0=[7.5,141.5,23,147,22.5,137.5,85.5,-6.5,-81,3,56.5,-66.5,84,-33.5];
z0=-[4,8,6,8,6,8,8,9,9,8,8,9,4,9];
xm0=minmax(x0)  %求x0的最小值和最大值
ym0=minmax(y0)  %求y0的最小值和最大值
xi=xm0(1):xm0(2); %插值节点的x坐标取值
yi=ym0(1):ym0(2); %插值节点的y坐标取值
Fz=scatteredInterpolant(x0',y0',z0','natural','nearest')
[xi,yi]=meshgrid(xi,yi); %化成网格数据
zi=Fz(xi,yi); mesh(xi,yi,zi)

