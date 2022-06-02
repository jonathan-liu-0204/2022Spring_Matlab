%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: Final
% Problem number: 1
% Student Name:  ¼B¤l»ô
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department:Computer Science
% National Yang Ming Chiao Tung University, Taiwan
% Date: 2022.06.02
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

disp('¼B¤l»ô; 0716304');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Align the lines
% Select all (CONTROL-A) and then press CONTROL-I
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

h_fig = figure;

global key_w_dec;           % 'n'
global key_w_inc;           % 'm'
global key_u_dec;           % 'j'
global key_u_inc;           % 'k'
global key_pressed_quit;    % 'q'

key_w_dec = false;
key_w_inc = false;
key_u_dec = false;
key_u_inc = false;
key_pressed_quit = false;
set(h_fig,'KeyPressFcn', @m_KeyCallBack_curve); % callback function

u = 0.1;
w = -2;
formatSpec = '%.3f';

% x = [-6 : 0.01 : 6];
% z1 = exp((-w) .* cos(x./4)) +  u .* (1+w*w) .* cos(x);
% z2 =(x-w) .* (x-w*w) .* (cos(x./4) .* sin(x./4) + 1);
% y = (sin(x) .* z1 .* sin(z2+0.05)) ./ z2;

while true
    
    if (key_w_dec)
        key_w_dec = false;
        if((w - 0.125) < -2)
            w = -2;
        else
            w = w - 0.125;
        end
    end
    
    if (key_w_inc)
        key_w_inc = false;
        if((w + 0.125) > 2)
            w = 2;
        else
            w = w + 0.125;
        end
    end
    
    if (key_u_dec)
        key_u_dec = false;
        if((u - 0.125) < 0)
            u = 0;
        else
            u = u - 0.125;
        end
    end
    
    if (key_u_inc)
        key_u_inc = false;
        if((u + 0.125) > 3)
            u = 3;
        else
            u = u + 0.125;
        end
    end
    
    if (key_pressed_quit)
        key_pressed_quit = false;
        disp('Student Name: ¼B¤l»ô');
        disp('Student ID: 0716304');
        close all;		% close all windows
        return;                         % quit the program
    end
    
    if(w < 0)
        x1 = [-6 : 0.001 : w];
        z11 = exp((-w) .* cos(x1./4)) +  u .* (1+w*w) .* cos(x1);
        z21 =(x1-w) .* (x1-w*w) .* (cos(x1./4) .* sin(x1./4) + 1);
        y1 = (sin(x1) .* z11 .* sin(z21+0.05)) ./ z21;
        
        x2 = [w : 0.001 : w^2];
        z12 = exp((-w) .* cos(x2./4)) +  u .* (1+w*w) .* cos(x2);
        z22 =(x2-w) .* (x2-w*w) .* (cos(x2./4) .* sin(x2./4) + 1);
        y2 = (sin(x2) .* z12 .* sin(z22+0.05)) ./ z22;
        
        x3 = [w^2 : 0.001 : 6];
        z13 = exp((-w) .* cos(x3./4)) +  u .* (1+w*w) .* cos(x3);
        z23 =(x3-w) .* (x3-w*w) .* (cos(x3./4) .* sin(x3./4) + 1);
        y3 = (sin(x3) .* z13 .* sin(z23+0.05)) ./ z23;
        
        plot(x1, y1, 'k', 'linewidth', 3);
        title(['w = ',num2str(w, formatSpec),' u = ',num2str(u, formatSpec)])
        axis([-6 6 -6 6])
        set(gca,'FontSize',20);
        hold on;
        plot(x2, y2, 'g', 'linewidth', 3);
        plot(x3, y3, 'r', 'linewidth', 3);
        hold off;
        
    elseif(w == 0)
        x1 = [-6 : 0.001 : w];
        z11 = exp((-w) .* cos(x1./4)) +  u .* (1+w*w) .* cos(x1);
        z21 =(x1-w) .* (x1-w*w) .* (cos(x1./4) .* sin(x1./4) + 1);
        y1 = (sin(x1) .* z11 .* sin(z21+0.05)) ./ z21;
        
        x2 = [w : 0.001 : 6];
        z12 = exp((-w) .* cos(x2./4)) +  u .* (1+w*w) .* cos(x2);
        z22 =(x2-w) .* (x2-w*w) .* (cos(x2./4) .* sin(x2./4) + 1);
        y2 = (sin(x2) .* z12 .* sin(z22+0.05)) ./ z22;
        
        plot(x1, y1, 'r', 'linewidth', 3);
        title(['w = ',num2str(w, formatSpec),' u = ',num2str(u, formatSpec)])
        axis([-6 6 -6 6])
        set(gca,'FontSize',20);
        hold on;
        plot(x2, y2, 'g', 'linewidth', 3);
        hold off;
        
    else
        if(and(w>0, w<1))
            x1 = [-6 : 0.001 : w^2];
            z11 = exp((-w) .* cos(x1./4)) +  u .* (1+w*w) .* cos(x1);
            z21 =(x1-w) .* (x1-w*w) .* (cos(x1./4) .* sin(x1./4) + 1);
            y1 = (sin(x1) .* z11 .* sin(z21+0.05)) ./ z21;

            x2 = [w^2 : 0.001 : w];
            z12 = exp((-w) .* cos(x2./4)) +  u .* (1+w*w) .* cos(x2);
            z22 =(x2-w) .* (x2-w*w) .* (cos(x2./4) .* sin(x2./4) + 1);
            y2 = (sin(x2) .* z12 .* sin(z22+0.05)) ./ z22;

            x3 = [w : 0.001 : 6];
            z13 = exp((-w) .* cos(x3./4)) +  u .* (1+w*w) .* cos(x3);
            z23 =(x3-w) .* (x3-w*w) .* (cos(x3./4) .* sin(x3./4) + 1);
            y3 = (sin(x3) .* z13 .* sin(z23+0.05)) ./ z23;

            plot(x1, y1, 'k', 'linewidth', 3);
            title(['w = ',num2str(w, formatSpec),' u = ',num2str(u, formatSpec)])
            axis([-6 6 -6 6])
            set(gca,'FontSize',20);
            hold on;
            plot(x2, y2, 'g', 'linewidth', 3);
            plot(x3, y3, 'r', 'linewidth', 3);
            hold off;
        
        elseif(w == 1)
            x1 = [-6 : 0.001 : w];
            z11 = exp((-w) .* cos(x1./4)) +  u .* (1+w*w) .* cos(x1);
            z21 =(x1-w) .* (x1-w*w) .* (cos(x1./4) .* sin(x1./4) + 1);
            y1 = (sin(x1) .* z11 .* sin(z21+0.05)) ./ z21;

            x2 = [w : 0.001 : 6];
            z12 = exp((-w) .* cos(x2./4)) +  u .* (1+w*w) .* cos(x2);
            z22 =(x2-w) .* (x2-w*w) .* (cos(x2./4) .* sin(x2./4) + 1);
            y2 = (sin(x2) .* z12 .* sin(z22+0.05)) ./ z22;

            plot(x1, y1, 'r', 'linewidth', 3);
            title(['w = ',num2str(w, formatSpec),' u = ',num2str(u, formatSpec)])
            axis([-6 6 -6 6])
            set(gca,'FontSize',20);
            hold on;
            plot(x2, y2, 'g', 'linewidth', 3);
            hold off;
            
        else
            x1 = [-6 : 0.001 : w];
            z11 = exp((-w) .* cos(x1./4)) +  u .* (1+w*w) .* cos(x1);
            z21 =(x1-w) .* (x1-w*w) .* (cos(x1./4) .* sin(x1./4) + 1);
            y1 = (sin(x1) .* z11 .* sin(z21+0.05)) ./ z21;

            x2 = [w : 0.001 : w^2];
            z12 = exp((-w) .* cos(x2./4)) +  u .* (1+w*w) .* cos(x2);
            z22 =(x2-w) .* (x2-w*w) .* (cos(x2./4) .* sin(x2./4) + 1);
            y2 = (sin(x2) .* z12 .* sin(z22+0.05)) ./ z22;

            x3 = [w^2 : 0.001 : 6];
            z13 = exp((-w) .* cos(x3./4)) +  u .* (1+w*w) .* cos(x3);
            z23 =(x3-w) .* (x3-w*w) .* (cos(x3./4) .* sin(x3./4) + 1);
            y3 = (sin(x3) .* z13 .* sin(z23+0.05)) ./ z23;

            plot(x1, y1, 'k', 'linewidth', 3);
            title(['w = ',num2str(w, formatSpec),' u = ',num2str(u, formatSpec)])
            axis([-6 6 -6 6])
            set(gca,'FontSize',20);
            hold on;
            plot(x2, y2, 'g', 'linewidth', 3);
            plot(x3, y3, 'r', 'linewidth', 3);
            hold off;
            
        end
    end
    
    pause( 0.033);
    
end
