%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: …
% Problem number: …
% Student Name:  …
% Student ID: …
% Email address: …
% Department:
% Date: …
% National Chiao Tung University, Taiwan
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all; clf;clear;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('Midterm Problem 2.x') 	% show Midterm Problem 2.x

disp('Student Name; Student ID');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% if the key value is true, the key is pressed.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global key_pressed_left;
global key_pressed_right;
global key_pressed_left_fast;
global key_pressed_right_fast;
global key_pressed_quit;
global key_pressed_brightenUp;

%
%These boolean variables are set properly 
%inside the callback function.
%
key_pressed_left = false;
key_pressed_right = false;
key_pressed_left_fast = false;
key_pressed_right_fast = false;
key_pressed_quit = false;
key_pressed_brightenUp = false;

h_fig = figure;     % figure handle
set(h_fig,'KeyPressFcn',...
    @m_KeyCallBack_image); % callback function

I = imread('tmp.png');
I = im2double(I);
I1 = imresize(I,[640 640]);
I0 = I1;
wd = 640;
he = 640;

imshow(I1);

disp('j) Shift the image to left by 10 pixels');
disp('k) Shift the image to right by 10 pixels');
disp('n) Shift the image to left by 40 pixels');
disp('m) Shift the image to right by 40 pxiels');
disp('b) Turn on or off a spot light');
disp('q) Quit the program');

input('Press ENTER to start');
figure(h_fig);

Itmp = I0;
while true
    op = 0;
    if key_pressed_left
        op = 1
        dshift = 10;
        key_pressed_left = false;
    end
    
    if key_pressed_right
        op = 2
        dshift = 10;
        key_pressed_right = false;
    end
    if key_pressed_left_fast
        op = 1
        dshift = 40;
        key_pressed_left_fast = false;
    end
    
    if key_pressed_right_fast
        op = 2
        dshift = 40;
        key_pressed_right_fast = false;
    end
    if key_pressed_quit
        key_pressed_quit = false;
        disp('Thanks for playing.');
        disp('My name is:xxx');
        disp('My student ID is:xxx');
        close all;
        return
    end
    
    if key_pressed_brightenUp
        op =  5
        key_pressed_brightenUp = false;
    end
    
    pause(0.03);
    if op == 0
        continue;
    end
    
    if (op==1)
        I1 = Itmp;
        dd = dshift;
        x0 = 1;
        I2 = I0;
        % The result is incorrect. You must modify it.
        while x0 < wd
            I2(:,1:(wd-dd),1:3) = I1(:, (1+dd):wd,1:3);
            
            imshow(I2);
            figure(h_fig);
            I1 = I2;
            x0 = x0 + dd;
            pause(0.033);
        end
    end
    
end


