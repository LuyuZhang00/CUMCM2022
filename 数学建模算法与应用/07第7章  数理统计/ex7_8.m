clc, clear
edges=[0:100:300 inf]; bins=[50 150 250 350]; %定义原始数据区域的边界和中心
mi=[121 78 43 58]; %已知观测频数
pd=makedist('exp',200)  %定义指数分布
expect=sum(mi)*diff(cdf(pd, edges))  %计算期望频数
[h,p,st]=chi2gof(bins,'Edges',edges,'cdf',pd,'Frequency',mi) 
k2=chi2inv(0.95,st.df)  %求临界值，st.df为自由度

