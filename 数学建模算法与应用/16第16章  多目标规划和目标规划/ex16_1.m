clc, clear, prob=optimproblem;
x=optimvar('x',2,'LowerBound',0);
c1=[-2, -3]; c2=[1, 2];
a=[0.5, 0.25; 0.2, 0.2; 1, 5; -1, -1];
b=[8; 4; 72; -10];
prob.Constraints.con1 = a*x<=b
obj1=0.5*c1*x+0.5*c2*x
prob1 = prob; prob1.Objective=obj1;
[sol1, fval1]=solve(prob1), sx=sol1.x
f1=-c1*sx, f2=c2*sx

prob21=prob; prob21.Objective=c1*x;
[sol21,fval21]=solve(prob21), sx21=sol21.x
prob22=prob; prob22.Objective=c2*x;
[sol22,fval22]=solve(prob22), sx22=sol22.x
prob23=prob; 
prob23.Objective=(c1*x-fval21)^2+(c2*x-fval22)^2;
[sol23,fval23]=solve(prob23), sx23=sol23.x

prob3=prob; prob3.Objective=c2*x;
prob3.Constraints.con2=c1*x==fval21;
[sol3,fval3]=solve(prob3), sx3=sol3.x


