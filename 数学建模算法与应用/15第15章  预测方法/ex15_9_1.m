p=[0.8 0.1 0.1;0.5 0.1 0.4;0.5 0.3 0.2]; p=sym(p);
a=[p'-eye(3);ones(1,3)];  %构造方程组ax=b的系数矩阵 
b=[zeros(3,1);1];  %构造方程组ax=b的常数项列
p_limit=a\b  %求方程组的解
