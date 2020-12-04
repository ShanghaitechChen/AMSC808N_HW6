function [G] = Generate_grpha(n,z)
% generate undirected random graph
    G = zeros(n,n);
    for i = 1 : n-1
        for j = i+1 : n
            if rand < z / (n-1)
                G(i,j)=1;
                G(j,i)=1;
            end
        end
    end