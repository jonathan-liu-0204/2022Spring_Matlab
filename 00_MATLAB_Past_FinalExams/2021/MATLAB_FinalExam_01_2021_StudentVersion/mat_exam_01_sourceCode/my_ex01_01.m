%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: �
% Problem number: �
% Student Name:  �
% Student ID: �
% Email address: �
% Department:
% Date: �.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Align the lines
% Select all and then press CONTROL-I
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear; clc;		% close all windows
% clear variables, and clear screen

disp('Final Exam Problem 1.1') 	% show Final Exam Problem 1.1

disp('Student Name; Student ID');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Align the lines
% Select all (CONTROL-A) and then press CONTROL-I
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

h_fig = figure;

global key_w_dec;
global key_w_inc;
global key_u_dec;
global key_u_inc;
global key_pressed_quit;

key_w_dec = false;
key_w_inc = false;
key_u_dec = false;
key_u_inc = false;
key_pressed_quit = false;
% set(h_fig,'KeyPressFcn',@m_KeyCallBack_curve); % callback function

u = 0.1;
w = 1;
% x = [-10 : 0.01 : 10];
% z1 = cos(x) .* exp((-w).*sin(x)) +  w.*sin(x);
% z2 = (x.^2 - 4.*w.*x - 5.*w.^2) .* (abs(sin(2.*u.*x)) + u);
% y = (z1 .* cos(z2)) ./ z2;

while true
    
    set(h_fig,'KeyPressFcn',@m_KeyCallBack_curve); % callback function
    
    if (key_w_dec)
        key_w_dec = false;
        if ((w - 0.05) > 0)
            w = w - 0.05;
        else
            w = 0;
        end
    end
    
    if (key_w_inc)
        key_w_inc = false;
        w = w + 0.05;  
    end
    
    if (key_u_dec)
        key_u_dec = false;
        if ((u-0.025) > 0.1)
            u = u - 0.025;
        else
            u = 0.1;
        end
    end
    
    if (key_u_inc)
        key_u_inc = false;
        u = u + 0.025;    
    end
    
    if (key_pressed_quit)
        key_pressed_quit = false;
        disp('Student ID: 12345678');
        close all; clear; clc;
        return;
    end
    
    x = [-10 : 0.01 : 10];
    z1 = cos(x) .* exp((-w).*sin(x)) +  w.*sin(x);
    z2 = (x.^2 - 4.*w.*x - 5.*w.^2) .* (abs(sin(2.*u.*x)) + u);
    y = (z1 .* cos(z2)) ./ z2;
    
    x1 = [-10 : 0.01 : -w];
    z11 = cos(x1) .* exp((-w).*sin(x1)) +  w.*sin(x1);
    z21 = (x1.^2 - 4.*w.*x1 - 5.*w.^2) .* (abs(sin(2.*u.*x1)) + u);
    y1 = (z11 .* cos(z21)) ./ z21;
    
    x2 = [-w : 0.01 : 5*w];
    z12 = cos(x2) .* exp((-w).*sin(x2)) +  w.*sin(x2);
    z22 = (x2.^2 - 4.*w.*x2 - 5.*w.^2) .* (abs(sin(2.*u.*x2)) + u);
    y2 = (z12 .* cos(z22)) ./ z22;
    
    x3 = [5*w : 0.01 : 10];
    z13 = cos(x3) .* exp((-w).*sin(x3)) +  w.*sin(x3);
    z23 = (x3.^2 - 4.*w.*x3 - 5.*w.^2) .* (abs(sin(2.*u.*x3)) + u);
    y3 = (z13 .* cos(z23)) ./ z23;
    
    formatSpec = '%.3f';
    
    plot(x1, y1, 'linewidth', 3);
    title(['w = ',num2str(w, formatSpec),' u = ',num2str(u, formatSpec)])
    axis([-10 10 -1.5 1.5])
    hold on;
    plot(x2, y2, 'linewidth', 3);
    plot(x3, y3, 'linewidth', 3);
    pause(0.033);
    hold off;
%     title(['w = ',num2str(w),' u = ',num2str(u)])
    
    figure(1)
end
