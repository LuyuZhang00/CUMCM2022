clc, clear, a=readmatrix('data6_18.txt');
x=a([2:2:6],:)'; x=x(~isnan(x));
fn=@(r,xm,t)xm./(1+(xm/3.9-1)*exp(-r*(t-1790))); %定义匿名函数
ft=fittype(fn,'independent','t');  t=[1800:10:2000]'; 
[f, st]=fit(t,x(2:end), ft, 'StartPoint',rand(1,2),...
    'Lower',[0,280],'Upper',[0.1,1000])  %由先验知识主观确定参数界限
xs=coeffvalues(f)  %显示拟合的参数值
xh=f(2010)  %求2010年的预测值

a=[ones(21,1), -x(1:end-1)];  %向前差分
b=diff(x)./x(1:end-1)/10;
cs=a\b; r=cs(1), xm=r/cs(2)
xh=fn(r,xm,2010)  %求2010年的预测值

a=[ones(21,1), -x(2:end)];  %向后差分
b=diff(x)./x(2:end)/10;
cs=a\b; r=cs(1), xm=r/cs(2)
xh=fn(r,xm,2010)  %求2010年的预测值
