%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: Lab01
% Problem number: 2
% Student Name: 劉子齊 Jonathan
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science, NYCU
% Date: 2022.04.28
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clf; clear; clc;		% clear the current figure
				% clear variables, and clear screen

disp("Lab Problem 1.1") 	% show Lab Problem 1.1

while 1
    
    a = input("Please input 'a': ");
    if a == 0
        disp("Thanks for playing.")
        break;
    end
    
    while 1
        dx = input("Please input step sixe 'dx': ");
        if dx == 0
            dx = 0.05;
            break;
        elseif dx < 0
            disp("dx must be a non-negative number");
        else
            break;
        end
    end
    
    x = [-10 : dx : 10];
    y = a .* abs(x) + sin(x);
    figure(1);
    plot(x, y, 'linewidth', 3);
    figure(1)
    hold on;
end