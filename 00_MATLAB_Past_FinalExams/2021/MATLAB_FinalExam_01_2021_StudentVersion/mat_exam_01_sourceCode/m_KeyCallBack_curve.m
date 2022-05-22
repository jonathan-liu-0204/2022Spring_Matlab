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
function m_KeyCallBack_curve(src,event)
    disp(event.Key);
global key_w_dec;
global key_w_inc;
global key_u_dec;
global key_u_inc;
global key_pressed_quit;

    
    switch(event.Key) 
        case 'n'
            key_w_dec = true;
        case 'm'
            key_w_inc = true;
        case 'j'
            key_u_dec = true;
        case 'k'
            key_u_inc = true;
        case 'q'
            key_pressed_quit = true;
        otherwise
            
    end
    
    
 end