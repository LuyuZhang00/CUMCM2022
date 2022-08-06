clc, clear, syms y(x)
y=dsolve(diff(y)==-2*y+2*x^2+2*x, y(0)==1)
