%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: 2
% Problem number: 4
% Student Name:  劉子齊 Jonathan
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science, NYCU
% Date: 2021/03/15
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clf; clear; clc;		% clear the current figure
                        % clear variables, and clear screen

fprintf('Student ID:0716304 Name:劉子齊 Jonathan\n'); % show student id and name                        
                        
disp('Problem 2.4') 	% show Problem 2.4

x = [-5: 0.005: 10];

y = (5 .* x .^ 2 + 2 .* x + 7) ./ (x .^ 2 - 5 .* x - 14);

index_y1 = find(y >= 0);
index_y2 = find(y < 0);

big_x = x(index_y1);
big_y = y(index_y1);

sml_x = x(index_y2);
sml_y = y(index_y2);

plot(big_x, big_y, 'r', 'linewidth', 2);
hold on
plot(sml_x, sml_y, 'b', 'linewidth', 2);