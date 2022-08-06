clc, clear
a=readmatrix('data14_9_1.txt');
[n,m]=size(a);
for j=1:m
    p(:,j)=a(:,j)/sum(a(:,j));
    e(j)=-sum(p(:,j).*log(p(:,j)))/log(n);
end

g=1-e; w=g/sum(g) %计算权重
s=w*p' %计算各个评价对象的综合评价值
[ss,ind1]=sort(s,'descend') %对评价值从大到小排序
ind2(ind1)=1:n  %学生编号对应的排序位置
writematrix(w,'data14_9_2.xlsx')  %把数据写到Excel文件的表单1
writematrix([1:n;s;ind2],'data14_9_2.xlsx','Sheet',2) %把数据写到表单2

