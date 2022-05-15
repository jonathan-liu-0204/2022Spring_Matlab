%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: Lab 3
% Problem number: 2
% Student Name:  ¼B¤l»ô
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science, NYCU
% Date: 2022/05/15
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% close all windows
% clear variables, and clear screen
close all; clf; clear; clc;

% show Lab
disp('Lab Problem 3.2')  

I = imread('tmp.png');

Id = im2double(I);

s = size(Id);
w = s(2);
h = s(1);

% f = abs(cos(x/w*2*pi));

K0 = ones(size(I), 'double');

while true
    
    option = input("Please input your choice (0-2): ");
    
    if(option == 0)
        disp("Thanks for playing.");
        close all;
        return;
    elseif(option == 1)
        % horizontal
        K = hori_mask(K0, w);
        figure(1);
        imshow(Id.*K)
    elseif(option == 2)
        % vertical
        K = vert_mask(K0, h);
        figure(1);
        imshow(Id.*K)
    else
        disp("Please input the valid option, which is 0 to 3.");
    end
end

function K = hori_mask(Kin, width)
    K = Kin;
    for i = [1 : 1 : width]
        f = abs(cos(i / width * 2 * pi));
        K(:, i, 1:3) = f;
    end
end

function K = vert_mask(Kin, high)
    for i = [1 : 1 : high]
        f = abs(cos(i / high * 2 * pi));
        Kin(i, :, 1:3) = f;
    end
    K = Kin;
end



