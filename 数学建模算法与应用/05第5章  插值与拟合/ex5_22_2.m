clc, clear, format long g, close all
a=load('data5_22.txt');  %把水流量和含沙量数据保存在纯文本文件
liu=a([1,3],:); liu=liu'; liu=liu(:);  %提出水流量并按照顺序变成列向量
sha=a([2,4],:); sha=sha'; sha=sha(:); %提出含沙量并按照顺序变成列向量
y=sha.*liu; 
subplot(1,2,1), plot(liu(1:11),y(1:11),'*')
subplot(1,2,2), plot(liu(12:24),y(12:24),'*')
for j=1:2  %第一阶段的拟合
    [ft1,st1]=fit(liu(1:11),y(1:11),['poly',int2str(j)])
    xs=coeffvalues(ft1)  %显示拟合的系数
end
for j=1:2  %第二阶段的拟合
    [ft2,st2]=fit(liu(12:24),y(12:24),['poly',int2str(j)])
    xs=coeffvalues(ft2)  %显示拟合的系数
end
format  %恢复短小数的显示格式

