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

t0 = 0; v0 = 0; k = 0.5; g = -9.81; p0 = 10;
dt = 1/30;

hold on

p = p0; v = v0; t = t0;
T = []; P = []; V = [];

while t <= 10
    v = v + g * dt;
    p = p + k * v * dt;
    
    if p < 0
        p = 0;
        v = -0.9 * v;
    end
    
    T = [T, t];
    P = [P, p];
    V = [V, v];
    
    t = t + dt
end

figure(1), plot(T, V), xlim([0 12]);
figure(2), plot(T, P), xlim([0 12]);
