%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: 2
% Problem number: 3
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

t = 0;
v = [6 0.1];
p = [0 40];
p_all_x = [];
p_all_y = [];
dt = 0.3;
M = 2000;
m = 1;
d = 0.005;
tmax = 100;

all_t = [];
all_v = [];
all_p = [];

while t <= tmax
    
    F = (-1) .* (p / norm(p)) .* ((m * M) ./ (p * p.'));
    a = F/m - 2*d .* v .* sin(1.5*t) .* exp(2 * cos(t));
    v = v + a .* dt;
    p = p + v .* dt;
    t = t + dt;
    
    all_t = [all_t, t];
    
    p_all_x = [p_all_x, p(1)];
    p_all_y = [p_all_y, p(2)];
    
    subplot(2, 2, [1 3])
    plot(p_all_x, p_all_y, 'color', 'g');
    hold on;
    plot(p_all_x(end), p_all_y(end), '*', 'linewidth', 3, 'color','r');
    
    if(t >= 2)
        plot(p_all_x(end-1), p_all_y(end-1), '*', 'linewidth', 3, 'color','r');
    end
    
    if(t >= 3)
        plot(p_all_x(end-2), p_all_y(end-2), '*', 'linewidth', 3, 'color','r');
    end
    hold off;
    axis([-50 50 -50 50]);
    
    % speed
    subplot(2, 2, 2);
    all_v = [all_v, sqrt((v(1) ^2) + (v(2) ^ 2))];
    plot(all_t, all_v, 'color', 'b');
    xlabel('Steps')
    ylabel('Speed (km/s)')

    % distance
    subplot(2, 2, 4);
    all_p = [all_p, sqrt((p(1) ^2) + (p(2) ^ 2))];
    plot(all_t, all_p, 'color', 'r');
    xlabel('Steps')
    ylabel('Distance (km)')

    pause(0.05)
end