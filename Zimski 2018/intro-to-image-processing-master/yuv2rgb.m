function rgb = yuv2rgb(yuv)
% Convert YUV image to RGB image
%
% Input must be a floating point type

%% Input validation
assert(strcmp(class(yuv), 'double') || strcmp(class(rgb), 'single'),
  'Invalid input type. Input must be single or double.');

%% Extract RGB components
Y = yuv(:,:,1);
U = yuv(:,:,2);
V = yuv(:,:,3);

%% Calculate R plane 
R= Y+1.13983*V;

%% Calculate G plane 
G = Y -0.39465*U -0.58060*V;


%% Calculate B plane 
B = Y + 2.03211*U;

%% Concat output planes
rgb = cat(3, R, G, B);

% Display the components - uncomment for debugging
%figure('Name', 'R-component'), imshow(R)
%figure('Name', 'G-component'), imshow(G)
%figure('Name', 'B-component'), imshow(B)

endfunction
