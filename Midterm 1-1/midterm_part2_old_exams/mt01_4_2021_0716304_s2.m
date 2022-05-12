%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: 01
% Problem number: 04
% Student Name: Yueh-Hsun Chiang
% Student ID: 0716214
% Email address: ysjiang.cs07@nctu.edu.tw
% Department: CS
% Date: 0419
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear; clc;
disp('Midterm Problem 1.4')

figure;

u = 0;

while true

    u = input('Enter u in [0, 1]: ');

    if u >= 0 && u <= 1
        break;
    end

end

if u == 0
    return;
end

X = -10:0.025:10;

for w = 0.1:0.05:3

    Z1 = sin(X) .* exp(-w * sin(X)) + w * cos(X);
    Z2 = (X .^ 2 - 2 * w * X - 3 * (w ^ 2)) .* (abs(cos(2 * X)) + u);

    Y = (Z1 .* cos(Z2)) ./ Z2;

    L = (2 * w - sqrt(4 * (w ^ 2) + 12 * (w ^ 2))) / 2;
    R = (2 * w + sqrt(4 * (w ^ 2) + 12 * (w ^ 2))) / 2;

    seg1 = find(X < L);
    seq2 = find(and(X > L, X < R));
    seq3 = find(X > R);
    plot(X(seg1), Y(seg1), 'LineWidth', 3);
    hold on;
    plot(X(seq2), Y(seq2), 'LineWidth', 3);
    hold on;
    plot(X(seq3), Y(seq3), 'LineWidth', 3);
    hold off;

    axis([-10 10 -10 10]);
    figure(1);
    pause(0.2);
end