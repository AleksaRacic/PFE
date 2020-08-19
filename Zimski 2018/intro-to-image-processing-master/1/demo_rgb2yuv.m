slika = imread('download.jpg');
slika = double(slika)/255;
slikayuv = rgb2yuv(slika);

figure, imshow(slikayuv(:, :, 2));

