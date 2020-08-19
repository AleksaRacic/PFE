function outImage = rotateImage(inImage, theta)
  theta = theta/180*pi; % deg2rad
  outSize = size(inImage);
  outImage = uint8(zeros(outSize));
  h = outSize(1);
  w = outSize(2);
  
  for y2=1:h;
      for x2=1:w;
      
        x1=cos(theta)*x2 + sin(theta)*y2;
        y1=cos(theta)*y2 - sin(theta)*x2;
        y1=uint16(y1);
        x1=uint16(x1);
        
        
        if(x1>0 && x1<=w && y1>0 && y1<=h)
          outImage(y2,x2) = inImage(y1,x1);
          
        endif

      endfor 
  endfor
  
endfunction
