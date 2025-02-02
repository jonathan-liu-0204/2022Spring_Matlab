%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: 2
% Problem number: 2
% Student Name:  劉子齊 Jonathan
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science, NYCU
% Date: 2021/03/15
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clf; clear; clc;		% clear the current figure
                        % clear variables, and clear screen

fprintf('Student ID:0716304 Name:劉子齊 Jonathan\n'); % show student id and name
                        
disp('Problem 2.2') 	% show Problem 2.2

x = [-10:0.05:10];

while 1
    keyin = input('Please input the range of "a" [aMin, bMin]:');
    aMin = keyin(1);
    aMax = keyin(2);
    
    keyin2 = input('Please input the step size of "a" (da):');
    da = keyin2(1);
    
    if da == 0
       fprintf('Thanks for playering.\n');
	   return
    end
    
    clf; % Clear all curves in the current figure.

    a = [aMin : da : aMax];
    
    for aa = a
        y = tanh(aa .* x) .* exp(-cos(x));
        plot(x, y, 'linewidth', 2);
        hold on
    end
end
