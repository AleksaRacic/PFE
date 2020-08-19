function hsv = rgb2hsv(rgb)
% Convert RGB image to HSV image
%
% Input must be a floating point type between 0 and 1

%% Input validation
assert(strcmp(class(rgb), 'double') || strcmp(class(rgb), 'single'),
  'Invalid input type. Input must be single or double.');
assert(max(rgb(:)) <= 1.0 && max(rgb(:)) >= 0.0,
  'Expected input range [0, 1]');

%% Extract RGB components 
r = rgb(:,:,1);
g = rgb(:,:,2);
b = rgb(:,:,3);

%% Calculate V plane 
v=max(max(r,g),b);

%% Calculate H and S planes
h = zeros(size(v));
s = (v - min(min(r,g),b));

z = ~s;
s(z) = 1;
k = (r == v);
h(k) = (g(k) - b(k))./s(k);
k = (g == v);
h(k) = 2 + (b(k) - r(k))./s(k);
k = (b == v);
h(k) = 4 + (r(k) - g(k))./s(k);
h = h/6;
k = (h < 0);
h(k) = h(k) + 1;
h(z) = 0;

tmp = s./v;
tmp(z) = 0;
k = (v~=0);
s(k) = tmp(k);
s(~v) = 0;


%% Concat output planes 
hsv = cat(3, h, s, v);

%% Display the components - uncomment for debugging
%figure('Name', 'H-component'), imshow(h)
%figure('Name', 'S-component'), imshow(s)
%figure('Name', 'V-component'), imshow(v)

endfunction
