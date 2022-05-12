%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: 2
% Problem number: 1
% Student Name:  ¼B¤l»ô
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science
% Date: 2022/05/12
% National Yang Ming Chiao Tung University, Taiwan
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear; clc;		% close all windows
                            % clear variables, and clear screen

disp('Midterm Problem 2.1') 	% show Midterm Problem 2.1

disp('¼B¤l»ô 0716304');

while true
    option = input("Select an option for layout 1) horizontal 2) Vertical  ");

    if(option == 1)
        suby = 1;
        subx = 2;
        break;
    elseif(option == 2)
        suby = 2;
        subx = 1;
        break;
    else
        disp("Please choose a valid option...");
    end
end

while true
    d_input = input("Please input di and dj as an array, e.g. [1 3]:  ");
    di = d_input(1);
    dj = d_input(2);
    
    if(and(and(di <= 10, di >= 1), and(dj <= 10, dj >= 1)))
        break;
    else
        disp("Please choose a valid option...");
    end
end

% a1 = 2;
% b1 = 20;
% t1 = [0:0.02:6*pi];
% x1 = (b1-a1) .* sin(a1 .* t1) + b1 .* sin((a1/b1) .* t1);
% y1 = (b1-a1) .* cos(a1 .* t1) + b1 .* cos((a1/b1) .* t1);
% n1 = ceil(6*pi / 0.02);
% 
% a2 = 7;
% x2 = [-pi:0.2:-eps eps:0.2:pi];
% r2 = a2 .* sin( 2 .* x2 ) ./ x2;
% n2 = ceil(2*pi / 0.2);

x = [-pi : 0.02 : pi];
r = cos(4 .* x) .* sin(2 .* x);
n = ceil(2*pi / 0.02);

plot(r .* cos(x), r .* sin(x));

% for i  = [1 : 75]
%     
%     if(i <= n2)
%         clf;
%         subplot(suby, subx, 2);
%         pass2 = polar(x2(1:i), r2(1:i), 'bo');
%         hold on;
%         patch(get(pass2,'XData'), get(pass2,'YData'), 'y');
%     end
%               
%     subplot(suby, subx, 1);
%     axis([-40 40 -30 40])
%     pass1 = plot(x1(1:n1-75+i), y1(1:n1-75+i));
%     patch(get(pass1,'XData'), get(pass1,'YData'), 'y');
%     
%     pause(0.01);
% end


if(di < dj)
    n1 = ceil(n / di);
    n2 = ceil(n / dj);
    
    for i  = [1 : n1]
        if(i <= n2)
            clf;
            subplot(suby, subx, 2);
            pass2 = plot(r(1 : i*dj) .* cos(x(1 : i*dj)), r(1 : i*dj) .* sin(x(1 : i*dj)), 'color', [0.7, 0.3, 0.0], 'linewidth', 3);
            axis([-1 1 -1 1])
        end

        subplot(suby, subx, 1);
        pass1 = plot(r(1 : (n1 - i)*di) .* cos(x(1 : (n1 - i)*di)), r(1 : (n1 - i)*di) .* sin(x(1 : (n1 - i)*di)), 'color', [0, 0, 0.7], 'linewidth', 3);
        axis([-1 1 -1 1])
        pause(0.01);
    end
    
else
    n1 = ceil(n / di);
    n2 = ceil(n / dj);
    
    for i  = [1 : n2]
        if(i <= n1)
            clf;
            subplot(suby, subx, 1);
            pass1 = plot(r(1 : (n1 - i)*di) .* cos(x(1 : (n1 - i)*di)), r(1 : (n1 - i)*di) .* sin(x(1 : (n1 - i)*di)), 'color', [0, 0, 0.7], 'linewidth', 3);
            axis([-1 1 -1 1])
        end

        subplot(suby, subx, 2);
        pass2 = plot(r(1 : i*dj) .* cos(x(1 : i*dj)), r(1 : i*dj) .* sin(x(1 : i*dj)), 'color', [0.7, 0.3, 0.0], 'linewidth', 3);
        axis([-1 1 -1 1])
        pause(0.01);
    end
end
