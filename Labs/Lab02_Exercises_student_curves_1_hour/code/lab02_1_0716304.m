%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: Lab 2
% Problem number: 1
% Student Name:  劉子齊 Jonathan
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@Gmail.com
% Department: Computer Science, NYCU
% Date: 2022/05/08
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% close all windows
% clear variables, and clear screen
close all; clf; clear; clc;

% show Lab Two Example
disp('Lab 2.1')  

while true
    d = input('Please input two values of d in [0 1] (e.g. [0.2 1]): ');
    if (or(d(1) < 0, d(2) < 0))
        disp("Thanks for playing.");
        return;
    end
    if (and(d(1) <= 1, d(2) <= 1)) 
        break;
    else
        disp("Please enter valid inputs.");
    end    
end

grid on;
t = 0;

v1 = [15  20];
p1 = [0  0];
v2 = [15  20];
p2 = [0  0];

n = [0 -1];
dt = 0.2;
m = 1;
g = 2;

tmax = 20;

x1 = [];
y1 = [];
x2 = [];
y2 = [];


while t <= tmax
    
    F1 = m * g .* n;
    a1 = F1 ./ m - d(1) .* v1;
    v1 = v1 + a1 .* dt;
    p1 = p1 + v1 .* dt;
    
    y1(end+1) = p1(1);
    x1(end+1) = p1(2);
    
    F2 = m * g .* n;
    a2 = F2 ./ m - d(2) .* v2;
    v2 = v2 + a2 .* dt;
    p2 = p2 + v2 .* dt;
    
    y2(end+1) = p2(1);
    x2(end+1) = p2(2);
    
    t = t + dt;
    
    subplot(1, 2, 1);
    grid on;
    plot(y1, x1, 'color', [0,0.7,0.9]);
    hold on;
    p = plot(p1(1),p1(2), 'o', 'linewidth', 2, 'color', 'b');
%     viscircles([p1(1) p1(2)], 1, 'color', 'b');
    hold off;
    axis([0 400 -100 100]);
    
    subplot(1, 2, 2);
    grid on;
    plot(y2, x2, 'color', [0,0.7,0.9]);    
    hold on;
    p = plot(p2(1),p2(2), 'o', 'linewidth', 2, 'color', 'b');
%     viscircles([p2(1) p2(2)], 1, 'color', 'b');
    hold off;
    axis([0 400 -100 100]);
    
    pause(0.0001);
end