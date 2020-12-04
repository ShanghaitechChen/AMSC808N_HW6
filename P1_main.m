close all
clear;clc;
z = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.1,1.2,1.3,1.4,1.5,2,2.5,3,3.5,4];
n = 1000;
len = size(z, 2); 
S = zeros(len,1); % fraction S
s = zeros(len,1); % average size of non-giant component
for g = 1:100
    for i = 1 : len
        G = Generate_grpha(n,z(i));
        T = DFS(G);
        S(i) = S(i) + max(T);
        if z(i) >= 1
            s(i) = s(i) + (sum(T) - max(T)) / (size(T, 2)-1);
        else
            s(i) = s(i) + sum(T) / size(T, 2);
        end
    end
end
S = S / 100;
s = s / 100;
S = S / 1000;
plot(z, S,'LineWidth',1)
xlabel('z');
ylabel('S');

myfun = @(S,z) 1-exp(-S*z)-S;
S_real = zeros(len, 1);
for i=1:len
    fun = @(S) myfun(S,z(i));
    if z(i)<1
        S_real(i) = 0;
    else
        S_real(i) = fzero(fun,1);
    end
end
hold on
plot(z, S_real,'LineWidth',1)
legend('Numerically', 'Theoretical')

figure(2)
plot(z, s, 'LineWidth',1)
xlabel('z');
ylabel('s');
s_real = zeros(len, 1);
for i=1:len
    s_real(i) = 1 / (1-z(i)+z(i)*S_real(i));
end
hold on
plot(z, s_real,'LineWidth',1)
legend('Numerically', 'Theoretical')

