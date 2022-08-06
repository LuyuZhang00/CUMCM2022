clc, clear, prob=optimproblem;
x = optimvar('x', 2, 'LowerBound',0)
h=[-1,-0.15;-0.15,-2]; 
f=[98;277]; a=[1,1;1,-2]; b=[100;0];
prob.Objective = x'*h*x+f'*x;
prob.Constraints = a*x <= b; 
[sol,fval,exitflag,output] = solve(prob), sol.x
%下面使用fmincon求解，效果较好
fx = @(x)x'*h*x+f'*x;  %目标函数的匿名函数，x为列向量
[x,y]=fmincon(fx,rand(2,1),a,b,[],[],zeros(2,1))

