%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: 2
% Problem number: 2
% Student Name:  ¼B¤l»ô
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science
% Date: 2022/05/09
% National Yang Ming Chiao Tung University, Taiwan
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear; clc;		% close all windows
                            % clear variables, and clear screen

disp('Midterm Problem 2.2') 	% show Midterm Problem 2.1

disp('¼B¤l»ô 0716304');


% plot 1
a1 = 3;
dt1 = 0.01;

t1 = [0 : dt1 : 12*pi];
x1 = a1 .* sin(t1) .* (exp(cos(t1)) - 2 .* cos(4 .* t1) - sin(t1 ./ 12) .^ 5);
y1 = a1 .* cos(t1) .* (exp(cos(t1)) - 2 .* cos(4 .* t1) - sin(t1 ./ 12) .^ 5);

% plor 2
R = 12;
r = 4;
d = R;
dt2 = (r / (2*(R-r))) * dt1;

t2 = [0 : dt2 : 6 * pi * r / (R-r)];
x2 = (R-r) .* cos(t2) + d .* cos(((R-r)/r) .* t2);
y2 = (R-r) .* sin(t2) + d .* sin(((R-r)/r) .* t2);

axis([-20 20 -20 20])

for f = [0 : 0.005 : 1]
   
    % left figure
    k1 = f * cos(2*pi*f);
    xl = (1-k1) .* x1 + k1 .* x2;
    yl = (1-k1) .* y1 + k1 .* y2;
    
    % right figure
    k2 = (exp(f) -1) / (exp(1)-1);
    xr = (1 - k2) .* x1 + k2 .* x2;
    yr = (1 - k2) .* y1 + k2 .* y2;
    
    subplot(1, 2, 1);
    plot(x1, y1, 'color', [0 0.4470 0.7410], 'linewidth', 2);
    hold on;
    plot(x2, y2, 'color', [0.6350 0.0780 0.1840], 'linewidth', 2);
    plot(xl, yl, 'color', [0.9290 0.6940 0.1250], 'linewidth', 2);
    hold off;
    axis([-20 20 -20 20]);
    
    subplot(1, 2, 2);
    plot(x1, y1, 'color', [0 0.4470 0.7410], 'linewidth', 2);
    hold on;
    plot(x2, y2, 'color', [0.6350 0.0780 0.1840], 'linewidth', 2);
    plot(xr, yr, 'color', [0.9290 0.6940 0.1250], 'linewidth', 2);
    hold off;
    axis([-20 20 -20 20]);
    
    figure(1);
    pause(0.001)
end
