function y_out = median_filter(in, kernel)
% Add impulse noise to the input image and de-noise with a median filter

%% Default parameters
narginchk(1, 2)
if nargin < 2
  kernel_size = [3 3];
endif

%% Input validation
assert(length(kernel) == 2,
  'A 2-element vector expected as the kernel size.');

%% Extract input luma (Y) 
yuv = rgb2yuv(in);
y_in = yuv(:,:,1);

%% Add impulse noise to input Y
y_noisy = imnoise(y_in, 'salt & pepper');



k=(kernel(1,1)-1)/2;
l=(kernel(1,2)-1)/2;

%% Pad noisy luma with zeros 
pad=zeros(size(y_noisy)(1,1)+2*k, size(y_noisy)(1,2)+2*l);
y_out=zeros(size(y_in));
pad=pad(k+1:end-k, l+1:end-l)+y_noisy;
%% Apply median filtering 
for ii=k+1:size(y_noisy)(1,1)-k
  for jj=l+1:size(y_noisy)(1,2)-l
    
    a=ii-k;
    b=ii+k;
    d=jj+l;
    c=jj-l;
    
y_out(ii,jj)=sum(sum(in(a:b,c:d)))/16;

endfor
endfor

% Remember that the output image should have the same dimensions as the input
% image (before padding).
%% Show some images - uncomment for debugging
figure('Name', 'Input luma'), imshow(y_in)
figure('Name', 'Noisy luma'), imshow(y_noisy)
figure('Name', 'De-noised luma'), imshow(y_out)

endfunction
