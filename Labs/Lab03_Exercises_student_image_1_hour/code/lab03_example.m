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

Id(1:10,:, 1) = 0;
Id(1:10,:, 2) = 1.0;
Id(1:10,:, 3) = 0;

Id((h-10):h,:, 1) = 0;
Id((h-10):h,:, 2) = 1.0;
Id((h-10):h,:, 3) = 0;

Id(:,1:10, 1) = 0;
Id(:,1:10, 2) = 1.0;
Id(:,1:10, 3) = 0;

Id(:,(w-10):w, 1) = 0;
Id(:,(w-10):w, 2) = 1.0;
Id(:,(w-10):w, 3) = 0;

imshow(Id);

