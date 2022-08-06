clc, clear, close all
a = readmatrix('data7_23.txt');
x = a(1,:)'; y = a(2,:)'; 
subplot(121), plot(x, y, 'ko')
md = fitlm(x,y);  %拟合线性回归模型
[yh, yhint] = predict(md, x)  %求预测值及置信区间
subplot(122), plotResiduals(md, 'caseorder')  %画残差图
r = y - yh; ind = find(abs(r)>=1.5)  %求残差及野值编号
md2 = fitlm(x,y,'Exclude',ind)  %剔除野值重新建模
