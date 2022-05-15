%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: Lab 3
% Problem number: 1
% Student Name:  ¼B¤l»ô
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science, NYCU
% Date: 2022/05/13
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% close all windows
% clear variables, and clear screen
close all; clf; clear; clc;

% show Lab
disp('Lab Problem 3.1')  

I = imread('tmp.png');

Id = im2double(I);

s = size(Id);
w = s(2);
h = s(1);

while true
   
    option = input("Please input your choice (0-3): ");
    
    if(option == 0)
        disp("Thanks for playing.");
        return;
    elseif(option == 1)
        dy = s(1) / 2;
        for y = [0 : 1 : 2]
            current = dy*y;
            if(current == 0)
               current = 1; 
            end
            Id(current:(current+5), :, 1) = 0;
            Id(current:(current+5), :, 2) = 0;
            Id(current:(current+5), :, 3) = 1.0;
        end
        
        dx = s(2) / 4;
        for x = [0 : 1 : 4]
            current = dx*x;
            if(current == 0)
               current = 1; 
            end
            Id(:, current:(current+5), 1) = 0;
            Id(:, current:(current+5), 2) = 0;
            Id(:, current:(current+5), 3) = 1.0;
        end
    elseif(option == 2)
        dy = s(1) / 4;
        for y = [0 : 1 : 4]
            current = dy*y;
            if(current == 0)
               current = 1; 
            end
            Id(current:(current+5), :, 1) = 0;
            Id(current:(current+5), :, 2) = 0;
            Id(current:(current+5), :, 3) = 1.0;
        end
        
        dx = s(2) / 8;
        for x = [0 : 1 : 8]
            current = dx*x;
            if(current == 0)
               current = 1; 
            end
            Id(:, current:(current+5), 1) = 0;
            Id(:, current:(current+5), 2) = 0;
            Id(:, current:(current+5), 3) = 1.0;
        end
    elseif(option == 3)
        dy = s(1) / 8;
        for y = [0 : 1 : 8]
            current = dy*y;
            if(current == 0)
               current = 1; 
            end
            Id(current:(current+5), :, 1) = 0;
            Id(current:(current+5), :, 2) = 0;
            Id(current:(current+5), :, 3) = 1.0;
        end
        
        dx = s(2) / 8;
        for x = [0 : 1 : 8]
            current = dx*x;
            if(current == 0)
               current = 1; 
            end
            Id(:, current:(current+5), 1) = 0;
            Id(:, current:(current+5), 2) = 0;
            Id(:, current:(current+5), 3) = 1.0;
        end
    else
        disp("Please input the valid option, which is 0 to 3.");
    end
    
    imshow(Id);
    figure(1);
end

% Id(1:10,:, 1) = 0;
% Id(1:10,:, 2) = 1.0;
% Id(1:10,:, 3) = 0;
% 
% Id((h-10):h,:, 1) = 0;
% Id((h-10):h,:, 2) = 1.0;
% Id((h-10):h,:, 3) = 0;
% 
% Id(:,1:10, 1) = 0;
% Id(:,1:10, 2) = 1.0;
% Id(:,1:10, 3) = 0;
% 
% Id(:,(w-10):w, 1) = 0;
% Id(:,(w-10):w, 2) = 1.0;
% Id(:,(w-10):w, 3) = 0;




