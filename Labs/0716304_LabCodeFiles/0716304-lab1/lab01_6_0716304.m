%{
Debug
Debug the program.
The program show a mesh z.
z = 2 e^(-(y-5)^2) sin(x) + e^(-x^2) cos(y)

It performs smoothing to the mesh each time after ENTER
is pressed. Please watch the demo video.

Show a message 'Press ENTER to continue.' to remind a user 
to press ENTER after the mesh is drawn.

To perform a smoothing operation, 
the z value of an interior point (exclude the boundary points)
is the average of 3x3 grid points centered at the point.
do not change the z values of all the bondary points.

zlim is set to [-2,2].

Show your student ID and Name.

Press Control-C to break the program at any time.
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Write down the information.
% Problem number: Lab 1.6
% Student Name: ¼B¤l»ô Jonathan
% Student ID: 0716304
% Email address: jonathan.tzuchi.liu@gmail.com
% Department: Computer Science, NYCU
% Date: 2022.04.28
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clf; clear; clc;		% clear the current figure
        				% clear variables, and clear screen

disp('Lab Problem 1.6') 	% show Lab Problem 1.6
fprintf('\n');
fprintf('Student Name:¼B¤l»ô ID:0716304\n');

[x, y] = meshgrid([-10:0.5:10]);     % ; into commas / GridMesh into meshgrid
z = 2 .* exp(-((y-5) .^ 2)) .* sin(x) + exp(-(x .^ 2)) .* cos(y); % incomplete formula

z1 = z;

sx = size(x);
sy = size(y);
ix = sx(2); % get the number of elements along the x-axis         % change [] into ()
iy = sy(1); % get the number of elements along the y-axis         % change [] into ()

while true
    
    surf(z1);
    figure(1);
    zlim([-2,2])
    n = input('Press enter to continue.');
   
    % for each interior point do
    for i = [2 : (ix-2)]
        for j = [2 : (iy-2)] % add [
            %compute the average for a 3x3 grid points.
            %sum(z((i-1):(i+1), (j-1):(j+1)))
            z1(i, j) = (z1((i+1), (j+1)) + z1((i+1), (j)) + z1((i+1), (j-1)) + z1((i), (j+1)) + z1(i, j) + z1((i), (j-1)) + z1((i-1), (j+1)) + z1((i-1), (j)) + z1((i-1), (j-1))) ./ 9;
        end % missing end
    end
    %z1 = z1;
end












