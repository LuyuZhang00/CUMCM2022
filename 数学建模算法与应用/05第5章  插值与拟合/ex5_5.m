clc, clear, format long g
t0=0.15:0.01:0.18; v0=[3.5	1.5	2.5	2.8];
pp=csape(t0,v0)   %默认的边界条件，Lagrange边界条件
xishu=pp.coefs   %显示每个区间上三次多项式的系数
s1=integral(@(t)fnval(pp,t),0.15,0.18)  %求积分
vt=griddedInterpolant(t0,v0,'spline')  %求三次插值样条
s2=integral(@(t)vt(t),0.15,0.18)  %求积分
format  %恢复短小数的显示格式

