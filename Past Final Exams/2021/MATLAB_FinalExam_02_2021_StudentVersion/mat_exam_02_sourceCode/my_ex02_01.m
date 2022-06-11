%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Final Exam Number: ¡K
% Problem number: ¡K
% Student Name:  ¡K
% Student ID: ¡K
% Email address: ¡K
% Department:
% Date: ¡K.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear; clc;		% close all windows
% clear variables, and clear screen

disp('Final Exam Problem 2.1') 	% show Final Exam Problem 1.1

disp('Student Name; Student ID');

while true
   n = input("Please input n in [0, 1000000]: ");
   
   if(and(n > 0, n <= 1000000))
       break;
   end
   
   if(n == 0)
       return;
   end
end

while true
   a = input("Please input a in [-1, 1]: ");
   
   if(and(a >= -1, a <= 1))
       break;
   else
       disp("Invalid input...");
   end
end

Y = rand(1,n);

X1 = a .* cos(pi.*Y.^2 ./ 2) - a; 
X2 = a .* cos(pi.*Y.^2 ./ 2) + a;

M1 = mean(X1);
SD1 = std(X1);
M2 = mean(X2);
SD2 = std(X2);

if a > 0
    Xrange1 = -0.01:-0.025:-a + 0.01;
else
    Xrange1 = 0.01:0.025:-a - 0.01;
end

if a > 0
    Xrange2 = a + 0.01:0.025:2 * a - 0.01;
else
    Xrange2 = a - 0.01:-0.025:2 * a + 0.01;
end

syms x;
syms y;

func1 = a .* cos(pi.*y.^2 ./ 2) - a;
func2 = a .* cos(pi.*y.^2 ./ 2) + a;

s1 = solve(x == func1, y);
s2 = solve(x == func2, y);

d_func1 = diff(func1);
d_func2 = diff(func2);

ty0 = 0.5;
tx0_1 = double(subs(func1, y, ty0));
tx0_2 = double(subs(func2, y, ty0));

for i = 1:1:2
    if (double(subs(s1(i), tx0_1)) > 0)
        cpf1 = s1(i);
        break;
    end
end

for i = 2:-1:1
    if (double(subs(s2(i), tx0_2)) > 0)
        cpf2 = s2(i);
        break;
    end
end

if (double(subs(d_func1, y, ty0)) < 0)
    cpf1 = 1 - cpf1;
end

if (double(subs(d_func2, y, ty0)) < 0)
    cpf2 = 1 - cpf2;
end

pdf1 = diff(cpf1);
pdf2 = diff(cpf2);

figure;

siz1 = size(Xrange1);
siz1 = siz1(2);
siz2 = size(Xrange2);
siz2 = siz2(2);
siz = min(siz1, siz2);

while true
    for p=1:siz
        clf;
        
        subplot(1, 3, 1);
        histogram(Y, 'Normalization', 'pdf');
        hold on;
        plot(0:1, [1 1], 'LineWidth', 2);
        hold on;
        plot(p / siz, 1, 'y.', 'MarkerSize', 24);
        hold off;
        title('PDF of Y');

        subplot(1, 3, 2);
        histogram(X1, 'Normalization', 'pdf');
        hold on;
        plot(Xrange1, double(subs(pdf1, x, Xrange1)), 'LineWidth', 2);
        hold on;
        plot(Xrange1(p), double(subs(pdf1, x, Xrange1(p))), 'y.', 'MarkerSize', 24);
        hold off;
        title({'PDF of X1=a*cos(\piY^{2}/2)-a', sprintf('Mean:%f;SD:%f;a = %.2f', M1, SD1, a)}, 'Interpreter', 'tex');

        subplot(1, 3, 3);
        histogram(X2, 'Normalization', 'pdf');
        hold on;
        plot(Xrange2, double(subs(pdf2, x, Xrange2)), 'LineWidth', 2);
        hold on;
        plot(Xrange2(p), double(subs(pdf2, x, Xrange2(p))), 'y.', 'MarkerSize', 24);
        hold off;
        title({'PDF of X2=a*sin(\piY^{2}/2)+a', sprintf('Mean:%f;SD:%f;a = %.2f', M2, SD2, a)}, 'Interpreter', 'tex');

        pause(1/30);
    end
end
