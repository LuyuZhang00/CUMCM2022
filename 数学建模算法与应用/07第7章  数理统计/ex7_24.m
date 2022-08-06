clc, clear
a = readmatrix('data7_24.txt')
Y = [a(:,2); a([1:end-1],7)]; %提取y的数据
X = [a(:,[3:5]); a([1:end-1],[8:10])];
fun=@(beta,x) (beta(4)*x(:,2)-x(:,3)/beta(5))./(1+beta(1)*x(:,1)+...
beta(2)*x(:,2)+beta(3)*x(:,3)); %用匿名函数定义要拟合的函数
beta0=[0.1,0.05,0.02,1,2]';  %回归系数的初值
md=fitnlm(X,Y,fun,beta0)  %拟合非线性回归模型
betaci=coefCI(md)  %求拟合参数的置信区间
[ypred,yci]=predict(md,X)  %计算y的预测值及置信区间


