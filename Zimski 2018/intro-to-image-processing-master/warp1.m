function outImage = warp1 (image, h)
  srcSize = size(image);
  outSize = srcSize;
  outImage = uint8(zeros(outSize));

  for ii=1:outSize(1); % y
   for jj=1:outSize(2); % x
     
     D=h*[jj;ii;1];
     

%% Napisi funkciju koja mapira koordinate ulazne slike na koordinate izlazne slike 
%% ------- YOUR CODE HERE ------
k=uint16(D(1,1));  %x
l=uint16(D(2,1));  %y
if(k>0 && k<=outSize(2) && l>0 && l<=outSize(1))
          outImage(ii,jj) = image(l,k);
          
endif
endfor
endfor


% koristeci matricu homografije h
endfunction
