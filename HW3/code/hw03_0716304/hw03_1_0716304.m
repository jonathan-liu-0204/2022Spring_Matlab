%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: 3
% Problem number: 1
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

disp('Assignment Problem 3.1') 	% show Assignment Problem 3.1

% y1(x) = sin(5x) + 5, y2(x) = 2cos(x2) – 5
% z1(x) = x*sin(x/2) + 5, z2(x) = 2cos(x2)/(sin(x)+1.5) - 1

x = -10 : 0.02 : 10;

y1 = sin(5 .* x) + 5;
y2 = 2 .* cos(x .^ 2) - 5;

z1 = x .* sin(x ./ 2) + 5;
z2 = 2 .* cos(x .^ 2) ./ (sin(x) + 1.5) - 1;

clf
figure
hold on
subplot(1,2,1);
plot(x, y1, 'linewidth', 2);
plot(x, y2, 'linewidth', 2);
subplot(1,2,2);    
plot(x, z1, 'linewidth', 2);
plot(x, z2, 'linewidth', 2);

for k = [1 : -0.01 : 0]
    pause(0.033);
    clf
    
    subplot(1, 2, 1)
    hold on;
    plot(x, y1, 'linewidth', 2);
    plot(x, y2, 'linewidth', 2);
    y = k .* y1 + (1-k) .* y2;
    plot(x, y, 'linewidth', 2)
    set(gca,'FontSize',15);         %set font size

    subplot(1, 2, 2)
    hold on;
    plot(x, z1, 'linewidth', 2);
    plot(x, z2, 'linewidth', 2);
    z = k .* z1 + (1-k) .* z2;
    plot(x, z, 'linewidth', 2)
    set(gca,'FontSize',15);         %set font size
    
    if (k==1)
        input('Press a key to continue...');
    end
end

