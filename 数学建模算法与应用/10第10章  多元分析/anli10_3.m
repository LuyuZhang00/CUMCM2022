clc,clear
a = readmatrix('anli10_3.txt'); n=size(a,1);
x=a(:,[1:4]); y=a(:,5); %分别提出自变量x1...x4和因变量y的值
x=zscore(x); %数据标准化
r=corrcoef(x)  %求相关系数矩阵
[vec1,val,con1]=pcacov(r)  %进行主成分分析的相关计算
f1=repmat(sign(sum(vec1)),size(vec1,1),1);
vec2=vec1.*f1;     %特征向量正负号转换
f2=repmat(sqrt(val)',size(vec2,1),1); 
a=vec2.*f2   %求初等载荷矩阵
num=input('请选择主因子的个数：');  %交互式选择主因子的个数
am=a(:,[1:num]);  %提出num个主因子的载荷矩阵
[bm,t]=rotatefactors(am,'method', 'varimax') %am旋转变换,bm为旋转后的载荷阵
bt=[bm,a(:,[num+1:end])];  %旋转后的载荷阵,前两个旋转，后面不旋转
con2=sum(bt.^2)       %计算因子贡献
check=[con1,con2'/sum(con2)*100] %未旋转和旋转后的贡献率对照
rate=con2(1:num)/sum(con2) %计算因子贡献率
coef=inv(r)*bm          %计算得分函数的系数
score=x*coef           %计算各个因子的得分
weight=rate/sum(rate)  %计算得分的权重
Tscore=score*weight'   %对各因子的得分进行加权求和，即求各企业综合得分
[STscore,ind]=sort(Tscore,'descend')      %对企业进行排序
display=[score(ind,:)';STscore';ind'] %显示排序结果
[ccoef,p]=corrcoef([Tscore,y])    %计算F与资产负债的相关系数
[d,dt,e,et,stats]=regress(Tscore,[ones(n,1),y]);%计算F与资产负债的方程
d,stats  %显示回归系数，和相关统计量的值
