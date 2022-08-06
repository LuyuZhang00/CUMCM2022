dxy=@(t,x)[-0.0544*x(2)+54000*(t>=0 & t<1)+...
    6000*(t>=2 & t<3)+13000*(t>=5 & t<6)
    -0.0106*x(1)];  %定义微分方程组右端项
[t,xy]=ode45(dxy,[0:36],[0,21500])
subplot(211), plot(t,xy(:,1),'r*',t,xy(:,2),'gD')
xlabel('时间t'),  ylabel('人数'), legend('美军','日军')
subplot(212),  plot(xy(:,1),xy(:,2))  %画微分方程组的轨线
xlabel('美军人数x'),  ylabel('日军人数y')  
