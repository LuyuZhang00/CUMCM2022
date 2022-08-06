clc, clear
s={{'张','李','王'};{'李','赵','刘'};{'张','刘','王'};
     {'赵','刘','孙'};{'张','王','孙'};{'李','刘','王'}};
n = length(s); w = zeros(n);
for i = 1:n-1
    for j =i+1:n
        if ~isempty(intersect(s{i},s{j}))
            w(i,j)=1;
        end
    end
end
[ni,nj] = find(w);  %边的顶点编号
w = w + w'; %计算完整的邻接矩阵
deg = sum(w); K = max(deg) %顶点的最大度
prob = optimproblem;
x = optimvar('x',n,K+1, 'Type','integer','LowerBound',0,'UpperBound',1);
y = optimvar('y'); prob.Objective = y;
prob.Constraints.con1 = sum(x,2)==1;
prob.Constraints.con2 = x(ni,:)+x(nj,:)<=1;
prob.Constraints.con3 = x*[1:K+1]'<=y;
[sol, fval, flag, out] = solve(prob)
[i,k] = find(sol.x);
fprintf('顶点和颜色的对应关系如下：\n')
ik = [i'; k']
