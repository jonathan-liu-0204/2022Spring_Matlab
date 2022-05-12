%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: 2
% Problem number: 3
% Student Name:  ¼B¤l»ô
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science
% Date: 2022/05/12
% National Yang Ming Chiao Tung University, Taiwan
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear; clc;		% close all windows
                            % clear variables, and clear screen

disp('Midterm Problem 2.3') 	% show Midterm Problem 2.3

disp('¼B¤l»ô 0716304');


t = 0;
v = [7 0.2];
p = [0 45];
p_all_x = [];
p_all_y = [];
dt = 0.2;
M = 3000;
m = 0.5;
h = 0.001;
d = 0.015;
tmax = 50;

all_t = [];
all_v = [];
all_p = [];
all_a = [];

start = input("Press enter to start!!");

    
    global key_pressed_quit;
%     global key_pressed_enter;
    global key_pressed_mode;
    global key_pressed_stop;
%     key_pressed_enter = false;
    key_pressed_stop = false;
    key_pressed_mode = true;
    key_pressed_quit = false;

while t <= tmax
    if(key_pressed_quit == 1)
        close all;
       disp('¼B¤l»ô 0716304');
       break; 
    end
    
    if(t < 1)
         set(gcf, 'KeyPressFcn', @keyboard)

        F = (-1) .* (p / norm(p)) .* ((m * M) ./ (p * p.'));
        a = F/m - h .* (v * v.') .* (v / norm(v)) - d .* v .* exp((-2.5) * cos(4 .* t));
    %     a = F/m - 2*d .* v .* sin(1.5*t) .* exp(2 * cos(t));
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
        if(t >= 4)
            plot(p_all_x(end-3), p_all_y(end-3), '*', 'linewidth', 3, 'color','r');
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
        all_a = [all_a, sqrt((a(1) ^2) + (a(2) ^ 2))];
        pause(0.05)
        
    else
        set(gcf, 'KeyPressFcn', @keyboard)
        
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
            if(t >= 4)
                plot(p_all_x(end-3), p_all_y(end-3), '*', 'linewidth', 3, 'color','r');
            end

            hold off;
            axis([-50 50 -50 50]);
            
            % speed
            subplot(2, 2, 2);
            if key_pressed_mode
                % speed
                plot(all_t, all_v, 'color', 'b');
                xlabel('Steps')
                ylabel('Speed (km/s)')
            end
            
            if key_pressed_mode == false
                % accelerate
                plot(all_t, all_a, 'color', 'k');
                xlabel('Steps')
                ylabel('Acceleration (km/s2)')
            end

            subplot(2, 2, 4);
            if key_pressed_mode
                % distance
                plot(all_t, all_p, 'color', 'r');
                xlabel('Steps')
                ylabel('Distance (km)') 
            end
            
            if key_pressed_mode == false
                % speed
                plot(all_t, all_v, 'color', 'b');
                xlabel('Steps')
                ylabel('Speed (km/s)')
            end
        
        
        pause(0.05)
        
        if(key_pressed_stop == 0)
            F = (-1) .* (p / norm(p)) .* ((m * M) ./ (p * p.'));
            a = F/m - h .* (v * v.') .* (v / norm(v)) - d .* v .* exp((-2.5) * cos(4 .* t));
            v = v + a .* dt;
            p = p + v .* dt;
            t = t + dt;
            all_t = [all_t, t];
            p_all_x = [p_all_x, p(1)];
            p_all_y = [p_all_y, p(2)];
            all_v = [all_v, sqrt((v(1) ^2) + (v(2) ^ 2))];
            all_p = [all_p, sqrt((p(1) ^2) + (p(2) ^ 2))];
            all_a = [all_a, sqrt((a(1) ^2) + (a(2) ^ 2))];
        else
           continue; 
        end
    end
end

function keyboard(src, event)
    disp(event.Key);
    
    global key_pressed_quit;
%     global key_pressed_enter;
    global key_pressed_mode;
    global key_pressed_stop;



    switch(event.Key) 
        case 'q'
            key_pressed_quit = 1;
        case 's'
            key_pressed_stop = ~key_pressed_stop;
        case 'space'
            key_pressed_mode = ~key_pressed_mode;
        otherwise
            
    end
end
