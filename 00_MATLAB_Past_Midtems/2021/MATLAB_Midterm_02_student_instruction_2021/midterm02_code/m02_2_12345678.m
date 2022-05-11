%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: 2
% Problem number: 2
% Student Name:  �B�l��
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science
% Date: 2022/05/09
% National Yang Ming Chiao Tung University, Taiwan
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear; clc;		% close all windows
                            % clear variables, and clear screen

disp('Midterm Problem 2.2') 	% show Midterm Problem 2.1

disp('�B�l�� 0716304');


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
dt2 = (r / 2*(R-r)) / dt1

t2 = [0 : dt2 : 6 * pi * r / (R-r)];
x2 = (R-r) .* cos(t2) + d .* cos(((R-r)/r) .* t2);
y2 = (R-r) .* sin(t2) + d .* sin(((R-r)/r) .* t2);

for f = [0 : 0.1 : 1]
   
    % left figure
    k1 = f * cos(2*pi*f);
    xl = (1-k1) .* x1 + k1 .* x2;
    yl = (1-k1) .* y1 + k1 .* y2;
    
    % right figure
    k2 = (exp(f) -1) / (exp(1)-1); 
    xr = (1-k2) .* x1 + k2 .* x2;
    yr = (1-k2) .* y1 + k2 .* y2;
    
    subplot(1, 2, 1);
    axis([-20 20 -20 20])
    plot(xl, yl);
    
    subplot(1, 2, 2);
    axis([-20 20 -20 20])
    plot(xr, yr);
    
    pause(0.1)
    
end
