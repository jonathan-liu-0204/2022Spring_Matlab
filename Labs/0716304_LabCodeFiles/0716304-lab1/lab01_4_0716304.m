%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: Lab01
% Problem number: 4
% Student Name: 劉子齊 Jonathan
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science, NYCU
% Date: 2022.04.28
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clf; clear; clc;		% clear the current figure
				% clear variables, and clear screen

disp("Lab Problem 1.4") 	% show Lab Problem 1.4

while 1
    
    hold off;
    
    a = input("Please input 'a': ");
    dx = input("Please input a non-negative 'dx': ");
    if dx < 0
        continue;
    else
        x = [-10 : dx : 10];

        y = (2 .* x .^ 2 + 3 .* exp(-x) - (100 * a) .* sin(5 .* x)) ./ (6 .* x .^2 - 9 .* x - 42) - 10;
        
        x1 = [];
        y1 = [];
        
        i = 1;
        total_num = 20 / dx + 1;
        
        current_sign = 0;
        
        while i <= total_num
             
            if current_sign == 0
                if y(i) > 0
                   x1 = [x1, x(i)];
                   y1 = [y1, y(i)];
                   i = i + 1;
                elseif y(i) < 0
                   plot(x1, y1, 'b', 'linewidth', 2);
                   ylim([-100 100]);
                   hold on;
                   figure(1);
                   x1 = [];
                   y1 = [];
                   current_sign = 1;
                end
            else
                if y(i) < 0
                   x1 = [x1, x(i)];
                   y1 = [y1, y(i)];
                   i = i + 1;
                elseif y(i) > 0
                   plot(x1, y1, 'r', 'linewidth', 2);
                   ylim([-100 100]);
                   hold on;
                   figure(1);
                   x1 = [];
                   y1 = [];
                   current_sign = 0;
                end
            end
            
        end
        if current_sign == 0
            plot(x1, y1, 'b', 'linewidth', 2);
            ylim([-100 100]);
            hold on;
            figure(1);
        elseif current_sign == 1
            plot(x1, y1, 'r', 'linewidth', 2);
            ylim([-100 100]);
            hold on;
            figure(1);
        end
    end
end