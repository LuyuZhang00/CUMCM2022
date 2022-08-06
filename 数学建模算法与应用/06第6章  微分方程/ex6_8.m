clc,clear, syms f(x) g(x)  %定义符号函数
df=diff(f);  %定义f的一阶导数
[s1,s2]=dsolve(diff(f,2)+g-2==1, diff(g)+diff(f)==1,...
        df(1)==0, f(0)==0, g(0)==0)
