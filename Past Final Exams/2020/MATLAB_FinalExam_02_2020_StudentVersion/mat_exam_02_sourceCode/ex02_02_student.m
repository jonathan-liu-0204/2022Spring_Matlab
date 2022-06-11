%
global key_pressed_op_previous;
global key_pressed_op_next;

global key_pressed_quit;

key_pressed_op_previous = false;
key_pressed_op_next = false;
key_pressed_quit = false;

h_fig = figure;

set(h_fig,'KeyPressFcn',...
    @m_KeyCallBack_functions); % callback function


func_msg = {'k11', 'k12', 'k21'};

disp('Option 1) Function Graph');
disp('Option 2) Importance sampling');
option = input('Enter the option:');

%%%%%%%%%%%%%%%%%
if option==1
    g11 = @(a,b)(a+b);
    g12 = @(a,b)(a./(0.1+b.*abs(b)));
    %
    g21 = @(a,b)(cos(a));
   
    
    dx = 0.05;
    dy = 0.05;
    x = -1.5:dx:1.5;
    y = -1.5:dy:1.5;
    
    [X Y] = meshgrid(x,y);
    
    k11 = g11(X, Y);
    k12 = g12(X, Y);
    %
    k21 = g21(k11, k12);
    
    %
    % The dimension of each item kij is 61x61.
    %
    F = [k11; k12; k21];
    
    index = 1;
    while true
        s0 = index*61+1-61;
        s1 = index*61+61-61;
        Z = F(s0:s1,:);
    %
    
    meshz(X, Y, Z);
    

       xlabel('x');
      ylabel('y');
      title(func_msg(index)+" Press 'n'.  Press 'q'");
      set(gca,'fontsize', 15);
      figure(h_fig);
    
      pause(0.0333);
      if (key_pressed_op_previous) 
        key_pressed_op_previous = false;
        index = index - 1;
        if (index<1) index = 3;      
        end
      end
     if (key_pressed_op_next) 
    
     end
     if (key_pressed_quit)
         close all;
         disp('Thanks for playing');
         disp('Student ID:12345678');
         return;
     end
     %
     % Add your own stuff
     %
    end % while true
    
    return;
end % end option 1

if option==2
    close all;
    clear
    
end










