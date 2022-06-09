%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Final Exam Number: 2
% Problem number: 3
% Student Name: 劉子齊
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science
% Date: 2022.06.09
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear;

disp('Final Exam Problem 2.3') 	% show Final Exam Problem 1.1
disp('劉子齊; 0716304');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Planet
clear; clc; close all
fig_h = figure;
global key_pressed_quit;
global key_pressed_mode;
global key_pressed_enter;
global key_pressed_stop;
global key_pressed_inc_N;
global key_pressed_inc_m;


set(fig_h,'KeyPressFcn',...
    @m_KeyCallBack_planet); % callback function

disp('Press ENTER to start...');
while true
    if (key_pressed_enter)
        break;
    end
    pause(0.03);
end

figure(fig_h);

%%%%%%%%%%%%%%%%%%%
while true
    total_distance = 0;
    average_speed = 0;
    
    m = 0.5;
    M = 3500;
    t0 = 0;
    tmax = 50;
    dt = 0.2;   % time step size
    t = t0;
    v = [8 0.3];
    p = [2 50];
    i = 0;      % step counter
    d = 0.02;
    h = 0.005;
    q = p;
    
    j = 0;
    J = [ ];
    
    k = 0;
    K = [ ];
    D = [ ];    % array: distance to origin
    Sd = [ ];   % array: speed
    
    clf
    
    
    N = 1;  % number of recent points to be drawn
    
    while t <= tmax
        
        %    if (key_pressed_reset)
        %        break;
        %    end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        subplot(1, 2, 1);
        plot([1:50], 25-[1:50]);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        subplot(2, 2, 2);
        plot([1:50], [1:50].^1.5);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        subplot(2, 2, 4);
        plot([1:50], 50-[1:50].^1.5);
        if (key_pressed_quit)
            close all;
            disp('劉子齊; 0716304');
            return;
        end
        
        if (key_pressed_inc_N)
            N = N + 1;
            key_pressed_inc_N = false;
        end
        
        if (key_pressed_inc_m)
            M = M + 100;
            key_pressed_inc_m = false;
        end
        
        pause(0.033);
        
    end
    
end %while

