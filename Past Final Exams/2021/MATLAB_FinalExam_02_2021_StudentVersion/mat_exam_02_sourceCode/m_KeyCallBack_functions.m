%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: …
% Problem number: …
% Student Name:  …
% Student ID: …
% Email address: …
% Department:
% Date: …
% National Yang Ming Chiao Tung University, Taiwan
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This callback function is invoked from MATLAB once 
% we register it to our application.
%
% When a key is pressed, this function is invoked.
% Thus, we have a chance to set our variables
% based on the keys that are pressed.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function m_KeyCallBack_functions(src,event)
    disp(event.Key);
    global key_pressed_op_1;
    global key_pressed_op_2;
    global key_pressed_return;
global key_pressed_op_previous;
global key_pressed_op_next;
global key_pressed_quit;

    
    switch(event.Key) 
        case '1'
            key_pressed_op_1 = true;
        case '2'
            key_pressed_op_2 = true;    
        case 'r'
            key_pressed_return = true;
        case 'n'
            key_pressed_op_previous = true;
        case 'm'
            key_pressed_op_next = true;
        case 'q'
            key_pressed_quit = true;
        otherwise
            
    end
    
 end