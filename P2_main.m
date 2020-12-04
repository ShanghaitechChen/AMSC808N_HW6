close all
clear;clc;
z = 4;
n = 1024;
l = zeros(4,1);

for i = 1 : 4
    G = Generate_grpha(n,z);
    sources = randsample(n, 100);
    al = 0;
    for j = 1 : 100
        distance = BFS(G, sources(j));
        al = al + sum(distance) / sum(distance>0);
    end
    l(i) = al / 100;
    n = n * 2;
end
plot(1:4, l,'LineWidth',1)
xlabel('n');
ylabel('l');
hold on 
plot(1:1:4, 5:0.5:6.5)
xticks([1 2 3 4])
xticklabels({'2^{10}','2^{11}','2^{12}','2^{13}'})
legend('Numerically', 'Theoretical')