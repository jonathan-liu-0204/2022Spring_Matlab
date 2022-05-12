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
    switch(event.Key) 
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