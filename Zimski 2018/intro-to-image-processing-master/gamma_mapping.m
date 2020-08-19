function out = gamma_mapping(in, gamma_coeff)
% Performs gamma mapping of the input image

%% Default parameters
narginchk(1,2)
if nargin < 2
  gamma_coeff = 1/2.2;
end

%% Input validation
assert(strcmp(class(in), 'double') || strcmp(class(in), 'single'),
  'Invalid input type. Input must be single or double.');
assert(max(in(:)) <= 1.0 && max(in(:)) >= 0.0,
  'Expected input range [0, 1]');

%% Plot the function in range [0, 1] - uncomment for debugging
%xseries = 0:0.01:1;
%plot(xseries, xseries .^ gamma_coeff)
%dseries=xseries .^ gamma_coeff


%% Perform gamma mapping 
out=in.^gamma_coeff;

%% Show some images - uncomment for debugging
%figure('Name', 'Input image'), imshow(in);
%figure('Name', 'Output image'), imshow(out);

endfunction
