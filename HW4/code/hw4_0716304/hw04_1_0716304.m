%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: HW4
% Problem number: 1
% Student Name:  劉子齊
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science, NYCU
% Date: 2022/05/13
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% close all windows
% clear variables, and clear screen
clf; clear; clc;close all;

disp('HW04 Problem 4.1'); 

while true
    
    while true
        n = input("Please input n in [0, 1000000]: ");
        if(n == 0)
            disp("Thanks for playing:))");
            return
        elseif(or(n<0, n>1000000))
            disp("n needs to be inside [0, 1000000]...");
        else
            break
        end
    end
    
    while true

        a = input("Please input 'a': ");
        b = input("Please input 'b': ");
        c = input("Please input 'c': ");

        if(and(a > 0, and(b > 0, c > 0)))
            break;
        elseif(and(a < 0, and(b < 0, c < 0)))
            break;
        else
            disp("a, b, c needs to be nonzero and in the same sign :)))")
        end
    end

    clf;

    Y = rand(1, n);
    X = a .* Y .^ 2 + b .* Y + c;

    M = mean(X);
    SD = std(X);

    % pdf_x = normpdf(X)


    histObject = histogram(X, 'Normalization', 'pdf')
    hold on;

    histNumBins = histObject.NumBins - 1;
    
    [N, edges] = histcounts(X, 'Normalization', 'pdf');
    
    N1 = N(2:end-1);
    edges1 = edges(2:end-2);
    
    p = polyfit(edges1, N1, ceil(log10(n)));
    
    y1 = polyval(p, edges);
    plot(edges, y1, 'linewidth', 3)
    
    n_point = length(y1);

    for i = [n_point:-1:1]
        histogram(X, 'Normalization', 'pdf');
        hold on;
        plot(edges, y1, 'linewidth', 3)
        plot(edges(i), y1(i), '*', 'linewidth', 5)
        title(['M = ', num2str(M), '; SD = ' , num2str(SD), '; a = ', num2str(a), '; b = ', num2str(b), '; c = ', num2str(c)]);
        hold off;
        
        figure(1)
        pause(0.05)
    end
end


