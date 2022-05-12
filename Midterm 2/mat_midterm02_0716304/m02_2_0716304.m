%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: 2
% Problem number: 2
% Student Name:  ¼B¤l»ô
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science
% Date: 2022/05/12
% National Yang Ming Chiao Tung University, Taiwan
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear; clc;		% close all windows
                            % clear variables, and clear screen

disp('Midterm Problem 2.2') 	% show Midterm Problem 2.2

disp('¼B¤l»ô 0716304');


% plot 1
a1 = 9;
b1 = 3;
c1 = 8;
dt1 = 0.1;

t1 = [0 : dt1 : 4*pi];

x1 = (a1 + b1) .* cos(t1) - c1 .* cos((a1 / b1 + 1) .* t1);
y1 = (a1 + b1) .* sin(t1) - c1 .* sin((a1 / b1 + 1) .* t1);

% plot 2
a2 = 10;
d2 = 2;
dt2 = 0.2;

t2 = [0 : dt2 : 8*pi];

x2 = a2 .* cos(t2) .* sin(d2 .* t2);
y2 = a2 .* sin(t2) .* sin(d2 .* t2);

start = input("Please press Enter to start!!!");

for f = [0 : 0.025 : 1]
   
    % left figure
    k1 = 1 - cos(f * pi / 2);
    xl = (1-k1) .* x1 + k1 .* x2;
    yl = (1-k1) .* y1 + k1 .* y2;
    
    % right figure
    k2 = f * (2 - sin((1 - f/2) * pi + 2 * f * pi));
    xr = (1 - k2) .* x1 + k2 .* x2;
    yr = (1 - k2) .* y1 + k2 .* y2;
    
    subplot(1, 2, 1);
    plot(x1, y1, 'color', [0 0.4470 0.7410], 'linewidth', 3);
    hold on;
    plot(x2, y2, 'color', [0.6350 0.0780 0.1840], 'linewidth', 3);
    plot(xl, yl, 'color', [0.9290 0.6940 0.1250], 'linewidth', 3);
    hold off;
    axis([-25 20 -20 20])
    
    subplot(1, 2, 2);
    plot(x1, y1, 'color', [0 0.4470 0.7410], 'linewidth', 3);
    hold on;
    plot(x2, y2, 'color', [0.6350 0.0780 0.1840], 'linewidth', 3);
    plot(xr, yr, 'color', [0.9290 0.6940 0.1250], 'linewidth', 3);
    hold off;
    axis([-25 20 -20 20])
    
    figure(1);
    pause(0.05)
end