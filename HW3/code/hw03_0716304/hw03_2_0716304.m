%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: 3
% Problem number: 2
% Student Name:  劉子齊
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science, NYCU
%
% Date: 2022.04.16
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all;
clf; clear; clc;		% clear the current figure
                        % clear variables, and clear screen

disp('Assignment Problem 3.2') 	% show Assignment Problem 3.1

% x = 0:0.01:pi*2;
% r = cos(2x)sin(2x);

X = 0 : 0.01 : (pi * 2);

x = zeros(size(X));
r = zeros(size(X));
i = 1;

for x0 = 0 : 0.01 : (pi * 2)
    
    clf
    r0 = cos(2 .* x0) .* sin(2 .* x0);
    x(i) = x0;
    r(i) = r0;
    pass = polar(x(1:i), r(1:i));
    patch(get(pass,'XData'), get(pass,'YData'), 'y')
    hold on;
    pause(0.01);
    
    i = i + 1;
end