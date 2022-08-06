n = 1:10;
a = [8 -2 -1];
b = [1 1];
yi = [1 0];
xi = 1;
zi = filtic(b,a,yi,xi)
y = filter(b,a,2.^n,zi)