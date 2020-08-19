function h = mat_histogram(mat)
% Calculate the image histogram

%% Input validation
assert(length(size(mat)) == 2,
  'Input must be a matrix, i.e. a 2-dimensional array');

%% Input conversion
mat = im2uint8(mat);

%% Initialize output vector
max_num = int32(intmax('uint8')); % this is safe because of the above conversion
h = zeros(1, max_num + 1);
d=mat(:);
%% Calculate histogram 
[x,y]=size(mat);
for ii = 1:x*y
  
    h(d(ii)+1)=h(d(ii)+1)+1;
 
  endfor
endfunction
