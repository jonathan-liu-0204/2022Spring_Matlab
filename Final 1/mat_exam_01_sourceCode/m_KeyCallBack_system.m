%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: Final
% Problem number: 2
% Student Name:  �B�l��
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department:Computer Science
% National Yang Ming Chiao Tung University, Taiwan
% Date: 2022.06.02
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This callback function is invoked from MATLAB once 
% we register it to our application.
%
% When a key is pressed, this function is invoked.
% Thus, we have a chance to set our variables
% based on the keys that are pressed.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DO NOT modify this file 
% except that you are told to do so.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function m_KeyCallBack_system(src,event)
    disp(event.Key);
global key_pressed_op_1;
global key_pressed_op_2;
global key_pressed_op_3;
global key_pressed_op_4;
global key_pressed_quit;
global key_press_return;
global key_press_stop;
    
    switch(event.Key) 
        case 's'
            key_press_stop = true
        case 'm'
            key_press_return = true;
        case '1'
            key_pressed_op_1 = true;
        case '2'
            key_pressed_op_2 = true;
        case '3'
            key_pressed_op_3 = true;
        case '4'
            key_pressed_op_4 = true;
        case 'q'
            key_pressed_quit = true;
        otherwise
            
    end
    
 end