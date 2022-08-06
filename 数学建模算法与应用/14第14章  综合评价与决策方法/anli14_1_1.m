clc, clear, close all
fx1=@(c)[(1+c(1)*(1-c(2))^(-2))^(-1)-0.01
         (1+c(1)*(3-c(2))^(-2))^(-1)-0.8];
cs1=fsolve(fx1,rand(1,2))  %待定参数alpha，beta
fx2=@(c)[c(1)*log(3)+c(2)-0.8; c(1)*log(5)+c(2)-1];
cs2=fsolve(fx2,rand(1,2))  %待定参数a,b
fx=@(x)(1+cs1(1)*(x-cs1(2)).^(-2)).^(-1).*(x>=1 & x<=3)+...
    (cs2(1)*log(x)+cs2(2)).*(x>3 & x<=5);
fplot(fx,[1,5]), f2=fx(2), f4=fx(4)
d0=load('anli14_1_1.txt'); d1=d0(:,[4:7]);
c=fx(d1); b=mean(c,2)  %计算复试分数
writematrix(b','anli14_1_2.xlsx')
ma1=max(d0(:,1)), ma2=min(d0(:,1))
az=(d0(:,1)-ma2)/(ma1-ma2)  %初试分标准化
mb1=max(b), mb2=min(b)
bz=(b-mb2)/(mb1-mb2)  %复试分标准化
d=0.5*(az+bz)  %计算综合得分
[sd, ind1]=sort(d, 'descend')  %按照从大到小排序
ind2(ind1)=1:16
writematrix([d';ind2], 'anli14_1_2.xlsx', 'Sheet',1, 'Range', 'A3')
         