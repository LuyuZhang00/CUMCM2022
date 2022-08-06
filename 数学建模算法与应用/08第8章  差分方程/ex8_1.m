clc, clear, format long g
Q = 300000; r = 0.051 /12; N = 360;
x = round((1+r)^N*Q*r/((1+r)^N-1), 2)
s = x*N  %总还款额
format   %恢复到短小数的显示格式
