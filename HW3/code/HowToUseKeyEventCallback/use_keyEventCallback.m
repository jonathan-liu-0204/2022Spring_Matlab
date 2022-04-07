%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: …
% Problem number: …
% Student Name:  …
% Student ID: …
% Email address: …
% Department:
% Date: ….
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Align the lines
% Select all and then press CONTROL-I
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear; clc;		% close all windows
% clear variables, and clear screen

disp('How to use a callback function') 	% 

disp('Student Name; Student ID');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Align the lines
% Select all (CONTROL-A) and then press CONTROL-I
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global key_pressed_op_1;
global key_pressed_op_2;
global key_pressed_op_3;
global key_pressed_quit;

key_pressed_op_1 = false;
key_pressed_op_2 = false;
key_pressed_op_3 = false;
key_pressed_quit = false;

h_fig = figure;

set(h_fig,'KeyPressFcn',...
    @m_KeyCallBack_image); % callback function


b0 = 15;

while true
    if (key_pressed_quit)
        disp('Quit the program');
        return; % quit 
        
    end
    
    if (key_pressed_op_1)
        key_pressed_op_1 = false;
        b0 = b0 + 10;
        
    end
    
    if (key_pressed_op_2)
        key_pressed_op_2 = false;
        b0 = b0 - 10;
        
    end
    pause( 0.033);
    
end
