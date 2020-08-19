function out = sobel_edge_detection(in)
% Detect edges in input image using Sobel kernel

%% Extract input luma (Y-component)
yuv = rgb2yuv(in);
y_in = yuv(:,:,1);

%% Detect top edges 
mtop=[1,2,1;0,0,0;-1,-2,-1];
ptop=linear_filtering(y_in,mtop);
%% Detect left edges 
mleft=[-1,0,1;-2,0,2; -1,0,1];
pleft=linear_filtering(y_in,mleft);
%% Detect bottom edges 
mbot=[-1,-2,-1;0,0,0; 1,2,1];
pbot=linear_filtering(y_in,mbot);
%% Detect right edges 
mright=[1,0,-1;2,0,-2;1,0,-1];
pright=linear_filtering(y_in,mright);
%% Add them all up 
out=pright+ptop+pbot;

%% Clip the output to [0,1]
out(out > 1) = 1;
out(out < 0) = 0;

%% Show some images - uncomment for debugging
%figure('Name', 'Top edges'), imshow(left_edges)
%figure('Name', 'Input image'), imshow(in)
%figure('Name', 'Egdes'), imshow(out)

endfunction
