%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: Lab01
% Problem number: 5
% Student Name: 劉子齊 Jonathan
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science, NYCU
% Date: 2022.04.28
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clf; clear; clc;		% clear the current figure
				% clear variables, and clear screen

disp("Lab Problem 1.5") 	% show Lab Problem 1.5

while 1
   
    d = input("Please input 'd' in [0, 1]: ");
    
    if d < 0
        disp("Terminated")
        return;
    elseif d > 1
        disp("Please input valid input between 0 and 1.")
        continue;
    else
       clf;
       v = [0 8];
       p = [50 0];
       m = 1;
       M = 10000;
       dt = 0.05;
       
       for t = [0 : dt : 100]
            
           F = (-1) * (p / norm(p)) .* ((m * M) / (p * p.'));
           a = F / m - d * v;
           v = v + a * dt;
           p = p + v * dt;
           
           plot(p(1), p(2), '.');
           hold on;
       end
       figure(1);
    end
end