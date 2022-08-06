clc, clear, prob1=optimproblem;  %最小值问题
x=optimvar('x','LowerBound',-3,'UpperBound',3);
y=optimvar('y','LowerBound',-4,'UpperBound',4);
prob1.Objective=x^3-y^3+3*x^2+3*y^2-9*x;
x0.x=1; x0.y=1;
[sol1,fval1,flag1,out1]=solve(prob1,x0)
prob2=optimproblem('ObjectiveSense','max')
prob2.Objective=x^3-y^3+3*x^2+3*y^2-9*x;
op=optimoptions(@fmincon,'Algorithm','active-set')
[sol2,fval2,flag2,out2]=solve(prob2,x0,'Options',op)