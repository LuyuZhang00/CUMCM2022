clc, clear
x=optimvar('x',3,'LowerBound',0);
dp=optimvar('dp',8,'LowerBound',0);
dm=optimvar('dm',8,'LowerBound',0);
p=optimproblem('ObjectiveSense','min');
b=[50,50,80,100,120,100]';
con1=[5*x(1)+8*x(2)+12*x(3)+dm(1)-dp(1)==1700
      x(1:3)+dm(2:4)-dp(2:4)==b(1:3)
      x(1:3)+dm(5:7)-dp(5:7)==b(4:6)
      5*x(1)+8*x(2)+12*x(3)+dm(8)-dp(8)==1900];
p.Constraints.con1=con1;
goal=100000*ones(5,1);
mobj=[dm(1); 20*dm(2)+18*dm(3)+21*dm(4); dp(8)
      20*dm(5)+18*dm(6)+21*dm(7); dp(1)];
for i=1:5
    p.Constraints.cons2=[mobj<=goal];
    p.Objective=mobj(i);
    [sx,fval]=solve(p);
    fprintf('第%d级目标计算结果如下：\n',i)
    fval, xx=sx.x, sdm=sx.dm, sdp=sx.dp
    goal(i)=fval;
end
c = [1000,1440,2520]*xx  %计算总利润
