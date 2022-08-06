clc, clear
NN1 = strcat('S',cellstr(int2str([1:7]')));
NN2 = strcat('A',strtrim(cellstr((int2str([1:15]')))));
NN3 = strcat('B',strtrim(cellstr(int2str([1:17]'))));
NN={NN1{:},NN2{:},NN3{:}};
G = graph; G = addnode(G,NN);
L1 = {'B1','B3',450; 'B2','B3',80; 'B3','B5',1150
       'B5','B8',1100; 'B4','B6',306; 'B6','B7',195
      'S1','B7',20; 'S1','B8',202; 'S2','B8',1200
      'B8','B9',720; 'S3','B9',690; 'B9','B10',520
      'B10','B12',170; 'S4','B12',690; 'S5','B11',462 
      'B11','B12',88; 'B12','B14',160; 'B13','B14',70
      'B14','B15',320; 'B15','B16',160; 'S6','B16',70
      'B16','B17',290; 'S7','B17',30};
G1 = addedge(G,L1(:,1),L1(:,2), cell2mat(L1(:,3)));
d1 = distances(G1);  %求所有点对之间的最短距离
c1 = inf*ones(size(d1));
c1(d1==0)=0; c1((d1>0) & (d1<=300))=20;
c1((d1>300) & (d1<=350))=23;
c1((d1>350) & (d1<=400))=26;
c1((d1>400) & (d1<=450))=29;
c1((d1>450) & (d1<=500))=32;
c1((d1>500) & (d1<=600))=37;
c1((d1>600) & (d1<=700))=44;
c1((d1>700) & (d1<=800))=50;
c1((d1>800) & (d1<=900))=55;
c1((d1>900) & (d1<=1000))=60;
ind=(d1>1000) & (d1<inf);
c1(ind)=60+5*ceil(d1(ind)/100-10);

L2 = {'A1','A2',104; 'A2','B1',3; 'A2','A3',301
      'A3','B2',2; 'A3','A4',750; 'A4','B5',600
      'A4','A5',606; 'A5','B4',10; 'A5','A6',194
      'A6','B6',5; 'A6','A7',205; 'A7','B7',10
      'S1','A7',31; 'A7','A8',201; 'A8','B8',12
      'A8','A9',680; 'A9','B9',42; 'A9','A10',480
      'A10','B10',70; 'A10','A11',300; 'A11','B11',10
      'A11','A12',220; 'A12','B13',10; 'A12','A13',210
      'A13','B15',62; 'A13','A14',420; 'S6','A14',110
      'A14','B16',30; 'A14','A15',500; 'A15','B17',20
      'S7','A15',20};
G2 = addedge(G,L2(:,1),L2(:,2),cell2mat(L2(:,3)));
w2 = full(adjacency(G2,'weighted'));  %导出权重邻接矩阵
w2(w2==0) = inf;  %把0替换为inf
w3 = min(c1, 0.1*w2);  %对应元素取最小值
 
G3 = graph(w3); c3 = distances(G3);
c4 = c3(1:7,8:22)   %提出7行15列的运费数据
writematrix(c4,'anli6_1.xlsx')

s = [800, 800, 1000, 2000, 2000, 2000, 3000]';
p = [160, 155, 155, 160, 155, 150, 160]';
b = [104, 301, 750, 606, 194, 205, 201, 680, ...
    480, 300, 220, 210, 420, 500]';
c = repmat(p,1,15) + c4  %购运费用
prob = optimproblem;
x = optimvar('x',7,15, 'LowerBound',0);
y = optimvar('y',15, 'LowerBound',0);
z = optimvar('z',15, 'LowerBound',0);
obj = sum(sum(c.*x))+0.05*sum(y.^2+y+z.^2+z);
prob.Objective = obj;
prob.Constraints.con1 = sum(x,2)<=s;
prob.Constraints.con2 = sum(x) == y'+z'
prob.Constraints.con3 = y(2:end)+z(1:end-1)==b;
prob.Constraints.con4 = [y(1)==0; z(15)==0];
[sol, fval, flag, out] = solve(prob)
check1 = sum(sol.x,2)
prob1 = prob; prob2 = prob; prob3=prob; prob4=prob;
prob1.Constraints.con5 = [sum(x(4,:))==0; sum(x(7,:))==0];
[sol1, fval1, flag1, out1] = solve(prob1)
prob2.Constraints.con5 = [sum(x(4,:))>=500; sum(x(7,:))>=500];
[sol2, fval2, flag2, out2] = solve(prob2)
prob3.Constraints.con5 = sum(x(4,:))>=500;
prob3.Constraints.con6 = sum(x(7,:))==0;
[sol3, fval3, flag3, out3] = solve(prob3)
prob4.Constraints.con5 = sum(x(4,:))==0;
prob4.Constraints.con6 = sum(x(7,:))>=500;
[sol4, fval4, flag4, out4] = solve(prob3)
sol1.x, sx = sum(sol1.x,2)
tx = round(sol1.x), tsx =sum(tx,2)  %取整后的解
writematrix([sum(sol1.x,2),sol1.x],'anli6_1.xlsx','Sheet', 2)
writematrix([tsx,tx], 'anli6_1.xlsx', 'Sheet', 2, 'Range', 'A9')

