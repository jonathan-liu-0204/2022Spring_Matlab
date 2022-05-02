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
        return;
    elseif d > 1
        continue;
    else
       clf;
       t = 0;
       
       T = [];
       A = [];
       V = [];
       P = [];
       F = [];
       
       v = 0;
       p = 50;
       
       while t <= 100
           M = 10000;
           m = 1;
            
           f = (-1) .* (p ./ norm(p)) .* ((m .* M) .* (p .^ 2));
           a = f .* m - d .* v;
           v = v + a .* 0.05;
           p = p + v .* 0.05;
           
           t = t + 0.05;
           
           T = [T, t];
           A = [A, a];
           V = [V, v];
           P = [P, p];
           F = [F, f];
       end
       
       plot(P, T);
    end
end