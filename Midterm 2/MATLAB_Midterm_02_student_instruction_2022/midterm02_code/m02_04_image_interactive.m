%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: …
% Problem number: …
% Student Name:  …
% Student ID: …
% Email address: …
% Department:
% Date: ….
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
global key_pressed_grid;
global key_pressed_gray;
global key_pressed_reset;
global key_pressed_quit;
global key_pressed_brightenUp;

%
%These boolean variables are set properly 
%inside the callback function.
%
key_pressed_left = false;
key_pressed_right = false;
key_pressed_grid = false;
key_pressed_gray = false;
key_pressed_quit = false;
key_pressed_brightenUp = false;
key_pressed_reset = false;

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

disp('j) Enhance green and blue component from left to right');

input('Press ENTER to start');
figure(h_fig);

imode = 2;      % brigthen up (2) or not (1)
dshift = 80;    % number of pixels for shifting
Itmp = I0;
while true
    op = 0;
    
    pause(0.03333);
end

















