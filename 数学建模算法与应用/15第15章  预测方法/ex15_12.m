clc, clear, format long g
a=load('data15_12.txt');  %把表中的全部数据保存到文本文件中
t=a([1,3],:)'; t=t(:); %提取时间t数据，并变成列向量
n=a([2,4],:)'; n=n(:); %提取计算器读数n的数据
xishu=[n.^2,n]; %构造系数阵
ab=xishu\t, n0=4450
T=ab(1)*n0^2+ab(2)*n0, format  %计算对应时间，并恢复短小数显示格式