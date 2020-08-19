function out = contrast_stretch(in, out_range)
% Stretch the values of an image to fit the given range

%% Default parameters
narginchk(1,2);
if nargin < 2
  out_range = [0 1];
endif

%% Input validation
assert(strcmp(class(in), 'double') || strcmp(class(in), 'single'),
  'Invalid input type. Input must be single or double.');
assert(length(out_range) == 2,
  'Range should be a vector of length 2 ([min, max]).');
max1=max(max(in));
min1=min(min(in));
a=out_range(1,1);
b=out_range(1,2);
%% Stretch the output image 
out=zeros(size(in));


[x,y]=size(in);

for ii = 1:x
  for jj=1:y
    out(ii,jj)=a+(in(ii,jj)-min1)*(b-a)/(max1-min1);
 endfor
  endfor

%% Show some images and plots - uncomment for debugging
%figure('Name', 'Original image'), imshow(in)
%figure('Name', 'Output image'), imshow(out)
%figure('Name', 'Original image histogram'), bar(mat_histogram(in))
%figure('Name', 'Output image histogram'), bar(mat_histogram(out))

endfunction
