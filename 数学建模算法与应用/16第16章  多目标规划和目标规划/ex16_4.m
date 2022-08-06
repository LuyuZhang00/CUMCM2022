clc, clear
x=optimvar('x',2,'LowerBound',0);
dp=optimvar('dp',4,'LowerBound',0);
dm=optimvar('dm',4,'LowerBound',0);
p=optimproblem('ObjectiveSense','min');
p.Constraints.con1 = 2*sum(x)<=12;
con2=[200*x(1)+300*x(2)+dm(1)-dp(1)==1500
      2*x(1)-x(2)+dm(2)-dp(2)==0
      4*x(1)+dm(3)-dp(3)==16
      5*x(2)+dm(4)-dp(4)==15];
p.Constraints.con2=con2;
goal=100000*ones(3,1);
mobj=[dm(1); dp(2)+dm(2); 3*dp(3)+3*dm(3)+dp(4)];
for i=1:3
    p.Constraints.cons3=[mobj<=goal];
    p.Objective=mobj(i);
    [sx,fval]=solve(p);
    fprintf('第%d级目标计算结果如下：\n',i)
    fval, xx=sx.x, sdm=sx.dm, sdp=sx.dp
    goal(i)=fval;
end
