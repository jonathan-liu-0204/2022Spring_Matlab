%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: HW4
% Problem number: 2
% Student Name:  劉子齊
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science, NYCU
% Date: 2022/05/13
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% close all windows
% clear variables, and clear screen
close all; clf; clear; clc;

disp('HW04 Problem 4.2'); 

while true
   x0 = input("Input x0 inside [0, 10]: ");
   
   if(and(x0 <= 10, x0 > 0))
       break;
   elseif(x0 == 0)
       disp("Thanks for playing!!")
       return
   else
       disp("Please input valid input...")
   end
end

x = [0:0.01:10];
y1 = sin(x);
y2 = cos(2 .* x);
y3 = x .^ 2 .* sin(x) .* exp((-1 .* (x - 1)));
y4 = 4 - x ./ 2;

n_x0 = x0 / 0.01 + 1;
a1 = trapz(x(1:n_x0), abs(y1(1:n_x0)));
a2 = trapz(x(1:n_x0), abs(y2(1:n_x0)));
a3 = trapz(x(1:n_x0), abs(y3(1:n_x0)));
a4 = trapz(x(1:n_x0), abs(y4(1:n_x0)));

all_a = [a1 a2 a3 a4];
all_a = sort(all_a);

if(all_a(1) == a1)
    o1 = 1;
elseif(all_a(1) == a2)
    o2 = 1;
elseif(all_a(1) == a3)
    o3 = 1;
else
    o4 = 1;
end

if(all_a(2) == a1)
    o1 = 2;
elseif(all_a(2) == a2)
    o2 = 2;
elseif(all_a(2) == a3)
    o3 = 2;
else
    o4 = 2;
end

if(all_a(3) == a1)
    o1 = 3;
elseif(all_a(3) == a2)
    o2 = 3;
elseif(all_a(3) == a3)
    o3 = 3;
else
    o4 = 3;
end

if(all_a(4) == a1)
    o1 = 4;
elseif(all_a(4) == a2)
    o2 = 4;
elseif(all_a(4) == a3)
    o3 = 4;
else
    o4 = 4;
end

n_all = 10 / 0.01 + 1;

for i = [1:1:n_all]
    subplot(2, 2, 1);
    plot(x, y1);
    hold on;
    grid on;
    plot([x(i), x(i)], [y1(i), 0]);
    title(['(',num2str(o1), ') y1 = sin(x); Area:',num2str(a1)]);
    hold off;

    subplot(2, 2, 2);
    plot(x, y2);
    hold on;
    grid on;
    plot([x(i), x(i)], [y2(i), 0]);
    title(['(',num2str(o2), ') y2 = cos(2.*x); Area:',num2str(a2)]);
    hold off;
    
    subplot(2, 2, 3);
    plot(x, y3);
    hold on;
    grid on;
    plot([x(i), x(i)], [y3(i), 0]);
    title(['(',num2str(o3), ') y3 = x.^2.*sin(x).*exp((-1.*(x-1))); Area:',num2str(a3)]);
    hold off;
    
    subplot(2, 2, 4);
    plot(x, y4);
    hold on;
    grid on;
    plot([x(i), x(i)], [y4(i), 0]);
    title(['(',num2str(o4), ') y4 = 4-x./2; Area:',num2str(a4)]);
    hold off;
    
    figure(1);
    pause(0.025);
end
