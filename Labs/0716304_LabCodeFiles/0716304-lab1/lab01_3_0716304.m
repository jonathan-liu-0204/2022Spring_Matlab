%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: Lab01
% Problem number: 3
% Student Name: 劉子齊 Jonathan
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science, NYCU
% Date: 2022.04.28
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clf; clear; clc;		% clear the current figure
				% clear variables, and clear screen

disp("Lab Problem 1.3") 	% show Lab Problem 1.3

while 1
    
    m = input("Please enter a non-negative integer 'm' inside [0, 10]: ");
    clf;
    
    if m == 0
        disp("Thanks for playing.");
        break;
    elseif or(m < 0, m > 10)
        continue;
    else
        clf;
        
        x = [-10 : 0.01 : 10];
        y1 = cos(x);
        y2 = 0;
        
        for n = [0 : m]
           y2 = y2 +  (x .^ 2*n) .* ((-1) ^ n / factorial(2 * n));
        end
        
        plot(x, y1, 'linewidth', 4)
        hold on;
        plot(x, y2, 'linewidth', 2)
        figure(1);
    end
end
