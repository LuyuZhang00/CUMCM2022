clc, clear, d=cell(1,5); %初始化
for k=1:5
    fileName=sprintf('A_38_%02d.xlsx',k);
    d{k}=readmatrix(fileName,'Sheet',2,'Range','A1:C3');
end
celldisp(d) %显示细胞数组的数据
