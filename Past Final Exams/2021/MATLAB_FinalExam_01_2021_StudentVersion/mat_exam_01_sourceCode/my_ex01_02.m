%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: Lab
% Problem number: �
% Student Name:  �
% Student ID: �
% Email address: �
% Department: Computer Science, NCTU
% Date: �.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Align the lines
% Select all and then press CONTROL-I
%
% close all windows
% clear variables, and clear screen
close all; clf; clear; clc;

% show Lab
disp('Final Exam Problem 1.2');
disp('Student Name; Student ID');


global key_pressed_op_1;
global key_pressed_op_2;
global key_pressed_op_3;
global key_pressed_op_4;
global key_pressed_quit; % 'q'
global key_press_return; % 'm'
global key_press_stop; % 's'

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Align the lines
% Select all (CONTROL-A) and then press CONTROL-I
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

op = 0;

key_press_stop = false;
key_press_return = false;
key_pressed_op_1 = false;
key_pressed_op_2 = false;
key_pressed_op_3 = false;
key_pressed_op_4 = false;
key_pressed_quit = false;

h_fig = figure;

input('Press ENTER to start.');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I = imread('tmp.png');
I = imresize(I, [480 480]);
I = im2double(I);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig,'KeyPressFcn', @m_KeyCallBack_system); % callback function
figure(h_fig);

mainmsg = ["Key Usage:"
           "Key 1: Curve drawing                         "
           "Key 2: Tracing a point in a Polar plot       "
           "Key 3: Curve Morphing                        "
           "Key 4: Moving Spotlight                      "
           "Key m: Return to the main menu immediately   "
           "Key q: Quit the program when in the main menu"];
       
title_1 = ["Curve drawing"
            "Press s to stop"];
       
while true
    
    title(mainmsg);
    pause(0.03);
    
    if ( key_pressed_op_1 )
        disp("hello")
        key_pressed_op_1 = false;
        op = 1;
    end
    if ( key_pressed_op_2 )
        key_pressed_op_2 = false;
        op = 2;
    end
    if ( key_pressed_op_3 )
        key_pressed_op_3 = false;
        op = 3;
    end
    if ( key_pressed_op_4 )
        key_pressed_op_4 = false;
        op = 4;
    end
    
    if ( key_pressed_quit )
        key_pressed_quit = false;
        close all; % close all the figure windows
        disp('Student ID:12345678');
        disp('Thanks for playing!');
        return;    % quit the program
    end
    
    if (op == 1)
        %initialize parameters and so on
        %before entering the animation loop
        t = 1;
        x = [-4:0.01:4];
        y = 5.*sin(x) .* cos(exp(x)) + 3.*sin(2.*x) + sin(x);
       
        while t < 801
            plot(x(1:t), y(1:t), 'linewidth', 3);
            title(title_1)
            hold on;
            axis([-4 4 -9 9])
            pause(0.033);
            
            if(key_press_stop)
                key_press_stop = false;
                break;
            else
                t = t + 10;
            end
            
            if (key_press_return)
                key_press_return = false;
                break;
            end
            
        end % while
    end % if op ==1
    
    if(op == 2)
        %initialize parameters and so on
        %before entering the animation loop
        t = 1;
        theta = [0 : 0.01 : 2*pi];
        r = 1 - cos(4.*theta) .* sin(4.*theta);
        

        while t < 629
            
            pass = polar(theta, r);
            patch(get(pass,'XData'), get(pass,'YData'), 'y')
            title(title_1)
            hold on;
            polar(theta(t), r(t), '*');
            hold off;
            pause(0.033);
            
            if(key_press_stop)
                key_press_stop = false;
                break;
            else
                t = t + 5;
            end
            
            if (key_press_return)
                key_press_return = false;
                break;
            end
            
        end % while
    end % if op == 2
    
    if(op == 3)
        %initialize parameters and so on
        %before entering the animation loop
        
        x = [-10 : 0.01 : 10];
        y1 = sin(5.*x) + 5;
        y2 = 2.*cos(x.^2) - 5;
        z1 = x.*sin(x./2) + 5;
        z2 = 2.*cos(x.^2) ./ (sin(x)+1.5) - 1;
        
        k = 1;
        
        while k >= 0
            
            subplot(1, 2, 1);
            y = k .* y1 + (1-k) .* y2;
            plot(x, y, 'linewidth', 3);
            hold on;
            title(title_1)
            plot(x, y1, 'linewidth', 3);
            plot(x, y2, 'linewidth', 3);
            hold off;
            
            subplot(1, 2, 2);
            z = k .* z1 + (1-k) .* z2;
            plot(x, z, 'linewidth', 3);
            hold on;
            plot(x, z1, 'linewidth', 3);
            plot(x, z2, 'linewidth', 3);
            hold off;
            
            pause(0.05)
            figure(2);
            
            if(key_press_stop)
                key_press_stop = false;
                break;
            else
                k = k - 0.01;
            end
            
            if (key_press_return)
                key_press_return = false;
                break;
            end
            
        end
    end % if op == 3
    
    if(op == 4)
        %initialize parameters and so on
        %before entering the animation loop
        
        imgsize = size(I);
        xmax = imgsize(1);
        ymax = imgsize(2);
        
        r1 = xmax / 2;
        r2 = xmax / 4;
        count = 0;
        centx = 0;
        centy = 0;
        
        image2 = I;
        
        while true
            title("Moving Spotliht... Press s to stop...")
            
            image2 = I;
            
            for x = [1 : xmax]
                for y = [1 : ymax]
                    x_dis2 = (x - centx) ^ 2;
                    y_dis2 = (y - centy) ^ 2;
                    distance = sqrt(x_dis2 + y_dis2);
                    if distance < r1
                        image2(y, x, 2) = I(y, x, 2) * 2;
                        image2(y, x, 3) = I(y, x, 3) * 2;
                    end
                    if distance < r2
                        image2(y, x, :) = I(y, x, :) * 2;
                    end
                end
            end
            
            
            imshow(image2)
            title("Moving Spotliht... Press s to stop...")
            pause(0.003)
            
            if(count == 0)
                centx = 0;
                centy = centy + 20;
                if(centy == ymax)
                    count = count + 1;
                end
            elseif(count == 1)
                centx = centx + 20;
                centy = xmax;
                if(centx == xmax)
                    count = count + 1;
                end
            elseif(count == 2)
                centx = xmax;
                centy = centy - 20;
                if(centy == 0)
                    count = count + 1;
                end
            elseif(count == 3)
                centx = centx - 20;
                centy = 0;
                if(centx == 0)
                    break
                end
            end
            
            if(key_press_stop)
                key_press_stop = false;
                break;
            end

            if (key_press_return)
                key_press_return = false;
                break;
            end
        end
    end % if op == 4
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Add your own stuff here if you want
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % BEGIN: Do not modify the following code fragment
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    while true
        
        if (op == 0)
            break;
        end
        
        title('Press m to return to main menu...');
        pause(0.03);
        if (key_press_return)
            key_press_return = false;
            op = 0;
            clf;
            break;
        end
        
    end
    
    if(key_pressed_quit)
        key_pressed_quit = false;
        return;
    end
    
    hold off
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % END: Do not modify the above code fragment
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end % while


