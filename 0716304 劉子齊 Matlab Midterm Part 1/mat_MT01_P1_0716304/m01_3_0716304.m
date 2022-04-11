%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: 1
% Problem number: 3
% Student Name:  ¼B¤l»ô
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science
% Date: 2022.04.11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear; clc;	% close all windows
                            % clear variables, and clear screen
                     

disp('Midterm Problem 1.3') 	% show Midterm Problem 1.1

disp('¼B¤l»ô; 0716304;');

while 1

   N = input("Please input N inside [0,10]:");
   if(N == 0)
       disp("Thanks for playing");
       return;
   end
   
   option = input("'Please input option: 1) All Curves 2) One Curve: ");
   
   clf;
   
   y = [-10:10];
   x = [-3: 0.02: 3];
   
   z1 = cos(5 .* x) .* cosh(x);
   
   for n = [0: 1: N]

       a = 1;
       b = 1;
       for i = [1 : n]
           a =  a + ((-1) ^ i) .* ((5 .* x) .^ (2 * i)) ./ factorial(2 * i);
           b =  b + x .^ (2*i) ./ factorial(2 * i); 
       end

       z2 = a .* b;

       axis([-3 3 -10 10]);
       figure(1);
       hold on;
       plot(x, z1, 'color', [0.8500 0.3250 0.0980], 'LineWidth',7);
       
       if(option==2 && n == N)
           plot(x, z2, 'LineWidth', 3);
       elseif(option==1)
           plot(x, z2, 'LineWidth', 3);
       end
    
       pause(0.2);
   end
end