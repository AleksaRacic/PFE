slika = imread('lena.jpg');
mat = zeros(size(slika));
mat(50:end-50,50:end-50 , 1:3)=slika(50:end-50,50:end-50 , 1:3);
imshow(mat)
