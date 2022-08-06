clc, clear
rng('shuffle')  %根据当前时间为随机数生成器提供种子
a=randn(6,1); %生成服从标准正态分布的伪随机数
b=[today:today+5]'  %从今天到后面5天
c=datetime(b,'ConvertFrom','datenum')
T=array2timetable(a,'RowTimes',c)  %生成时间序列数据
T.a(3)=NaN;  %将第3个数据变为缺失值NaN
newT=fillmissing(T,'linear') %用线性插值填补时间序列中的缺失数据
data=table2array(newT) %时间序列数据转成普通数据
