clc,clear
syms m V rho g k s(t) v(t) %定义符号常数和符号变量
ds=diff(s); %定义s的一阶导数，为了初值条件赋值
s1=dsolve(m*diff(s,2)-m*g+rho*g*V+k*diff(s),s(0)==0,ds(0)==0);
s1=subs(s1,{m,V,rho,g,k},{239.46,0.2058,1035.71,9.8,0.6});  %常数赋值
ss1=vpa(s1,7)  %显示小数形式的位移函数
v1=dsolve(m*diff(v)-m*g+rho*g*V+k*v,v(0)==0);
v1=subs(v1,{m,V,rho,g,k},{239.46,0.2058,1035.71,9.8,0.6});
vv1=vpa(v1,7)  %显示小数形式的速度函数
t1=solve(s1-90); t1=double(t1)   %求到达海底90米处的时间
vvv1=subs(v1,t,t1); vvv1=double(vvv1)  %求到底海底90米处的速度

v2=dsolve(m*diff(v)-m*g+rho*g*V+k*v^2,v(0)==0);
v2=subs(v2,{m,V,rho,g,k},{239.46,0.2058,1035.71,9.8,0.6});
v2=simplify(v2); vv2=vpa(v2,6)  %显示小数形式的速度函数
t2=solve(v2-12.2); t2=double(t2)  %求时间的临界值
s2=int(v2,0,t2); s2=double(s2)  %求位移的临界值
