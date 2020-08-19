slika = imread('testimg.png');

tran = scale(1.1)*rotate(30)*trans(50,50);
tran(3,1)=0.003;
tran(3,2)=0;

[k,l]=cpselect(slika, warp(slika, tran),4);

t=estimateTRZ(k,l);
t-tran
