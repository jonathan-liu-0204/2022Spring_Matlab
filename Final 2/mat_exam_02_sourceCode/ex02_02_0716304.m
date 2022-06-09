%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Final Exam Number: 2
% Problem number: 2
% Student Name: 劉子齊
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science
% Date: 2022.06.09
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear; 

disp('Final Exam Problem 2.2') 	% show Final Exam Problem 1.1
disp('劉子齊; 0716304');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global index;
global X;
global Y;
global KEY_Q;
global show_all;

index = 1;
KEY_Q = false;
show_all = false;

h_fig = figure;

set(h_fig, 'KeyPressFcn',@m_KeyCallBack);

[X, Y] = meshgrid(-2.5:0.05:2.5);

k11 = cos(X).*sin(Y);
k12 = X .* sin(X);
k13 = cos(X) .* sin(Y);
k14 = Y .* sin(Y);

k21  = cos(k14 + k12);
k22 = k12 + k13 .* (sin(k13) + 2); 
k23 = sin(k11) .* (sin(abs(k14)) + 1);

k31 = sin(k22) .* cos(k23);
k32 = sin(k21) + cos(k23);

k41 = k32 .* cos(2 .* k31);
k42 = k32 .* sin(2 .* k31);
k43 = abs(k31) .* sin(2 .* k32);
k44 = abs(k31) .* sin(2 .* k32);

k51 = sin(k41) ./ (k42 .* k42 + 2);
k52 = k44 .* cos(5 .* k43);

k61 = k52 .* k42 + k51;

%     F = [k11; k12; k13; k14; k21; k22; k23; k31; k32; k41; k42; k43; k44; k51; k52; k61];
%     titles = ['k11' 'k12' 'k13' 'k14' 'k21' 'k22' 'k23' 'k31' 'k32' 'k41' 'k42' 'k43' 'k44' 'k51' 'k52' 'k61'];

F = [k23; k31; k32; k41; k42; k43; k44; k51; k52; k61 ];
titles = ['k23' 'k31' 'k32' 'k41' 'k42' 'k43' 'k44' 'k51' 'k52' 'k61'];

while and(~KEY_Q, ~show_all)
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

if show_all
    subplot(2, 5, 1)
    meshc(X, Y, k23);
    xlabel('x');
    ylabel('y');
    title("k23");
    
    subplot(2, 5, 2)
    meshc(X, Y, k31);
    xlabel('x');
    ylabel('y');
    title("k31");
    
    subplot(2, 5, 3)
    meshc(X, Y, k32);
    xlabel('x');
    ylabel('y');
    title("k32");
    
    subplot(2, 5, 4)
    meshc(X, Y, k41);
    xlabel('x');
    ylabel('y');
    title("k41");
    
    subplot(2, 5, 5)
    meshc(X, Y, k42);
    xlabel('x');
    ylabel('y');
    title("k42");
    
    subplot(2, 5, 6)
    meshc(X, Y, k43);
    xlabel('x');
    ylabel('y');
    title("k43");
    
    subplot(2, 5, 7)
    meshc(X, Y, k44);
    xlabel('x');
    ylabel('y');
    title("k44");
    
    subplot(2, 5, 8)
    meshc(X, Y, k51);
    xlabel('x');
    ylabel('y');
    title("k51");
    
    subplot(2, 5, 9)
    meshc(X, Y, k52);
    xlabel('x');
    ylabel('y');
    title("k52");
    
    subplot(2, 5, 10)
    meshc(X, Y, k61);
    xlabel('x');
    ylabel('y');
    title("k61");
    
    pause(0.1);

end

show_all = false;
KEY_Q = false;
disp('劉子齊; 0716304');

function m_KeyCallBack(~, event)
    global index;
    global show_all;
    global KEY_Q;

    switch (event.Key)
        case 'n'
            index = min(10, index + 1);
            
        case 'm'
            index = max(1, index - 1);
            
        case 's'
            show_all = true;
            
        case 'q'
            KEY_Q = true;
        otherwise
    end
end










