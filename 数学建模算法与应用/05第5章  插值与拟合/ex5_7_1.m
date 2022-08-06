clc, clear, close all, z0=load('data5_7.txt');
x0=0:100:1400; y0=1200:-100:0;
x=0:10:1400; y=[1200:-10:0]'; 
pp=csape({x0,y0},z0'); %双三次样条插值,注意这里z0要转置
z=fnval(pp,{x,y}); z=z'; %为了和z0的矩阵维数一致
max_z=max(max(z)), min_z=min(min(z))
subplot(121),h=contour(x,y,z); clabel(h)  %画等高线
subplot(122), surf(x,y,z)             %画三维表面图
m=length(x); n=length(y); s=0; 
for i=1:m-1
    for j=1:n-1
        p1=[x(i),y(j),z(j,i)];
        p2=[x(i+1),y(j),z(j,i+1)];
        p3=[x(i+1),y(j+1),z(j+1,i+1)];
        p4=[x(i),y(j+1),z(j+1,i)];
        p12=norm(p1-p2); p23=norm(p3-p2); p13=norm(p3-p1);
        p14=norm(p4-p1); p34=norm(p4-p3);
        z1=(p12+p23+p13)/2;s1=sqrt(z1*(z1-p12)*(z1-p23)*(z1-p13));
        z2=(p13+p14+p34)/2; s2=sqrt(z2*(z2-p13)*(z2-p14)*(z2-p34));
        s=s+s1+s2;
    end
end
s %显示面积的计算值
