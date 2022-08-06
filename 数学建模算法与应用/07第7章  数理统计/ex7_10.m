clc, clear, alpha=0.1;
a=readmatrix('data7_5_1.txt'); a=a(~isnan(a)); %去掉NaN值
pd=fitdist(a, 'Normal')
[h,p,st]=chi2gof(a,'cdf',pd,'NParams',2)
k2=chi2inv(1-alpha,st.df) %求临界值
