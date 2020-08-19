function out = izd(in, out_range)
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
  a=out_range(1,1);
  b=out_range(1,2);
  out=zeros(size(in));
  out=(in>a) & (in<b);
  
 
  
  out=out+in;
  
  endfunction