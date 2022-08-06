clc, clear
aw=load('data14_8_1.txt');
w=aw(end,:); %提取权重向量
a=aw([1:end-1],:); %提取指标数据
a(:,[2,6])=-a(:,[2,6]); %把成本型指标转换成效益型指标
ra=tiedrank(a) %对每个指标值分别编秩，即对a的每一列分别编秩
[n,m]=size(ra); %计算矩阵sa的维数
RSR=mean(ra,2)/n  %计算秩和比
W=repmat(w,[n,1]);
WRSR=sum(ra.*W,2)/n  %计算加权秩和比
[sWRSR,ind]=sort(WRSR,'descend')  %对加权秩和比排序 
writematrix([ra,WRSR], 'data14_8_2.xlsx')  
