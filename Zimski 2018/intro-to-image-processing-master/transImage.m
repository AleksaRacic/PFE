function outImage = transImage(inImage, t)
    outSize = size(inImage);
    outImage = uint8(zeros(outSize));
    h = outSize(1);
    w = outSize(2);
    
    for y2=1:h;
        for x2=1:w;
          x1 = x2 - t(1);
          y1 = y2 - t(2);
          
          if(x1>0 && x1<=w && y1>0 && y1<=h)
          outImage(y2,x2,:) = inImage(y1,x1);
          endif

        endfor
    endfor
endfunction
