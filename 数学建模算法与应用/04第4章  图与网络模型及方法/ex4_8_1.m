clc, clear, a = zeros(4);
a(1,[3,4])=[10,60];  %输入邻接矩阵的上三角元素
a(2,[3,4])=[5,20]; a(3,4)=1;
n=length(a); b=a+a';  %构造完整的邻接矩阵
b(b==0)=inf; %把零元素换成inf
b(1:n+1:end)=0; %把对角线元素换成0
for k=1:n
    for i=1:n
        for j=1:n
            if b(i,k)+b(k,j)<b(i,j)
                b(i,j)=b(i,k)+b(k,j);
            end
        end
    end
end
b  %显示两两顶点之间的最短距离

