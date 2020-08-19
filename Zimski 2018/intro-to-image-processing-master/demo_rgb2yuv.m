slika = imread('kockice/dices10.jpg');
slika5 = imcrop(slika,[70 70 1000 500]);
slika2=im2double(slika5(:, :, 2));

slika3= im2bw(slika2, 0.25);
slika4=medfilt2(slika3, [9 9]);
slika6 = imcrop(slika4,[10 10 980 480]);

[L, NUM] = bwlabeln(imcomplement(slika4));




imshow(slika6);
NUM-4
