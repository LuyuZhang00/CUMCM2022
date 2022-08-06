clc, clear, close all
fplot(@Afun1,[-3,3])
function y=Afun1(x);
y=(x+1).*(x<1)+(1+1./x).*(x>=1);
end

