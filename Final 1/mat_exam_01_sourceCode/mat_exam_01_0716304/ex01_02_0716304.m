%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: Final
% Problem number: 2
% Student Name:  劉子齊
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department:Computer Science
% National Yang Ming Chiao Tung University, Taiwan
% Date: 2022.06.02
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% close all windows
% clear variables, and clear screen
close all; clf; clear; clc;

% show Lab
disp('Final Exam Problem 1.2') 	% show Final Exam Problem 1.2

global key_pressed_op_1;        % '1'
global key_pressed_op_2;        % '2'
global key_pressed_op_3;        % '3'
global key_pressed_op_4;        % '4'
global key_pressed_quit;        % 'q'
global key_press_return;        % 'm'
global key_press_stop;          % 's'

key_press_stop = false;
key_press_return = false;
key_pressed_op_1 = false;
key_pressed_op_2 = false;
key_pressed_op_3 = false;
key_pressed_op_4 = false;
key_pressed_quit = false;

%global h_fig;

A1 = [0:0.05:pi*2];
S1 = size(A1,2);
h_fig = figure;

set(h_fig,'KeyPressFcn', @m_KeyCallBack_system); % callback function


%input('Press ENTER to start.');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(h_fig);      % USE h_fig to plot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

a = zeros(size(A1));
r = zeros(size(A1));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I = imread('tmp.png');
I = imresize(I, [320 320]);
I = im2double(I);
Ix = 640;
Iy = 640;
I1 = imresize(I,[Ix Iy]);
I0 = I1;
wd = Ix;
he = Iy;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



mainmsg = ["Key Usage:"
           "Key 1: Curve erasing"
           "Key 2: Image Masks"
           "Key 3: Region filling"
           "Key 4: Moving Spotlight"
           "Key m: Return to the main menu immediately"
           "Key q: Quit the program when in the main menu"];

key_press_stop = false;
key_press_return = false;
key_pressed_op_1 = false;
key_pressed_op_2 = false;
key_pressed_op_3 = false;
key_pressed_op_4 = false;
key_pressed_quit = false;

image_option = 1;
filling_region_mode = 0;

while true
    key_press_stop = false;
    key_press_return = false;
    key_pressed_op_1 = false;
    key_pressed_op_2 = false;
    key_pressed_op_3 = false;
    key_pressed_op_4 = false;
    key_pressed_quit = false;
    
    op = 0;
    figure(h_fig);
    key_press_stop = false;
    key_press_return = false;
    
    title(mainmsg);
    pause(0.03);
    if ( key_pressed_op_1 )
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
        close all;
        disp('Student Name: 劉子齊');
        disp('Student ID: 0716304');
        disp('Thanks for playing!');
        return;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if ( op == 1 )
        
        x = [-5 : 0.1 : 5];
        y = (exp(x)-exp(-x)) ./ (exp(x)+exp(-x)) + 0.01 .* sin(3.*x) ./ (1+x.^2) + 0.05 .* cos(15.*x);
        t = 1;
        f = 0;
        R0 = 1; R1 = 0;
        G0 = 0; G1 = 0;
        B0 = 0; B1 = 1;
        
        msg1 = ["Curve erasing..."
                  "Press s to stop"];
        
        while t < 101
            
            f = t / 101;
            r = (1-f) * R0 + f * R1;  
            g = (1-f) * G0 + f * G1; 
            b = (1-f) * B0 + f * B1;
            
            plot(x(t:101), y(t:101), 'color', [r g b], 'linewidth', 3);
            title(msg1);
            axis([-5 5 -1.5 1.5]);

            if(key_press_stop)
                key_press_stop = false;
                break;
            else
                t = t + 1;
            end
            
            if (key_press_return)
                clf;
                key_press_return = false;
                op = 0;
                break;
            end
            
            pause(0.02);
        end
    end % op == 1
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    if (op ==2)
        
        s = size(I);
        w = s(2);
        h = s(1);
        K0 = ones(size(I), 'double');
        
       if(image_option == 1)
            % horizontal
            K = hori_mask(K0, w);
            imshow(I.*K)
            image_option = 2;
        elseif(image_option == 2)
            % vertical
            K = vert_mask(K0, h);
            imshow(I.*K)
            image_option = 1;
       end
       pause(0.02);
    end % if op ==2
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
    if (op==3)
        
        msg3 = ["Region filling..."
                  "Press s to stop"];
        
        X = 0 : 0.01 : (pi * 2);
        x = zeros(size(X));
        r = zeros(size(X));
        i = 1;
        x0 = 0;
        r0 = 0;
        clf;
        
        if(filling_region_mode == 0)
            % mode 0
            while x0 <= (2*pi)
                if(key_press_stop)
                    key_press_stop = false;
                    break;
                else
                    clf
                    r0 = 2 .* sin(x0) .* cos(2*x0);
                    x(i) = x0;
                    r(i) = r0;
                    pass = polar(x(1:i), r(1:i));
                    patch(get(pass,'XData'), get(pass,'YData'), 'y')
                    title(msg3)
                    hold on;
                    x0 = x0 + 0.05;
                    i = i + 1;
                end

                if (key_press_return)
                    clf;
                    key_press_return = false;
                    op = 0;
                    break;
                end

                pause(0.01);
            end
        else
            % mode 1
            while x0 <= (2*pi)
                
                if(key_press_stop)
                    key_press_stop = false;
                    break;
                else
                    clf
                    r0 = sin(4.*x0) .* cos(x0) ./ 2;
                    x(i) = x0;
                    r(i) = r0;
                    pass = polar(x(1:i), r(1:i));
                    patch(get(pass,'XData'), get(pass,'YData'), 'y')
                    title(msg3)
                    hold on;
                    x0 = x0 + 0.05;
                    i = i + 1;
                end

                if (key_press_return)
                    clf;
                    key_press_return = false;
                    op = 0;
                    break;
                end
                pause(0.01);
            end
        end
        
        filling_region_mode = 1 - filling_region_mode;

%         if(filling_region_mode == 1)
%             filling_region_mode = 0;
%         else
%             filling_region_mode = 1;
%         end
    end % op ==3
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    if (op==4)
        
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
            imshow(image2)
            title("Moving Spotliht... Press s to stop...")
            pause(0.003)
            
            image2 = I;
            
            for x = [1 : xmax]
                for y = [1 : ymax]
                    x_dis2 = (x - centx) ^ 2;
                    y_dis2 = (y - centy) ^ 2;
                    distance = sqrt(x_dis2 + y_dis2);
                    if distance < r1
                        image2(y, x, 1) = I(y, x, 1) * 2;
                        image2(y, x, 2) = I(y, x, 2) * 2;
                    end
                    if distance < r2
                        image2(y, x, :) = I(y, x, :) * 2;
                    end
                end
            end
            
            if(count == 0)
                centx = centx + 20;
                centy = 0;
                if(centx == xmax)
                    count = count + 1;
                end
            elseif(count == 1)
                centx = xmax;
                centy = centy + 20;
                if(centy == ymax)
                    count = count + 1;
                end
            elseif(count == 2)
                centx = centx - 20;
                centy = ymax;
                if(centx == 0)
                    count = count + 1;
                end
            elseif(count == 3)
                centx = 0;
                centy = centy - 20;
                if(centy == 0)
                    break
                end
            end
            
            if(key_press_stop)
                key_press_stop = false;
                break;
            end

            if (key_press_return)
                op = 0;
                clf;
                key_press_return = false;
                break;
            end
        end
    end % if op == 4
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    while true 
        if (op==0)
            break;
        end
        
        title('Press m to return to main menu...');
        pause(0.03);
        if (key_press_return)
            clf
            break;
        end
    end
    hold off
end % while
hold off;

function K = hori_mask(Kin, width)
    K = Kin;
    for i = [1 : 1 : width]
        f = abs(cos(i / width * 4 * pi));
        K(:, i, 1:3) = f;
    end
end

function K = vert_mask(Kin, high)
    for i = [1 : 1 : high]
        f = abs(cos(i / high * 4 * pi));
        Kin(i, :, 1:3) = f;
    end
    K = Kin;
end





