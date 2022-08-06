clc, clear, a = importdata('data2_10.xlsx'); 
a(isnan(a))=0; %把不确定值NaN替换为0
M=10^7; w=ones(14)*M;
for i=1:14
    for j=1:14
        if i~=j, w(i,j)=sum(a(:,i).*a(:,j)); end
    end
end
n=15; w(n,n)=M; prob=optimproblem; 
x=optimvar('x',n,n,'Type','integer','LowerBound',0,'UpperBound',1);
u=optimvar('u',n,'LowerBound',0)  %序号变量
prob.Objective=sum(sum(w.*x));
prob.Constraints.con1=[sum(x,2)==1; sum(x,1)'==1; u(1)==0];
con2 = optimconstr(n*(n-1)); k=0;
for i=1:n
    for j=2:n
        k=k+1; con2(k)=u(i)-u(j)+n*x(i,j)<=n-1;
    end
end
prob.Constraints.con2 = con2;
prob.Constraints.con3 = [1<=u(2:end)'; u(2:end)'<=14];
[sol, fval, flag]=solve(prob)
xx=sol.x; [i,j]=find(xx); 
fprintf('xij=1对应的行列位置如下：\n')
ij=[i'; j']
