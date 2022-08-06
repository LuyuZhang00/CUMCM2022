clc, clear, a=load('data5_11.txt');
x0=a(1,:)'; d=a(2,:)'; C=[exp(x0),log(x0)]; 
A=[1 1]; b=1; %线性不等式的约束矩阵和常数项列
lb=zeros(2,1); %参数向量的下界
cs=lsqlin(C,d,A,b,[],[],lb) %拟合参数
