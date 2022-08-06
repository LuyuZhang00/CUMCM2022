clc, clear, fx=@(x)1/log(3)*log(4-x);
w=fx([1:3])  %计算权重向量
d1=load('anli14_1_1.txt'); d2=load('anli14_1_3.txt');
a=d1(:,[2,3]);  %志愿类别数据 
wij=zeros(16,7); %权重矩阵初始化
gx=@(x)(x==1)+[2,3]*(x==2)+[4,5]*(x==3)+[6,7]*(x==4);
for i=1:16
    wij(i,gx(a(i,1)))=1; wij(i,gx(a(i,2)))=w(2);
end
s=readmatrix('anli14_1_2.xlsx','Sheet',1,'Range','A6:G21');
tj=d2(:,[2:6])  %提出部门客观评分
for i=1:16
    for j=1:7
        tij=wij(i,j)*tj(j,:); t(i,j)=mean(tij);
    end
end
r=sqrt(s.*t)  %计算相互满意度
prob=optimproblem('ObjectiveSense','max');
x=optimvar('x',16,7,'Type','integer','LowerBound',0,'UpperBound',1);
prob.Objective=sum(sum(r.*x));
prob.Constraints.con1=sum(sum(x))==8;
prob.Constraints.con2=[sum(x,2)<=1; 1<=sum(x)'; sum(x)'<=2];
[sol,fval]=solve(prob), xx=sol.x
[i,j]=find(xx)  %找xx中非零元素的行标和列表
zf=[]; %提出综合满意度的初值
for k=1:length(i)
    zf=[zf,r(i(k),j(k))];
end
writematrix([j';i';zf],'anli14_1_2.xlsx','Sheet',1,'Range','A28') 
