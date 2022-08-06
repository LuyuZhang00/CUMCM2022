clc, clear, close all
z0=load('data5_7.txt'); z0=z0([end:-1:1],:);
x0=0:100:1400; y0=0:100:1200;
x=0:10:1400; y=[0:10:1200]; 
[X0,Y0]=ndgrid(x0,y0); [X,Y]=ndgrid(x,y);
f=griddedInterpolant(X0,Y0,z0','spline')
z=f(X,Y); z=z';
subplot(121),h=contour(x,y,z); clabel(h)
subplot(122), surf(x,y,z)
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
