clc, clear
L = [1,2,3,5,7;1,3,8,9,16; 1,4,8,11,14; 2,5,3,4,5
     3,4,2,4,6; 3,5,0,0,0; 4,6,8,16,18; 5,6,18,20,28
     5,7,18,25,32; 5,8,26,33,52; 6,7,0,0,0
     6,8,11,21,25; 7,8,12,15,18];
et=(L(:,3)+4*L(:,4)+L(:,5))/6;  %计算均值
dt=(L(:,5)-L(:,3)).^2/36;  %计算方差
prob = optimproblem('ObjectiveSense','max');
n = 8; N=size(L,1); obj=0; con=optimconstr(n);
x = optimvar('x',n,n,'Type','integer','LowerBound',0,'UpperBound',1);
for k=1:N
    obj=obj+x(L(k,1),L(k,2))*et(k);
end
ind1 = find(L(:,1)==1); con(1)=sum(x(1,L(ind1,2)))==1;
for i=2:n-1
    out=find(L(:,1)==i); in=find(L(:,2)==i);
    con(i)=sum(x(i,L(out,2)))==sum(x(L(in,1),i));
end
indn=find(L(:,2)==n); con(n)=sum(x(L(indn,1),n))==1;
prob.Constraints.con = con; prob.Objective=obj;
[sol, f] = solve(prob)
xx = sol.x, [i,j] = find(xx); ij = [i, j]
s2=0; %方差的初值
for k=1:size(ij,1)
    s2=s2+dt(find(ismember(L(:,[1,2]),ij(k,:),'rows')));
end
s=sqrt(s2), p=normcdf(52,f,s)  %计算标准差和概率
n = norminv(0.95)*s+f
