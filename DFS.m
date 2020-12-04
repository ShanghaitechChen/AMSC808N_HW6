function [T] = DFS(G)
% DFS
    G = sparse(G);
    n = size(G,1);
    color = zeros(n,1);
    parent = zeros(n,1);
    T = [];
    time = 0;
    for i = 1:n
        if color(i)~=0
            continue
        else
            time_old = time;
            [time, color, parent] = DFS_VISIT(G,i,time,color,parent,n);
            T = [T,time-time_old];
        end
    end
end

function [time, color, parent] = DFS_VISIT(G,i,time,color,parent,n)
    time = time + 1;
    color(i) = 0.5;
    for j = 1:n
        if G(i,j)==1 && color(j)==0
            parent(j) = i;
            [time, color, parent] = DFS_VISIT(G,j,time,color,parent,n);
        end
    end
    color(i) = 1;         
end