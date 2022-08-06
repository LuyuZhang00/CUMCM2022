clc, clear
fun1 = @(x) sum(x.^2)+8;
[x,y]=fmincon(fun1,rand(3,1),[],[],[],[],zeros(3,1),[],@fun2)

function [c,ceq]=fun2(x)
c=[-x(1)^2+x(2)-x(3)^2
x(1)+x(2)^2+x(3)^3-20];  %非线性不等式约束
ceq=[-x(1)-x(2)^2+2
x(2)+2*x(3)^2-3]; %非线性等式约束
end
