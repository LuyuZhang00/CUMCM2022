clc, clear
v = 1; u = 5 * v; h = 0.00005
x = 0; y = 0; t = 0; %设置导弹初始位置和时间
plot(x, y, '.'), hold on
while x <= 0.99999
    pq = [1-x, v*t-y];
    x = x + u * pq(1)/norm(pq) * h;
    y = y + u * pq(2)/norm(pq) * h;
    t = t + h; plot(x, y, '.')
end
x, y  %显示击中时的导弹位置
xlabel('$x$', 'Interpreter', 'latex')
ylabel('$y$', 'Interpreter', 'latex', 'Rotation', 0)