function out = add_gaussian_noise(in, variance)
% Adds gaussian noise of given variance to the input image

%% Default parameters
narginchk(1, 2)
if nargin < 2
  variance = 0.1;
endif

%% Input validation
assert(strcmp(class(in), 'double') || strcmp(class(in), 'single'),
  'Invalid input type. Input must be single or double.');

%% Add noise 
noise = normrnd(0.5, sqrt(variance), size(in)(1,1), size(in)(1,2));

out=in+noise;
%% Clip output to [0,1] 
out=contrast_stretch(out,[0,1]);

%% Show some images - uncomment for debugging
%figure, imshow(in)
%figure, imshow(out)

endfunction
