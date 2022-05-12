%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: 1
% Problem number: 1
% Student Name:  ¼B¤l»ô
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science
% Date: 2022.04.11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear; clc;	% close all windows
                            % clear variables, and clear screen

disp('Midterm Problem 1.1') 	% show Midterm Problem 1.1

disp('¼B¤l»ô; 0716304;');

while 1
   keyin = input('Please input [a b], ex: if a = 1, b = 0.5, then must input [1 0.5]:');
   input_a = keyin(1);
   input_b = keyin(2);
   
   if(input_a == 0 && input_b == 0)
       disp("Thanks for playing");
       return;
   end
   
   bad_dx = 1;
   while bad_dx
       input_dx = input("Please input size of dx: ");
       dx = input_dx;
       if(dx == 0)
           dx = 0.25;
           bad_dx = 0;
       elseif(dx < 0)
           disp("dx must be a non-negative number.");
       else
           bad_dx = 0;
       end
   end
   
   x = [-1: dx: 1];
   y = input_a .* sin(5 .* x) .* cos((5 .* x) ./ (sin(x) + 2)) + cos(10 .* x) .* exp(-(abs(x .* x .* x) ./ (input_b .* input_b + 1)));

   plot(x, y, 'linewidth', 5, 'DefaultAxesFontSize', 30);
   hold on
end
