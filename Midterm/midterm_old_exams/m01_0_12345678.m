% 
% 
% close all; clear; clc;		% close all windows
%                             clear variables, and clear screen
% 
% disp('Midterm Problem 1.1') 	% show Midterm Problem 1.1
% 
% disp('Student Name; Student ID');
% 
% while(1)
%     b = input('please input b:');
%     if(b==0)
%         disp('Thanks for playing');
%         return;
%     end
%     c = input('please input c:');
%     if(c==0)
%         disp('Thanks for playing');
%         return;
%     end
%     dx = -1;
%     while(dx<=0)
%         dx = input('please input dx');
%     end
%     if(dx==0)
%         dx = 0.5;
%     end
%     x = -10:dx:10;
%     y = abs(b) .* cos(c./(cos(x)+1.01))+c.*sin(b.*x)./(abs(sin(x))+0.1);
%     hold on;
%     plot(x,y,'LineWidth',3);
% end
% 
% close all; clear; clc;
% disp('Midterm Problem 1.2') 	% show Midterm Problem 1.1
% 
% disp('Student Name; Student ID');
% 
% while(1)
%     z = input('please input z:');
%     if(z==0)
%         disp('Thanks for playing');
%         return;
%     end
% 
%     option = input('please input option:');
%     d =0;
%     if(option==1)
%         d=3;
%     else
%         d=50;
%     end
% 
%     clf;
%     
%     for w = 0:1:20
%         figure(1);
%         axis([-d d -d d]);
%         yy = [];
%         xx1 = [];
%         xx2 = [];
%         display(w)
%         for y = -d:0.01:d
%             %s = sprintf('x^2 * ( sin(y)^2 + 1) + 0.2* w *x*(y*cos(y)+5)/2.5 -1*z*(cos(exp(-1*y))+2) = 0',w,z);
%             a = ( sin(y)^2 + 1);
%             b = (0.2* w *(y*cos(y)+5))/2.5;
%             c = -1*z*(cos(exp(-1*y))+2);
%             b1 = b*b-4*a*c;
%             if b1>=0
%                 x1 = (-1*b+sqrt(b1))/(2*a);
%                 x2 = (-1*b-sqrt(b1))/(2*a);
%                 yy = [yy,y];
%                 xx1 = [xx1,x1];
%                 xx2 = [xx2,x2];
%             end
%         end
%         plot(xx1,yy,'LineWidth',3);
%         plot(xx2,yy,'LineWidth',3);
%         hold on;
%         pause(0.1);
%     end
% end

close all; clear; clc;
disp('Midterm Problem 1.2') 	% show Midterm Problem 1.1

disp('Student Name; Student ID');
while(1)
    N = -1;
    while(N<0 || N>20)
        N = input('please input N:');
        if(N==0)
            disp('Thanks for playing');
         return;
        end
    end
    option = input('Please input option: \n1) All Curves \n 2) One Curve');
    x = -3*pi:0.02:(3*pi)

    clf;
    for n=0:1:N
        y1 = cal_z1(x);
        y2 = cal_z2(x,n);
        axis([-3*pi,3*pi,-20, 20]);
        figure(1);
        hold on;
        plot(x,y1,'r','LineWidth',7);
        if(n==N && option==2)
            plot(x,y2,'b','LineWidth',3);
        elseif(option==1)
            plot(x,y2,'LineWidth',3);
        end
        
        pause(0.2);
    end
end

function z1 = cal_z1(x)
   z1 = sinh(x).* sin(x);
end

function z2 = cal_z2(x,n)
    a = x;
    b = x;
    for i=1:1:n
        a =  a + (x.^(2*i+1)/factorial(2*i+1));
        b =  b +  ((-1)^(i)* x.^(2*i+1) / factorial(2*i+1)); 
    end
    z2 = a.*b;
end
