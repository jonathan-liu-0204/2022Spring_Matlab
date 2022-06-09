%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: HW4
% Problem number: 1
% Student Name:  劉子齊
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science, NYCU
% Date: 2022/05/13
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% close all windows
% clear variables, and clear screen
clf; clear; clc;close all;

disp('HW04 Problem 4.1');

while true
    n = input("Please input n in [0, 1000000]: ");
    if(n == 0)
        disp("Thanks for playing:))");
        return
    elseif(or(n<0, n>1000000))
        disp("n needs to be inside [0, 1000000]...");
    else
        break
    end
end

while true
    a = input("Please input 'a': ");
    b = input("Please input 'b': ");
    c = input("Please input 'c': ");
    
    if(and(a > 0, and(b > 0, c > 0)))
        break;
    elseif(and(a < 0, and(b < 0, c < 0)))
        break;
    else
        disp("a, b, c needs to be nonzero and in the same sign :)))")
    end
end

syms x;
syms y;

func = a * y ^2 + b * y + c;
s = solve(x == func, y);
d_func = diff(func);

ty0 = 0.8;      % testing
tx0 = double(subs(func, y, ty0));

for i = 1:2
    if(double(subs(s(i), tx0))>0)
        cpf = s(i);
        break;
    end
end

if (double(subs(d_func, y, ty0)) < 0)
    cpf = 1 - cpf;
end

my_pdf = diff(cpf);


close all;
y = rand(n,1);
x1 = a .* y .^ 2 + b .* y + c;

h = histogram(x1, 'Normalization', 'pdf');
[N, edges] = histcounts(x1, 'Normalization', 'pdf');
hold on
f = double(subs(my_pdf, x, edges));
plot(edges,f,'LineWidth',3);
set(gca, 'Fontsize',15);

M = mean(x1);
SD = std(x1);
n_point = length(f);

for i = [n_point:-1:1]
    h = histogram(x1, 'Normalization', 'pdf');
    hold on;
    plot(edges,f,'LineWidth',3);
    plot(edges(i), f(i), '*', 'linewidth', 3)
    set(gca, 'Fontsize',10);
    title(['M = ', num2str(M), '; SD = ' , num2str(SD), '; a = ', num2str(a), '; b = ', num2str(b), '; c = ', num2str(c)]);
    hold off;
    
    figure(1)
    pause(0.05)
end


