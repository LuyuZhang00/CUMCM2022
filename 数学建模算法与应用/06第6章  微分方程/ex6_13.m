clc, clear, close all
df=@(x,f)[f(2); 2*f(2)-f(1)+exp(x)]; hold on
s1=ode45(df,[0,1],[1;-1]); %求[0,1]区间上的数值解
s2=ode45(df,[0,-1],[1;-1]); %求[-1,0]区间上的数值解
fplot(@(x)deval(s1,x,1),[0,1],'-ok') %画第一个分量y在[0,1]区间上的数值解
fplot(@(x)deval(s2,x,1),[-1,0],'-*k') %画第一个分量y在[-1,0]区间上的数值解
xlabel('$x$', 'Interpreter', 'latex')
ylabel('$y$', 'Interpreter', 'latex', 'Rotation', 0)
