%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Final Exam Number: 2
% Problem number: 1
% Student Name: 劉子齊
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science
% Date: 2022.06.09
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear;

disp('Final Exam Problem 2.1') 	% show Final Exam Problem 1.1
disp('劉子齊; 0716304');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fig_handle = figure;


global key_pressed_op_1;
global key_pressed_op_2;
global key_pressed_return;
global key_pressed_op_previous;
global key_pressed_op_next;
global key_pressed_reset;
global key_pressed_quit;
key_pressed_op_1= false;
key_pressed_op_2= false;
key_pressed_return= false;
key_pressed_op_previous = false;
key_pressed_op_next = false;
key_pressed_quit = false;
key_pressed_reset = false;

set(fig_handle,'KeyPressFcn', @m02_01_KeyCallBack_functions); % callback function

a = 0.3;
b = 0.2;
n = 10000;

while true

    clf
    
    syms x;
    syms y;

    func1 = b ./ a .* cos ( a .* pi .* y .^ 2 ./ 2);
    s1 = solve(x == func1, y);
    d_func1 = diff(func1);

    ty0 = 0.8;
    tx0_1 = double(subs(func1, y, ty0));
    
    for i = 1:1:4
        if (double(subs(s1(i), tx0_1)) > 0)
            cpf1 = s1(i);
            break;
        end
    end

    if (double(subs(d_func1, y, ty0)) < 0)
        cpf1 = 1 - cpf1;
    end

    pdf1 = diff(cpf1);
    
    Y = rand(1,n);

    X1 = b ./ a .* cos ( a .* pi .* Y .^ 2 ./ 2);

    M1 = mean(X1);
    SD1 = std(X1);
    
    subplot(1, 2, 1);
    h1 = histogram(X1, 'Normalization', 'pdf');
    [N1, edges1] = histcounts(X1, 'Normalization', 'pdf');
    n_ed1 = size(N1);
    hold on
    f1 = double(subs(pdf1, x, edges1));
    plot(edges1(1:n_ed1(2)), f1(1:n_ed1(2)),'LineWidth',3);
    set(gca, 'Fontsize',15);
    
    
    syms x;
    syms y;
    
    func2 = b - a .* cos ( a .* y .^ 2 ./ 2);
    s2 = solve(x == func2, y);
    d_func2 = diff(func2);
    tx0_2 = double(subs(func2, y, ty0));

    for i = 4:-1:1
        if (double(subs(s2(i), tx0_2)) > 0)
            cpf2 = s2(i);
            break;
        end
    end
    
    if (double(subs(d_func2, y, ty0)) < 0)
        cpf2 = 1 - cpf2;
    end
    
    pdf2 = diff(cpf2);

    X2 = b - a .* cos ( a .* Y .^ 2 ./ 2);
    M2 = mean(X2);
    SD2 = std(X2);
    
    subplot(1, 2, 2);
%     h2 = histogram(X2, 'Normalization', 'pdf');
%     [N2, edges2] = histcounts(X2, 'Normalization', 'pdf');
%     n_ed2 = size(N2);
%     hold on
%     f2 = double(subs(pdf2, x, edges2));
%     plot(edges2((1:(n_ed2(2) - 1))), f2(1:(n_ed2(2) - 1)),'LineWidth',3);
    set(gca, 'Fontsize',15);
    
    
%     n_point = min(length(f1), length(f2));
    n_point = length(f1);

    for i = [n_point-1:-1:1]
        
        subplot(1, 2, 1);
        h1 = histogram(X1, 'Normalization', 'pdf');
        hold on;
        plot(edges1(1:n_ed1(2)), f1(1:n_ed1(2)),'LineWidth',3);
        plot(edges1(i), f1(i), '*', 'linewidth', 3)
        set(gca, 'Fontsize',15);
        title(['M = ', num2str(M1), '; SD = ' , num2str(SD1), '; a = ', num2str(a), '; b = ', num2str(b)]);
        hold off;
        
        
        subplot(1, 2, 2);
%         h2 = histogram(X2, 'Normalization', 'pdf');
%         hold on;
%         plot(edges2 ,f2 ,'LineWidth',3);
%         plot(edges2(i), f2(i), '*', 'linewidth', 3)
        set(gca, 'Fontsize',15);
        title(['M = ', num2str(M2), '; SD = ' , num2str(SD2), '; a = ', num2str(a), '; b = ', num2str(b)]);
%         hold off;
        
        figure(1)
        pause(0.05)
    end
    
    while true
        if (key_pressed_op_1)
            if(a - 0.1 < 0.1)
                a = 0.1;
            else
                a = a - 0.1;
            end
            key_pressed_op_1 = false;
            break;
        end
        
        if (key_pressed_op_2)
            if(a + 0.1 > 1)
                a = 1;
            else
                a = a + 0.1;
            end
            key_pressed_op_2 = false;
            break;
        end
        
        if (key_pressed_quit)
            key_pressed_quit = false;
            disp('Student Name: 劉子齊');
            disp('Student ID: 0716304');
            disp('Thanks for playing');
            close all;
            return;
            break;
        end
        
        pause(0.033333);
    end
end