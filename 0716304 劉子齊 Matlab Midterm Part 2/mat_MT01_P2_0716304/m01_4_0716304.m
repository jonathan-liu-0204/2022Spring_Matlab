%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: 1
% Problem number: 4
% Student Name:  劉子齊
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science
% Date: 2022.04.18
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear; clc;	% close all sindoss
                            % clear variables, and clear screen

disp('Midterm Problem 1.4') 	% shos Midterm Problem 1.4

disp('劉子齊; 0716304;');

d = 0;

while 1
    while true

        d = input('Enter d in [0, 4]: ');

        if d >= 0 && d <= 4
            break;
        else
            fprintf("Please enter valid input. :)\r\n")
        end

    end

    if d == 0
        return;
    end

    %Plot y(x) = [z1(x) sin(x) ] / z2(x)
    %z1(x) = (cos(s*x) + sin(s*x))*e-cos(x)
    %z2(x) =(x+5)*(x-d)*(x-2*d)*ex*sin(s*x)

    X = -10 : 0.025 : 10;

    for s = 0.1:0.05:3

        Z1 = (cos(s .* X) + sin(s .* X)) .* exp(-cos(X));
        Z2 = (X + 5) .* (X - d) .* (X - 2 * d) .* exp(X .* sin(s .* X));

        Y = (Z1 .* sin(X)) ./ Z2;

        seg1 = find(and(X > (-10), X < (-5)));
        seg2 = find(and(X > (-5), X < d));
        seg3 = find(and(X > d, X < (2*d)));
        seg4 = find(and(X > (2*d), X < 10));

        plot(X(seg1), Y(seg1), 'Linewidth', 3);
        hold on;
        plot(X(seg2), Y(seg2), 'Linewidth', 3);
        hold on;
        plot(X(seg3), Y(seg3), 'Linewidth', 3);
        hold on;
        plot(X(seg4), Y(seg4), 'Linewidth', 3);
        hold off;

        axis([-10 10 -10 10]);
        figure(1);
        pause(0.2);
    end
end