clc, clear, alpha=0.1;
edges=[20:10:100]; x=[25:10:95]; %原始数据区间的边界和中心 
mi=[5 15 30 51 60 23 10 6];
pd=makedist('Normal','mu',60,'sigma',15)  %定义正态分布
[h,p,st]=chi2gof(x,'cdf',pd,'Edges',edges,'Frequency',mi)
k2=chi2inv(1-alpha,st.df) %求临界值
