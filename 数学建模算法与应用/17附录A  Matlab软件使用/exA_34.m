clc, clear, f=fopen('dataA_34_1.txt'); i=1;
while (~feof(f))
    d=fgetl(f); a=sum(d==97); c=sum(d==99);
    g=sum(d==103); t=sum(d==116);
    n=sum(d>=97&d<=122); %检验26个小写字符的个数
    s(i,:)=[a, c, g, t, n, a+c+g+t];
    i=i+1;
end
s, he=sum(s)
writematrix(s,'dataA_34_2.txt')
