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
m = 0.5;
M = 3000;
t0 = 0;
t1 = 50;
dt = 0.2;
t = t0;
v = [7 0.2];
p= [ 0 45];
i = 0;
d = 0.015;
h = 0.001;
q = p;

j = 0;
J = [ ];

k = 0;
K = [ ];
D = [ ];
Sd = [ ];
Ad = [ ];
clf
fig_h = figure;
global key_pressed_quit;
global key_pressed_mode;
global key_pressed_enter;
global key_pressed_stop;
key_pressed_enter = false;
key_pressed_stop = false;
key_pressed_mode = true;
key_pressed_quit = false;
set(fig_h,'KeyPressFcn',...
    @m_KeyCallBack_planet); % callback function

while true

    if (key_pressed_quit)
        close all;
        disp('Student ID:');
        disp('Student Name:');
        return;
    end
    
    pause(0.033);
end