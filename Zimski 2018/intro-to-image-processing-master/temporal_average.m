function out = temporal_average(in, num_images)
% Create an array of noisy images and average them to remove noise

%% Default parameters
narginchk(1, 2)
if nargin < 2
  num_images = 5;
endif

%% Extract input luma 
%% ------- YOUR CODE HERE ------

%% Generate an array of noisy lumas 
%% ------- YOUR CODE HERE ------

% Use the function for adding gaussian noise to create an array of noisy lumas,
% using the single input luma.
% Store images in an M-by-N-by-num_images array called noisy - this is expected
% for displaying them later
%% Average the images to get the de-noised image 
%% ------- YOUR CODE HERE ------

%% Show some images
figure('Name', 'One of the noisy inputs'), imshow(noisy(:,:,1))
gauss_filt = imfilter(noisy(:,:,1), fspecial('gaussian', [9 9]));
figure('Name', 'De-noised by gaussian filtering'), imshow(gauss_filt)
figure('Name', 'De-noised by temporal averaging'), imshow(out)

endfunction