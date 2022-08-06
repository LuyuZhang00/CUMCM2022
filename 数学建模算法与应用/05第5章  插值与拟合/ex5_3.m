clc, clear, close all, global yx x
yx=@(x)1./(1+x.^2);
x=linspace(-5,5,100);
set(gca,'FontSize',15);
hold on, fun(6,1),fun(8,2),fun(10,3)
fplot(yx,[-5,5],'LineWidth',1.5)
legend({'$n=6$','$n=8$','$n=10$','$y=1/(1+x^2)$'},...
    'Interpreter','Latex','Location','north')
function fun(n,i)
global yx x
s = {'--*k', '-.k', '-pk'};
x0=linspace(-5,5,n+1);
y0=yx(x0); y=lagrange(x0,y0,x);
plot(x,y,s{i})
end
