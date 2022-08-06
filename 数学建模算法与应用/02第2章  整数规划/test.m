clc, clear, a1 = readmatrix('data2_10.xlsx',head=None); 
a1(isnan(a1))=0;
a2= xlsread('data2_10.xlsx'); 
a2(isnan(a2))=0;
check=a1-a2