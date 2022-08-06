clc, clear, close all
x=-5:0.2:5; [x,y]=meshgrid(x);
z=(sin(x.*y)+eps)./(x.*y+eps); 
subplot(121), surf(x,y,z)
subplot(122), fsurf(@(x,y)sin(x.*y)./(x.*y))