clc, clear, close all
x=-5:0.2:5; [x,y]=meshgrid(x); %生成网格数据
z=(sin(x.*y)+eps)./(x.*y+eps); %为避免0/0,分子分母都加eps
subplot(121), mesh(x,y,z)
subplot(122), fmesh(@(x,y)sin(x.*y)./(x.*y))

