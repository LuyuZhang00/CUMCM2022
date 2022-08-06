clc, clear
L = [1,2,5,5,0;1,3,10,8,700; 1,4,11,8,400; 2,5,4,3,450
     3,4,4,4,0; 3,5,0,0,0; 4,6,15,15,0; 5,6,21,16,600
     5,7,25,22,300; 5,8,35,30,500; 6,7,0,0,0
     6,8,20,16,500; 7,8,15,12,400];
N=size(L,1); n = 8; 
x = optimvar('x',n,'Type','integer','LowerBound',0);
y = optimvar('y', n, n, 'Type','integer','LowerBound',0);
prob = optimproblem; obj=sum(x); %目标函数初始化
con = optimconstr(2*N+1); con(1)=x(n)-x(1)<=49;
for k=1:N
    obj=obj+L(k,5)*y(L(k,1),L(k,2));
    con(2*k)=L(k,3)<=x(L(k,2))-x(L(k,1))+y(L(k,1),L(k,2));
    con(2*k+1)=y(L(k,1),L(k,2))<=L(k,3)-L(k,4);
end
prob.Objective=obj;
prob.Constraints.con = con; 
[sol, fval, flag, out] = solve(prob)
xx = sol.x, yy = sol.y
[i,j] = find(yy); ij = [i'; j']
z(8) = xx(end);
for k = 7:-1:1
    ind = find(L(:,1)==k);
    z(k)=min(z(L(ind,2))-L(ind,3)'+yy(k,L(ind,2)));
end
els = []; 
for i = 1:length(L)
    els = [els; [L(i,1),L(i,2),xx(L(i,1)),...
           z(L(i,2))-L(i,3)+yy(L(i,1),L(i,2))]];
end
els  %显示最早和最迟开工时间
