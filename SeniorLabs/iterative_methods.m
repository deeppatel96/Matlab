clear all, close all, clc

% Jacobi method

A = [10 -1 2 0 9 0;
    -1 11 -1 3 -1 1;
    2 -1 10 -1 5 0;
    0 3 -1 8 1 -4;
    10 0 -2 3 19 -1;
    0 0 -1 3 5 18;]

b = [6; 25; -11; 15; 6; -1]


x = [1;1;1;1;1;1]
xlast = x;
n = length(x);
tol = 1e-9;

for k = 1:1000
    for i = 1:n
        sum = 0;
        for j = 1:n
            if i ~= j
            sum = sum + A(i,j)*xlast(j);
            end
        end
        x(i) = (b(i) - sum)/A(i,i);
    end
    max = 0;
    for i = 1:n
        if(abs(x(i)-xlast(i))/abs(x(i)) > max)
            max = abs(x(i)-xlast(i))/abs(x(i));
        end
    end
    if max < tol
        break;
    end
    xlast = x;
end

x
k







