%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: 1
% Problem number: 2
% Student Name:  ¼B¤l»ô
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science
% Date: 2022.04.11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear; clc;	% close all windows
                            % clear variables, and clear screen

disp('Midterm Problem 1.2') 	% show Midterm Problem 1.2

disp('¼B¤l»ô; 0716304;');

while 1
   a = input("Please input a: ");
   if a <= 0 
       disp("Thanks for playing");
       return;
   end
   
   option = input("Please input option: ");
   if option == 1
       d = 5;
   else
       d = 10;
   end
   
   clf;
   
   for b = [-5:1:5]
       figure(1);
       axis([-d d -d d]);
       yy = [];
       xx1 = [];
       xx2 = [];
       display(b)
       
       for y = [-d : 0.01 : d]
           aa = 1.1 + tanh(cos(y) ^ 2);
           bb = a * (y * sin(y) + 2) / exp(cos(y));
           cc = (-b) * (3 + exp(-y) * cos(y) + sin(y));
           answer = bb * bb - 4 * aa * cc;
           if answer >= 0
               x1 = (-1 * bb + sqrt(answer)) / (2 * aa);
               x2 = (-1 * bb - sqrt(answer)) / (2 * aa);
               yy = [yy,y];
               xx1 = [xx1,x1];
               xx2 = [xx2,x2];
           end
       end
       
       plot(xx1,yy,'LineWidth', 3, 'DefaultAxesFontSize', 30);
       plot(xx2,yy,'LineWidth', 3, 'DefaultAxesFontSize', 30);
       hold on;
       pause(0.05);
   end
end
