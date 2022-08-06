clc, clear
fx1=@(c)[(1+c(1)*(1-c(2))^(-2))^(-1)-0.01
         (1+c(1)*(4-c(2))^(-2))^(-1)-0.8];
cs1=fsolve(fx1,rand(1,2))  %待定参数alpha，beta
fx2=@(c)[c(1)*log(4)+c(2)-0.8; c(1)*log(7)+c(2)-1];
cs2=fsolve(fx2,rand(1,2))  %待定参数a,b
fx=@(x)(1+cs1(1)*(x-cs1(2)).^(-2)).^(-1).*(x>=1 & x<=4)+...
    (cs2(1)*log(x)+cs2(2)).*(x>4 & x<=7);
f2356=fx([2,3,5,6]), f1_7=fx([1:7])
d1=load('anli14_1_1.txt'); d2=load('anli14_1_3.txt');
a=d1(:,[4:7]); b=d2(:,[7:10]);
gx=@(x)4*(x==0)+5*(x==-1)+6*(x==-2)+7*(x<=-3)+...
    3*(x==1)+2*(x==2)+ (x>=3);
for i=1:size(a,1)
    for j=1:size(b,1)
        t1=gx(b(j,:)-a(i,:)); t2=fx(t1);
        s(i,j)=mean(t2);  %计算用人部门对应聘者的评分
    end
end
writematrix(s,'anli14_1_2.xlsx','Sheet',1,'Range','A6')
d=readmatrix('anli14_1_2.xlsx','Sheet',1,'Range','A3:P3');
dd=repmat(d',1,7);
prob=optimproblem('ObjectiveSense','max');
x=optimvar('x',16,7,'Type','integer','LowerBound',0,'UpperBound',1);
prob.Objective=sum(sum(dd.*x+s.*x));
prob.Constraints.con1=sum(sum(x))==8;
prob.Constraints.con2=[sum(x,2)<=1; 1<=sum(x)'; sum(x)'<=2];
[sol,fval]=solve(prob), xx=sol.x
[i,j]=find(xx)  %找xx中非零元素的行标和列表
pf=[]; %提出部门评分的初值
for k=1:length(i)
    pf=[pf,s(i(k),j(k))];
end
writematrix([j';i';d(i);pf],'anli14_1_2.xlsx','Sheet',1,'Range','A23')
