clc, clear, a=readmatrix('data4_21.xlsx');
a(isnan(a))=0  %对角线元素替换为0
L=size(a,1); c=[5 1:4 6 5]; %选取初始圈
[circle,long]=modifycircle(a,L,c)  %调用下面修改圈的子函数

function [circle,long]=modifycircle(a,L,c)
for k=1:L
    flag=0;   %退出标志
    for i=1:L-2
        for j=i+2:L
            if a(c(i),c(j))+a(c(i+1),c(j+1))<...
                    a(c(i),c(i+1))+a(c(j),c(j+1))
                c(i+1:j)=c(j:-1:i+1); 
                flag=flag+1; %修改一次，标志加1
            end
        end
    end
    if flag==0   %一条边也没有修改,就返回
        long=0;   %圈长的初始值
        for i=1:L
            long=long+a(c(i),c(i+1)); %求改良圈的长度
        end
        circle=c;   %返回修改圈
        return
    end
end
end

