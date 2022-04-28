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

disp("Lab Problem 1.2") 	% show Lab Problem 1.2

while 1
    
    b = input("Please input 'b': ");
    if b == 0
        disp("Thanks for playing.")
        break;
    end
    
    clf;
    
    x = [-10 : 0.01 : 10];
    
    f = @(x, y) x.^2  .* (abs(sin(y)) + 1) - 2 .* x .* y - b .* y.^2;
    fimplicit(f, 'linewidth', 3)
    
end