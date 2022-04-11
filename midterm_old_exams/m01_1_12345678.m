
% close all; clear; clc;		% close all windows
%                             % clear variables, and clear screen
% 
% disp('Midterm Problem 1.1') 	% show Midterm Problem 1.1
% 
% disp('Student Name; Student ID');
% 
% u = input('please input u');
% if(u==0)
%     return;
% end
% 
% for w = 0.1:0.05:3
%     x = -10:0.01:10;
%     z1 = sin(x).*exp((-1)*w.*sin(x)) + w .* cos(x);
%     z2 = (x.^2 + 2.*x.*w - 3*w^2).*(abs(cos(2.*x))+u);
%     [A,idx] = sort(abs(z2));
%     idx1 = idx(1);
%     idx2 = idx(2);
%     if(idx(1)>idx(2))
%         idx1 = idx(2);
%         idx2 = idx(1);
%     end
%     
%     clf;
%     y = z1 .* cos(z2) ./ z2;
%     axis([-10,10,-10,10]);
%     figure(1);
% 
%     X = sprintf('%f====%f',z2(idx1),y(idx1));
%     XX = sprintf('%f====%f',z2(idx2),y(idx2));
%     display(X);
%     display(XX);
%     hold on;
%     plot(x(1:idx1),y(1:idx1),'LineWidth',1);
%     plot(x(idx1:idx2),y(idx1:idx2),'LineWidth',1);
%     plot(x(idx2:end),y(idx2:end),'LineWidth',1);
%     pause(0.2);
% 
% end

close all; clear; clc;		% close all windows
                            % clear variables, and clear screen

disp('Midterm Problem 1.1') 	% show Midterm Problem 1.1

light = 1;
while(1)
I = imread('./tmp.png');

option = input('a');

I = imresize(I,[320,320]);
figure;

center = 160;

if(option==0)
    return;
elseif(option==1)
    tmp = I(:,center+10,:);
    for i = center+1:-10:1
        I(:,i+10,:) = tmp;
        tmp = I(:,i,:);
        I(:,i,:) = 255 .* ones([320,1,3]);
        imshow(I);
        pause(0.2);
    end
elseif(option==2)
    tmp = I(:,center-10,:);
    for i = center:10:321
        I(:,i-10,:) = tmp;
        tmp = I(:,i,:);
        I(:,i,:) = 255 .* ones([320,1,3]);
        imshow(I);
        pause(0.2);
    end
 elseif(option==3)
    tmp = I(center-10,:,:);
    for i = center:10:321
        I(i-10,:,:) = tmp;
        tmp = I(i,:,:);
        I(i,:,:) = 255 .* ones([1,320,3]);
        imshow(I);
        pause(0.2);
    end
  elseif(option==4)
    tmp = I(center+10,:,:);
    for i = center+1:-10:1
        I(i+10,:,:) = tmp;
        tmp = I(i,:,:);
        I(i,:,:) = 255 .* ones([1,320,3]);
        imshow(I);
        pause(0.2);
    end
elseif(option==5)
    tmp = I;
    I = im2double(I);
    for i = 320:-10:1
        K = ones([320,320,3],'double');
        for row = 240:1:320
            col_beg=1;
            col_end=320;
            if(i-80>1)
                col_beg = i-80;
            end
            if(i+80<320)
                col_end = i+80;
            end
            for col=col_beg:1:col_end
                if(norm([row,col]-[320,i])<=80)
                    K(row,col,:) = 1.5-light;
                end
            end
        end
        imshow(I.*K);
    end
    light = 1-light;
end
end

