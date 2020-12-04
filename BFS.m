function [distance] = BFS(G, source)
% DFS
    G = sparse(G);
    n = size(G,1);
    color = zeros(n,1); 
    parent = zeros(n,1);
    distance = zeros(n,1);
    parent(source) = 0;
    color(source) = 0.5;
    Q = [source];
    while ~isempty(Q)
        sQ = Q(1);
        for j = 1 : n
            if G(sQ,j)==1 && color(j)==0
                color(j) = 0.5;
                distance(j) = distance(sQ) + 1;
                parent(j) = sQ;
                Q(end+1) = j;
            end
        end
        color(sQ) = 1;
        Q = Q(2:end);
    end
end