#程序文件ex10_6.py
import numpy as np
import statsmodels.api as sm

a = np.loadtxt('data10_6.txt')
d = {'x1':a[:,0], 'x2':a[:,1], 'x3':a[:,2],
     'x4':a[:,3], 'y':a[:,4]}
md1 = sm.formula.ols('y~x1+x2+x3+x4',d).fit()
print(md1.tvalues)  #下面删除变量的t值绝对值最小的
md2 = sm.formula.ols('y~x1+x2+x4',d).fit()
print(md2.tvalues)  #下面删除变量的t值绝对值最小的
md3 = sm.formula.ols('y~x1+x2', d).fit()
print(md3.summary())
print('残差方差：', md3.mse_resid)


