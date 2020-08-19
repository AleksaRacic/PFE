function out = linear_filtering(in, kernel)
% Filter the input image with the given kernel

%% Default parameters
narginchk(1, 2)
if nargin < 2
  kernel = ones(3,3); % identity filter
endif

%% Input validation
assert(length(size(in)) == 2,
  'A matrix (2-D array) expected as the input image.');
assert(length(size(kernel)) == 2,
  'A matrix (2-D array) expected as the input kernel.');
assert((mod(size(kernel, 1), 2) == 1) && (mod(size(kernel, 2), 2) == 1),
  'Kernel must have odd dimensions.');
k=(size(kernel)(1,1)-1)/2;
l=(size(kernel)(1,2)-1)/2;

%% Pad image with zeros 
%out=zeros(size(in));
out=in;
kersum=sum(kernel(:));
% Do not change the input image, because we need to display it later. Use
% another variable.
%% Apply kernel 
for ii=k+1:size(in)(1,1)-k
  for jj=l+1:size(in)(1,2)-l
    
    a=ii-k;
    b=ii+k;
    d=jj+l;
    c=jj-l;
    
out(ii,jj)=sum(sum((in(a:b,c:d).*kernel)));

endfor
endfor


% Remember that the output image should have the same dimensions as the input
% image (before padding).
% NOTE: As a convention, we are performing division (kernel normalization)
% before summing.
%% Show some images - uncomment for debugging
%figure('Name', 'Input image'), imshow(in)
%figure('Name', 'Output image'), imshow(out)

endfunction
