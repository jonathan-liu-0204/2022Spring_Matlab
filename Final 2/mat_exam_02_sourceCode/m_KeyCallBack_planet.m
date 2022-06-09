%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Final Exam Number: 2
% Problem number: 3
% Student Name: ¼B¤l»ô
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science
% Date: 2022.06.09
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
function m_KeyCallBack_planet(src,event)
    disp(event.Key);
    global key_pressed_quit;
    global key_pressed_enter;
    global key_pressed_mode;
     global key_pressed_stop;
     global key_pressed_inc_N;
     global key_pressed_inc_m;

    switch(event.Key) 
        case 'm'
            key_pressed_inc_m = true;
        case 'k'
            key_pressed_inc_N = true;
        case 'return'
            key_pressed_enter = true;
        case 'q'
            key_pressed_quit = true;
        case 's'
            key_pressed_stop = ~key_pressed_stop;
        case 'space'
            disp('here');
            key_pressed_mode = ~key_pressed_mode;
        otherwise
            
    end
    
 end