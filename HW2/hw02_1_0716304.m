%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: 2
% Problem number: 1
% Student Name:  劉子齊 Jonathan
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science, NYCU
% Date: 2021/03/15
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clf; clear; clc;		% clear the current figure
                        % clear variables, and clear screen
                        
fprintf('Student ID:0716304 Name:劉子齊 Jonathan\n'); % show student id and name

disp('Problem 2.1') 	% show Problem 2.1

x = [-10 : 0.05 : 10];

while 1
    keyin = input('Please input the coefficients [A, B]:');
    A = keyin(1);
    B = keyin(2);
    
    if A == 0 
	   fprintf('Thanks for playering.\n');
	   return
    elseif B == 0
       fprintf('Thanks for playering.\n');
	   return
    end
    
    a = [(A-10) : 2 : (A+10)];
    b = [(B-10) : 2 : (B+10)];
    
    for aa = a
       for bb = b
            y = aa .* sin(x) + bb .* tan(x ./ 10);
            plot(x, y);
            hold on
       end
    end
end