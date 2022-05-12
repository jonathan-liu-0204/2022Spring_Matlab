%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: 1
% Problem number: 4
% Student Name:  劉子齊
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science
% Date: 2022.04.18
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear; clc;	% close all windows
                            % clear variables, and clear screen

disp('Midterm Problem 1.5') 	% show Midterm Problem 1.5

disp('劉子齊; 0716304;');

image = imread('tmp.png');
image = imresize(image, [320 320]);
imshow(image)
figure(1);
hold on;

img_size = size(image);
centy = img_size(1) / 2;
centx = img_size(2) / 2;
w = img_size(2);
h = img_size(1);
r = w / 2;
light = 0;

while 1

    fprintf('0) Show student name and ID. Then quit the program\r')
    fprintf("1) Sweeping a line from middle to left\r")
    fprintf("2) Sweeping a line from middle to right\r")
    fprintf("3) Clear the red intensity of the image from left to right\r")
    fprintf("4) Clear the red intensity of the image from right to left\r")
    fprintf("5) Turn on or off a spot light at the top middle. Move it from top to bottom\r")
    figure(1);
    option = input("Please enter your option: ", "s");
    figure(1);

    if option == "0"
        fprintf("Student Name: 劉子齊 Student ID: 0716304\r")
        clf;clc;
        close all;
        return
    elseif option == "1"
        image2 = image;
        for xline = [1 : 10 : w]
            pause(0.01)
            for x = [1 : w]
                for y = [1 : h]
                    if x == xline - 1
                        image2(y, x, :) = [255 255 255];
                    elseif x == xline
                        image2(y, x, :) = [255 255 255];
                    elseif x == xline + 1
                        image2(y, x, :) = [255 255 255];
                    else
                        image2(y, x, :) = image(y, x, :);
                    end
                end
            end
            imshow(image2)
            figure(1);
        end
        imshow(image)
        figure(1);
    elseif option == "2"
        image2 = image;
        for xline = [w : -10 : 1]
            pause(0.01)
            for x = [1 : w]
                for y = [1 : h]
                    if x == xline - 1
                        image2(y, x, :) = [255 255 255];
                    elseif x == xline
                        image2(y, x, :) = [255 255 255];
                    elseif x == xline + 1
                        image2(y, x, :) = [255 255 255];
                    else
                        image2(y, x, :) = image(y, x, :);
                    end
                end
            end
            imshow(image2)
            figure(1);
        end
        imshow(image)
        figure(1);
    elseif option == "3"
         image2 = image;
        for xline = [w : -10 : 1]
            pause(0.01)
            for x = [1 : w]
                for y = [1 : h]
                    if x == xline - 1
                        image2(y, x, :) = [255 255 255];
                    elseif x == xline
                        image2(y, x, :) = [255 255 255];
                    elseif x == xline + 1
                        image2(y, x, :) = [255 255 255];
                    else
                        image2(y, x, :) = image(y, x, :);
                    end
                end
            end
            imshow(image2)
            figure(1);
        end
        imshow(image)
        figure(1);
    elseif option == "4"
        image2 = image;
        for xline = [w : -10 : 1]
            pause(0.01)
            for x = [1 : w]
                for y = [1 : h]
                    if x == xline - 1
                        image2(y, x, :) = [255 255 255];
                    elseif x == xline
                        image2(y, x, :) = [255 255 255];
                    elseif x == xline + 1
                        image2(y, x, :) = [255 255 255];
                    else
                        image2(y, x, :) = image(y, x, :);
                    end
                end
            end
            imshow(image2)
            figure(1);
        end
        imshow(image)
        figure(1);
    elseif option == "5"
        if light == 1
            for ceny = [1 : 10 : h]
                image2 = image;
                for x = [1 : w]
                    for y = [1 : h]
                        x_dis2 = (x - centx) ^ 2;
                        y_dis2 = (y - ceny) ^ 2;
                        distance = sqrt(x_dis2 + y_dis2);
                        if distance < r
                            image2(y, x, :) = image(y, x, :) * 0.5;
                        end
                    end
                end
                imshow(image2);
                figure(1);
                light = 0;
                pause(0.1)
            end
        elseif light == 0
            for ceny = [1 : 10 : h]
                image2 = image;
                for x = [1 : w]
                    for y = [1 : h]
                        x_dis2 = (x - centx) ^ 2;
                        y_dis2 = (y - ceny) ^ 2;
                        distance = sqrt(x_dis2 + y_dis2);
                        if distance < r
                            image2(y, x, :) = image(y, x, :) * 1.5;
                        end
                    end
                end
                imshow(image2);
                figure(1);
                light = 1;
                pause(0.1)
            end
        end
        
    else
        fprintf("Please enter valid input. :)\r\n")
    end
end