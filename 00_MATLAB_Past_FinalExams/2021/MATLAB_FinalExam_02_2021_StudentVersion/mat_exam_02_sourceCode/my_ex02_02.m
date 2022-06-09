%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: Lab
% Problem number: �
% Student Name:  �
% Student ID: �
% Email address: �
% Department: Computer Science, NYCU
% Date: �.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Align the lines
% Select all and then press CONTROL-I
%
% close all windows
% clear variables, and clear screen

close all; clear; clc;

disp('Final Exam Problem 2.2');
disp('id and name');

global option;
global index;
global r1;
global r2;
global X;
global Y1;
global Y2;
global KEY_Q;

index = 1;
r1 = -4;
r2 = 4;
KEY_Q = false;

X = -5:0.025:5;
Y1 = (X - 2) .* (X + 2);
Y2 = -2 * (X - 2) .* (X + 2) .* sin(X / 4);

disp('Enter option...');
disp('  Opt 1) Function Graph');
disp('  Opt 2) Region Filling');
option = input(': ');

while option ~= 1 && option ~= 2
    option = input(': ');
end

h_fig = figure;

set(h_fig, 'KeyPressFcn',@m_KeyCallBack);

if option == 1

    [X, Y] = meshgrid(-2.5:0.05:2.5);

    k11 = Y .* sin(X);
    k12 = Y .* cos(X);

    k21 = cos(k12) ./ (cos(k11) .^ 2 + 0.1);
    k22 = k11 .* k12;
    k23 = sin(k12) ./ (abs(k12) + 0.1);
    k24 = k11 .* cos(k12);

    k31 = -k21 ./ (abs(k24) + 0.2);
    k32 = k23 .* sin(k22);
    k33 = sin(k21) .* cos(k23);

    k41 = cos(k32) +2 * sin(k33);
    k42 = cos(k31) ./ (sin(k33) + 2);

    k51 = k42 .* k41;

    F = [k11; k12; k21; k22; k23; k24; k31; k32; k33; k41; k42; k51];
    titles = ['k11' 'k12' 'k21' 'k22' 'k23' 'k24' 'k31' 'k32' 'k33' 'k41' 'k42' 'k51'];

    while ~KEY_Q
        s0 = index * 101 + 1 - 101;
        s1 = index * 101 + 101 - 101;
        Z = F(s0:s1, :);
        meshc(X, Y, Z);
        colorbar;
        xlabel('x');
        ylabel('y');
        title(titles((index - 1) * 3 + 1:index * 3));
        pause(0.1);
    end

else
    segL = find(and(X >= r1, X < min(2, r2)));
    segR = find(and(X <= r2, X >= max(2, r1)));
    fill([r2 r1 X(segL) X(segR)], [-20 -20 Y2(segL) Y1(segR)], 'blue');
    hold on;
    fill([r2 r1 X(segL) X(segR)], [-20 -20 Y1(segL) Y2(segR)], 'yellow');
    hold on;
    plot(X, Y1, 'LineWidth', 5);
    hold on;
    plot(X, Y2, 'LineWidth', 5);
    hold off;
    axis([-5 5 -20 20]);
    title(sprintf('(r1, r2) = (%.2f, %.2f)', r1, r2));
    while ~KEY_Q
        pause(0.1);
    end
end
KEY_Q = false;
disp('id and name');

function m_KeyCallBack(~, event)
    global option;
    global index;
    global r1;
    global r2;
    global X;
    global Y1;
    global Y2;
    global KEY_Q;

    switch (event.Key)
        case 'n'
            if option == 1
                index = min(12, index + 1);
            else
                r1 = min(r1 + 1, r2);
                segL = find(and(X >= r1, X < min(2, r2)));
                segR = find(and(X <= r2, X >= max(2, r1)));
                fill([r2 r1 X(segL) X(segR)], [-20 -20 Y2(segL) Y1(segR)], 'blue');
                hold on;
                fill([r2 r1 X(segL) X(segR)], [-20 -20 Y1(segL) Y2(segR)], 'yellow');
                hold on;
                plot(X, Y1, 'LineWidth', 5);
                hold on;
                plot(X, Y2, 'LineWidth', 5);
                hold off;
                axis([-5 5 -20 20]);
                title(sprintf('(r1, r2) = (%.2f, %.2f)', r1, r2));
            end
        case 'm'
            if option == 1
                index = max(1, index - 1);
            else
                r2 = max(r2 - 1, r1);
                segL = find(and(X >= r1, X < min(2, r2)));
                segR = find(and(X <= r2, X >= max(2, r1)));
                fill([r2 r1 X(segL) X(segR)], [-20 -20 Y2(segL) Y1(segR)], 'blue');
                hold on;
                fill([r2 r1 X(segL) X(segR)], [-20 -20 Y1(segL) Y2(segR)], 'yellow');
                hold on;
                plot(X, Y1, 'LineWidth', 5);
                hold on;
                plot(X, Y2, 'LineWidth', 5);
                hold off;
                axis([-5 5 -20 20]);
                title(sprintf('(r1, r2) = (%.2f, %.2f)', r1, r2));
            end
        case 'b'
            r1 = -4;
            r2 = 4;
            segL = find(and(X >= r1, X < min(2, r2)));
            segR = find(and(X <= r2, X >= max(2, r1)));
            fill([r2 r1 X(segL) X(segR)], [-20 -20 Y2(segL) Y1(segR)], 'blue');
            hold on;
            fill([r2 r1 X(segL) X(segR)], [-20 -20 Y1(segL) Y2(segR)], 'yellow');
            hold on;
            plot(X, Y1, 'LineWidth', 5);
            hold on;
            plot(X, Y2, 'LineWidth', 5);
            hold off;
            axis([-5 5 -20 20]);
            title(sprintf('(r1, r2) = (%.2f, %.2f)', r1, r2));
        case 'q'
            KEY_Q = true;
        otherwise

    end

end


