#程序文件ex12_3.py
import numpy as np
import pandas as pd
from sklearn.decomposition import PCA
from scipy.stats import zscore

a=pd.read_excel('data12_3.xlsx',header=None)
b=a.values; c=zscore(b,ddof=1)  #数据标准化
md1=PCA().fit(c)  #构造并拟合模型
print('特征值为：', md1.explained_variance_)
r1=md1.explained_variance_ratio_  #提取各主成分的贡献率
print('各主成分贡献率：', r1)
xs1=md1.components_  #提出各主成分系数，每行是一个主成分
print('主成分系数：\n', np.round(xs1,4))
print('累积贡献率：', np.cumsum(r1))
n1=4  #选取主成分的个数
df1=c@(xs1[:n1,:].T)  #计算主成分得分
g1=df1@r1[:n1]  #计算综合评价得分
print('主成分评价得分',np.round(g1,4))
ind1=np.argsort(-g1)  #计算从大到小的地址
ind11=np.zeros(15); ind11[ind1]=np.arange(1,16)
print('排序结果：',ind11); print('---------------')

n=b.shape[0]; K=np.zeros((n,n))  #初始化
for i in range(n):
    for j in range(n):
        K[i,j]=(1+c[i]@c[j])**3
In=np.ones((n,n))/n; Kw=K-K@In-In@K+In@K@In
md2=PCA().fit(Kw)  #构造并拟合模型
print('特征值为：', md2.explained_variance_)
r2=md2.explained_variance_ratio_  #提取各主成分的贡献率
print('各主成分贡献率：', r2)
xs2=md2.components_  #提出各主成分系数，每行是一个主成分
print('主成分系数：\n', np.round(xs2,4))
print('累积贡献率：', np.cumsum(r2))
n2=2  #选取主成分的个数
df2=Kw@(xs2[:n2,:].T)  #计算主成分得分
g2=df2@r2[:n2]  #计算综合评价得分
print('核主成分评价得分：',np.round(g2))
ind2=np.argsort(-g2)  #计算从大到小的地址
ind22=np.zeros(15); ind22[ind2]=np.arange(1,16)
print('排序结果：',ind22)

      

   
    
