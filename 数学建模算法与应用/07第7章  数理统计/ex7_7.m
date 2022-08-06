clc, clear, n=100;
bins=[0:7]'; mi=[36  40  19  2   0   2   1   0]'; 
pd = fitdist(bins,'Poisson','Frequency',mi)
expCounts = n * pdf(pd,bins)  %计算期望的频数
[h,p,st] = chi2gof(bins,'Ctrs',bins,'Frequency',mi, ...
                   'Expected',expCounts,'NParams',1)
k2 = chi2inv(0.95, st.df)  %求临界值,st.df为自由度


