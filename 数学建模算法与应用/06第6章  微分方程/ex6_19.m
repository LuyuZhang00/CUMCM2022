clc, clear
t0=[0	1	2	3	4	5	6	8	10	12	14	16	18]';
x0=[60	63	64	63	61	58	53	44	39	38	41	46	53]';
y0=[30	34	38	44	50	55	58	56	47	38	30	27	26]';
dt=diff(t0); dx=diff(x0); dy=diff(y0);
temp=x0(1:end-1).*y0(1:end-1);
mat=[x0(1:end-1), -temp,zeros(12,2)
    zeros(12,2), -y0(1:end-1), temp]; %构造线性方程组的系数矩阵
const=[dx./dt; dy./dt];  %构造线性方程组的常数项列
abcd=mat\const  %拟合参数a,b,c,d
