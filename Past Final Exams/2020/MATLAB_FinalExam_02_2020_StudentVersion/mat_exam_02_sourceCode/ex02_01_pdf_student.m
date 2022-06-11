%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: Lab
% Problem number: …
% Student Name:  …
% Student ID: …
% Email address: …
% Department: Computer Science, NCTU
% Date: ….
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% close all windows
% clear variables, and clear screen
close all; clf; clear; clc;

% show Lab
disp('Exam')

clear; syms x; syms y;
n = 1000000;
n = input('Input n in [0, 1000000]:');
if n==0
    return;
end
disp('Option 1) Show pdf of x for given a and b');
disp('Option 2) Show pdf of x for fixed sets of a and b');
option = input('Enter option:');

if option == 1
    a = input('Input a in [0.5, 1]:');
    b = input('Input b in [-1, -0.5] or [0.5, 1]:');
    
    return;
end

% This is option two
h_fig = figure
A = [0.5 1.0];
B = [-1 -0.5 0.25 0.75];
if option ==2
    for gi = 1:2
        for gj = 1:4
        end
    end
    
    figure(h_fig);  % put the figure on top
end