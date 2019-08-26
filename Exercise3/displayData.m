function [h, display_array] = displayData(X, example_width)
%DISPLAYDATA Display 2D data in a nice grid
%   [h, display_array] = DISPLAYDATA(X, example_width) displays 2D data
%   stored in X in a nice grid. It returns the figure handle h and the 
%   displayed array if requested.

% Set example_width automatically if not passed in
if ~exist('example_width', 'var') || isempty(example_width) 
  % for pixel width 
  % example_width is 20 as X is now 100 by 400
  % as each image is 20 by 20
	example_width = round(sqrt(size(X, 2)));
end

% Gray Image
% for mapping
colormap(gray);

% example_height and example_width is size of one cell and
% display_cols and display_rows is the total no of items(100) to display

% Compute rows, cols
[m n] = size(X);
% it shows that m = number of "numbers" that are displayed, n = number of pixels to display each number (excluding the padding).
% 100 by 400
% height is also 20
example_height = (n / example_width);

% Compute number of items to display
% to calculate how many rows and cols we need to display m elements
% 10
display_rows = floor(sqrt(m));
% 10
display_cols = ceil(m / display_rows);

% Between images padding
pad = 1;

% Setup blank display
% 1 +10*(20+1)
% 211 by 211
% - for padding black
display_array = -ones(pad + display_rows * (example_height + pad),pad + display_cols * (example_width + pad));

% Copy each example into a patch on the display array
curr_ex = 1;
for j = 1:display_rows
	for i = 1:display_cols
		if curr_ex > m, % m 100
			break; 
		end
		% Copy the patch
		
		% Get the max value of the patch
    % map each image from X to a 20by20 cell of display_array
    % reshape converts each row vector of 1 by 400 size to 20 by 20 cell of display_array
    % dividing by max_val because feature normalize
		max_val = max(abs(X(curr_ex, :)));
		display_array(pad + (j - 1) * (example_height + pad) + (1:example_height), ...
		              pad + (i - 1) * (example_width + pad) + (1:example_width)) = ...
						reshape(X(curr_ex, :), example_height, example_width) / max_val;
		curr_ex = curr_ex + 1;
	end
	if curr_ex > m, 
		break; 
	end
end

% Display Image
% scales to rgb 0 to 255
% maps corresponding colors depending on colormap
% maps our range which is [-1,1] to [0-255] 
% therefore 0 means -1 which is black
h = imagesc(display_array, [-1 1]);

% Do not show axis
axis image off

drawnow;

end
