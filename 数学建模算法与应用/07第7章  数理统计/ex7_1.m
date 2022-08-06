clc, clear
x0=[506  508  499  503  504  510  497  512
514  505  493  496  506  502  509  496]; x0=x0(:);
pd = fitdist(x0,'Normal')  %对数据进行正态分布拟合
ci = paramci(pd,'Alpha',0.05)  %ci的第一列是均值的置信区间
[mu,s,muci,sci] = normfit(x0,0.05) %另一种方法求置信区间
