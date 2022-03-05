%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Student Name: 劉子齊 Jonathan
% Student ID: 0716304
% Email address: eagle3jonathan.cs07@nycu.edu.tw
% Department: Computer Science, NYCU
% Date: 2022/03/05
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp("Problem 1.1") 	% show “Problem 1.1.“

n = 4;
P = [(-2*n):2:(2*n)]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp("Problem 1.2") 	% show “Problem 1.2.“

n = 10;
Q = meshgrid((1:n).^ 2)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp("Problem 1.3") 	% show “Problem 1.3.“

n = 10;
r = [1:n];
R = r .* (-1) .^ (r+1)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%not done yet
disp("Problem 1.4") 	% show “Problem 1.4.“

n = 14;
a = 2 .* fix([3:n+2] ./ 2);
A = a - ones(1,n)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp("Problem 1.5") 	% show “Problem 1.5.“

n = 6;
a = [1:n];
T = a + mod(-a, 4) + 1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp("Problem 2.1") 	% show “Problem 2.1.“

r = 5;
x = [-r:0.1:r];
y = [-r:0.1:r];
[X Y] = meshgrid(x, y);
Z = Y .* sin(X) .* cos(X) ./ (abs(X) + eps);
S = surf(X, Y, Z)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp("Problem 2.2") 	% show “Problem 2.2.“

clf

x = [0:0.01:4];
y1 = x;
y2 = x .^ 2;
y3 = x .^ 3;
y4 = exp(x);
y5 = exp(-x);
y6 = log(x);

plot(x, y1, x, y2, x, y3, x, y4, x, y5, x, y6)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp("Problem 2.3") 	% show “Problem 2.3.“

clf

x1  = [-10: 0.001: 10];
y1 = sin(x1) - x1;
z1 = sin((y1 .^ 2)) -  exp(x1) ./ x1;

x2  = [-10: 0.5: 10];
y2 = sin(x2) - x2;
z2 = sin((y2 .^ 2)) -  exp(x2) ./ x2;

plot(x1, z1, x2, z2, 'o')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp("Problem 2.4") 	% show “Problem 2.4.“

clf

x = [-10 : 0.5 : 10];
y = [-10 : 0.5 : 10];
[X, Y] = meshgrid(x, y);
z = (X + Y) ./ (X .^ 2 +  Y .^ 2 + 1);
meshc(X, Y, z)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp("Problem 2.5") 	% show “Problem 2.5.“

clf

x = [-10: 0.05: 10];
y1 = 0.5 + (x .* sin(x)) ./ ( x .^ 2 .* exp(sin(x)) + 1);
y2 = cos(x) .^ 2 + sin(x) .^ 2;
plot(x, y1, x, y2)
