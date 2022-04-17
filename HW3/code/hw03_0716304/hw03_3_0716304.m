%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: 3
% Problem number: 3
% Student Name:  劉子齊
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science, NYCU
%
% Date: 2022.04.16
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all;
clf; clear; clc;		% clear the current figure
                        % clear variables, and clear screen

disp('Assignment Problem 3.3') 	% show Assignment Problem 3.1

image = imread('tmp.png');
image = imresize(image, [320 320]);
imshow(image)
hold on;

img_size = size(image);
centy = img_size(1) / 2;
centx = img_size(2) / 2;
w = img_size(2);
h = img_size(1);
r = w / 2;
light = 0;
position = 0;

while 1
    fprintf('0) Show student name and ID. Then quit the program.\r')
    fprintf("1) Turn on or off a spot light at the center of the image.\r")
    fprintf("2) Turn on or off a spot light at the right side of the image.\r")
    fprintf("n) Press ‘n’ to reduce the radius of the disk. Each time, reduce r by 20.\r")
    fprintf("m) Press ‘m’ to increase the radius of the disk. Each time, increase r by 20.\r")
    option = input("Please enter your option: ", "s");

    if option == "0"
        fprintf("Student Name: 劉子齊 Student ID: 0716304\r")
        return
    elseif option == "1"
        position = 1;
        
        if light == 0
            light = 1;
        else
            light = 0;
        end
    elseif option == "2"
        position = 2;
        
        if light == 0
            light = 1;
        else
            light = 0;
        end
    elseif option == "n"
        if (r - 20) > 20
            r = r - 20;
        else
            r = 20;
        end
    elseif option == "m"
        if (r + 20) < w
            r = r + 20;
        else
            r = w;
        end
    else
        fprintf("Please enter valid input. :)")
    end
    
    if position == 1 && light == 0
        image2 = image;
        for x = [1 : w]
            for y = [1 : h]
                x_dis2 = (x - centx) ^ 2;
                y_dis2 = (y - centy) ^ 2;
                distance = sqrt(x_dis2 + y_dis2);
                if distance < r
                    image2(y, x, :) = image(y, x, :) * 0.5;
                end
            end
        end
        imshow(image2);
    elseif position == 1 && light == 1
        image2 = image;
        for x = [1 : w]
            for y = [1 : h]
                x_dis2 = (x - centx) ^ 2;
                y_dis2 = (y - centy) ^ 2;
                distance = sqrt(x_dis2 + y_dis2);
                if distance < r
                    image2(y, x, :) = image(y, x, :) * 1.5;
                end
            end
        end
        imshow(image2);
    end
    
    if position == 2 && light == 0
        image2 = image;
        for x = [1 : w]
            for y = [1 : h]
                x_dis2 = (x - w) ^ 2;
                y_dis2 = (y - centy) ^ 2;
                distance = sqrt(x_dis2 + y_dis2);
                if distance < r
                    image2(y, x, :) = image(y, x, :) * 0.5;
                end
            end
        end
        imshow(image2);
    elseif position == 2 && light == 1
        image2 = image;
        for x = [1 : w]
            for y = [1 : h]
                x_dis2 = (x - w) ^ 2;
                y_dis2 = (y - centy) ^ 2;
                distance = sqrt(x_dis2 + y_dis2);
                if distance < r
                    image2(y, x, :) = image(y, x, :) * 1.5;
                end
            end
        end
        imshow(image2);
    end
end