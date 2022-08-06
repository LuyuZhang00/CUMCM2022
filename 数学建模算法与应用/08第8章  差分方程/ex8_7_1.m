clc, clear, close all, format long g
a = 1 - 0.2^(1/12); m = 1.109 * 10 ^ 5
w3 = 17.86; w4 = 22.99
X=[]; Z=[]; N=[]; K = 0:0.001:0.874;
for k = K
    x1 = 1.22*10^11*(1-1/(m*(1-a-0.42*k)^8*(1-a)^24* ...
        (1/2+(1-a-k)^8*(1-a)^4)));
    x2 = (1-a)^12*x1; x3 = (1-a)^12*x2;
    x4 = (1-a-0.42*k)^8*(1-a)^4*x3;
    X = [X, [x1;x2;x3;x4]];
    n = m*(1-a-0.42*k)^8*(1-a)^24*(1/2+(1-a-k)^8*(1-a)^4)*x1;
    N = [N, n];
    z = 0.42*k*w3*(1-(1-a-0.42*k)^8)/(a+0.42*k)*x3+ ...
         k*w4*(1-(1-a-k)^8)/(a+k)*x4;
    Z = [Z, z];
end
[mz, ind] = max(Z)
k4 = K(ind), k3 = 0.42 * k4  %最优捕捞强度
xx = X(:,ind)  %各年龄组的鱼群数
plot(K, Z) ; xlabel('$k$', 'Interpreter', 'Latex')
ylabel('$z$', 'Interpreter', 'Latex', 'Rotation', 0)
