clc,clear
x0=[150 85 150 145 130 0];
y0=[140 85 155 50 150 0];
q=[243 236 220.5 159 230 52];
xy0=[x0; y0];
d0=dist(xy0);   %求矩阵各个列向量之间的距离
d0(find(d0==0))=inf;
a0=asind(8./d0);  %以度为单位的反函数
xy1=x0+i*y0; xy2=exp(i*q*pi/180);
for m=1:6
     for n=1:6
         if n~=m
         b0(m,n)=angle((xy2(n)-xy2(m))/(xy1(m)-xy1(n))); 
         end
     end
end
b0=b0*180/pi; writematrix(a0, 'data3_10.xlsx')
writematrix(b0, 'data3_10.xlsx', 'Sheet', 2)
prob = optimproblem;
x = optimvar('x', 6, 'LowerBound', -30,'UpperBound',30)
ob = @(x) sum(abs(x))
prob.Objective = fcn2optimexpr(ob,x);
con = optimconstr(15); k=0;
for i = 1:5
    for j = i+1:6
        k=k+1;
        con(k) = (b0(i,j)+(x(i)+x(j))/2)^2>=a0(i,j)^2;
    end
end
prob.Constraints.con = con; X0.x=zeros(1,6);
[sol, fval, flag, out] = solve(prob,X0)
xx=sol.x  %显示最优解
