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
w = img_size(2)
h = img_size(1);
r = w / 4;
light = 0;

while 1

    fprintf('0) Show student name and ID. Then quit the program\r')
    fprintf("1) Sweeping a line from middle to left\r")
    fprintf("2) Sweeping a line from middle to right\r")
    fprintf("3) Sweeping a line from middle to bottom\r")
    fprintf("4) Sweeping a line from middle to top\r")
    fprintf("5) Turn on or off a spot light at the lower right corner\r")
    option = input("Please enter your option: ", "s");

    if option == "0"
        fprintf("Student Name: 劉子齊 Student ID: 0716304\r")
        clf;clc;
        close all;
        return
    elseif option == "1"
        for xline = [centx : -10 : 1]
            pause(0.01)
            for x = [1 : w]
                for y = [1 : h]
                    if x == xline
                        image2(y, x, :) = [255 255 255];
                    else
                        image2(y, x, :) = image(y, x, :);
                    end
                end
            end
            imshow(image2)
        end
        imshow(image)
    elseif option == "2"
        for xline = [centx : 10 : w]
            pause(0.01)
            for x = [1 : w]
                for y = [1 : h]
                    if x == xline
                        image2(y, x, :) = [255 255 255];
                    else
                        image2(y, x, :) = image(y, x, :);
                    end
                end
            end
            imshow(image2)
        end
        imshow(image)
    elseif option == "3"
        for yline = [centy : 10 : h]
            pause(0.01)
            for x = [1 : w]
                for y = [1 : h]
                    if y == yline
                        image2(y, x, :) = [255 255 255];
                    else
                        image2(y, x, :) = image(y, x, :);
                    end
                end
            end
            imshow(image2)
        end
        imshow(image)
    elseif option == "4"
        for yline = [centy : -10 : 1]
            pause(0.01)
            for x = [1 : w]
                for y = [1 : h]
                    if y == yline
                        image2(y, x, :) = [255 255 255];
                    else
                        image2(y, x, :) = image(y, x, :);
                    end
                end
            end
            imshow(image2)
        end
        imshow(image)
    elseif option == "5"
        if light == 1
            for cenx = [w : -10 : 1]
                image2 = image;
                for x = [1 : w]
                    for y = [1 : h]
                        x_dis2 = (x - cenx) ^ 2;
                        y_dis2 = (y - h) ^ 2;
                        distance = sqrt(x_dis2 + y_dis2);
                        if distance < r
                            image2(y, x, :) = image(y, x, :) * 0.5;
                        end
                    end
                end
                imshow(image2);
                light = 0;
                pause(0.1)
            end
        elseif light == 0
            for cenx = [w : -10 : 1]
                image2 = image;
                for x = [1 : w]
                    for y = [1 : h]
                        x_dis2 = (x - cenx) ^ 2;
                        y_dis2 = (y - h) ^ 2;
                        distance = sqrt(x_dis2 + y_dis2);
                        if distance < r
                            image2(y, x, :) = image(y, x, :) * 1.5;
                        end
                    end
                end
                imshow(image2);
                light = 1;
                pause(0.1)
            end
        end
        
    else
        fprintf("Please enter valid input. :)\r\n")
    end
end