clc, clear, a=readmatrix('data5_18.txt');
y0=a(:,[2,7]); y0=y0(~isnan(y0));
x0=[a(:,[3:5]); a([1:end-1],[8:10])];
y=@(c,x)exp(-c(1)*x(:,1)).*sin(c(2)*x(:,2))+x(:,3).^2;
lb=zeros(1,2); ub=2*ones(1,2); %主观赋值参数下界和上界
c = lsqcurvefit(y,rand(1,2),x0,y0,lb,ub)