%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: 2
% Problem number: Example
% Student Name:  ...
% Student ID: ...
% Email address: ...
% Department: ...
% Date: ...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clf; clear; clc;
fprintf('Student ID:.. Name:..\n');

x = -10:0.05:10;
while 1
	coef = input('Please input the coefficients [a,b]:');
	if coef(1) == 0 
	   fprintf('Thanks for playering.\n');
	   break
    end
    a = coef(1); b = coef(2);
	y = a .*x + b;
	plot(x,y);
	hold on;
end
