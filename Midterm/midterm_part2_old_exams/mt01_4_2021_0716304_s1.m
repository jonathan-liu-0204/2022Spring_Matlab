%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: …
% Problem number: …
% Student Name:  …
% Student ID: …
% Email address: …
% Department:
% Date: ….
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear; clc;		% close all windows
                            		% clear variables, and clear screen

disp('Midterm Problem 1.4') 	% show Midterm Problem 1.4

% Plot y(x) = [z1(x) cos (z2(x)) ] / z2(x)
% z1(x) = sin (x)*e-w sin(x) +  w cos(x)
% z2(x) =(x2 - 2 x w – 3w2)(|cos(2x)|+u)

while 1

    u = input("Please input u in the interval [0, 1]: ");
    
    if u == 0
        return
    end
    
    for w = [0.1 : 0.05 : 3]
        
        pause(0.2);
        x = [-10 : 0.025 : 10];
        x1 = [-10 : 0.1 : -w - eps];
        x2 = [-w + eps : 0.1 : 3 * w - eps];
        x3 = [3 * w + eps : 0.1 : 10];
        
        z11 = sin (x1) .* exp((-w) .* sin(x1)) +  w .* cos(x1);
        z12 = sin (x2) .* exp((-w) .* sin(x2)) +  w .* cos(x2);
        z13 = sin (x3) .* exp((-w) .* sin(x3)) +  w .* cos(x3);
        %z2 = (x .^ 2 - 2 .* x .* w - 3 * (w^2)) .* (abs(cos(2 .* x)) + u);
        
        z21 = (x1 .^ 2 - 2 .* x1 .* w - 3 * (w^2)) .* (abs(cos(2 .* x1)) + u);
        z22 = (x2 .^ 2 - 2 .* x2 .* w - 3 * (w^2)) .* (abs(cos(2 .* x2)) + u);
        z23 = (x3 .^ 2 - 2 .* x3 .* w - 3 * (w^2)) .* (abs(cos(2 .* x3)) + u);
        % plot(x, z1)
        % plot(x, z1)
        
        %y = (z1 .* cos(z2)) ./ z2;
        
        y1 = (z11 .* cos(z21)) ./ z21;
        y2 = (z12 .* cos(z22)) ./ z22;
        y3 = (z13 .* cos(z23)) ./ z23;
        
        plot(x1, y1, 'linewidth', 3)
        ylim([-10 10])
        hold on;
        plot(x2, y2, 'linewidth', 3)
        plot(x3, y3, 'linewidth', 3)
        hold off;
        
    end
end
