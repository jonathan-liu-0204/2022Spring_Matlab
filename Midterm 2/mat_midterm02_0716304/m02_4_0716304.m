%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: 2
% Problem number: 4
% Student Name:  ¼B¤l»ô
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science
% Date: 2022/05/12
% National Yang Ming Chiao Tung University, Taiwan
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear; clc;		% close all windows
                            % clear variables, and clear screen

disp('Midterm Problem 2.4') 	% show Midterm Problem 2.4

disp('¼B¤l»ô 0716304');

global key_pressed_left;
global key_pressed_right;
global key_pressed_grid;
global key_pressed_gray;
global key_pressed_reset;
global key_pressed_quit;
global key_pressed_brightenUp;

%
%These boolean variables are set properly 
%inside the callback function.
%
key_pressed_left = false;
key_pressed_right = false;
key_pressed_grid = false;
key_pressed_gray = false;
key_pressed_quit = false;
key_pressed_brightenUp = false;
key_pressed_reset = false;

L1 = imread('sunflower.jpg');
L2 = imresize(L1, [320 320]);

s = size(L2);
Id = im2double(L2);
K = ones(size(L2), 'double');
figure, imshow(L2);
input('Press ENTER to start...');

numFrames = 500;

Id = im2double(L2);



for f = [1:numFrames]
    
    set(gcf, 'KeyPressFcn', @keyboard)
    
    figure(1);
    
    bf = f/numFrames;
    f0 = bf * bf * pi * 2;
%     f0 = f / numFrames * pi * 2;
    xx = 0.8 * s(2) * cos(f0) / 2;
    yy = 0.8 * s(1) * sin(f0) / 2;
    
    [x, y] = meshgrid([1:s(2)], [1:s(1)]);
    x = (x - s(1)/2 + xx) ./ (160 / (1.01 ^ f)); % controls the intensity at the end
    y = (y - s(2)/2 + yy) ./ (160 / (1.01 ^ f)); % controls the intensity at the end
    r = sqrt(x .^ 2 + y .^ 2);
    z = abs(sin(r) ./ r); 
    zmax = max(max(z));
    z = 5 .* z ./ zmax;
    
    L3 = cat(3, z, z, z);
    
    k0 = 0.5 + abs(0.5*(sin(f/20)));
%   colorful
%     K1 = cat(3, k0 .* Id .* L3(:,:,1), k0 .* Id(:,:,2) .* (2-L3(:,:,1)), k0 .* Id(:,:,3) .* (2-L3(:,:,1)));
    L5 = k0 .* Id .* L3;
    
    if(f < 200)
       L5 = L5 .* 0.3;
    end
    imshow(L5);
    pause(0.003);
end

function keyboard(src, event)
    disp(event.Key);
    
    global key_pressed_left;
    global key_pressed_right;
    global key_pressed_grid;
    global key_pressed_gray;
    global key_pressed_reset;
    global key_pressed_quit;
    global key_pressed_brightenUp;

    %
    %These boolean variables are set properly 
    %inside the callback function.
    %
    key_pressed_left = false;
    key_pressed_right = false;
    key_pressed_grid = false;
    key_pressed_gray = false;
    key_pressed_quit = false;
    key_pressed_brightenUp = false;
    key_pressed_reset = false;

    switch(event.Key) 
        case 'q'
            key_pressed_quit = 1;
        case 's'
            key_pressed_stop = ~key_pressed_stop;
        case 'space'
            key_pressed_mode = ~key_pressed_mode;
        otherwise
            
    end
end