%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: 2
% Problem number: 5
% Student Name:  劉子齊 Jonathan
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science, NYCU
% Date: 2021/03/15
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clf; clear; clc;		% clear the current figure
                        % clear variables, and clear screen

fprintf('Student ID:0716304 Name:劉子齊 Jonathan\n'); % show student id and name                        
                        
disp('Problem 2.5') 	% show Problem 2.5

t0 = 0; v0 = 0; k0 = 0.5; g = -9.81; p0 = 10;
dt = 1/30;

figure
hold on

p = p0; v = v0; t = t0;
M = []; T = []; 

while t <= 10
    v = v + g * dt;
    p = p + k * v * dt;
    T = [T, t]; % expand T when necessary. This is slow.
    M = [M, p]; % expand M when necessary. This is slow.
    
    t = t + dt;
end
plot(T, M)
