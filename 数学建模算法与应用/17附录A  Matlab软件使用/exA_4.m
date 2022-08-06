t=0:pi/50:10*pi;
subplot(121), plot3(sin(t),cos(t),t)
subplot(122), fplot3(@(t)sin(t),@(t)cos(t),@(t)t,[0,10*pi])

