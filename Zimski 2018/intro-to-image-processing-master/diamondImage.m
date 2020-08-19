function outImage = diamondImage(inImage, theta)
    theta = theta/180*pi; % deg2rad
    outSize = size(inImage);
    outImage = uint8(zeros(outSize));
    h = outSize(1);
    w = outSize(2);
    
    for y2=1:h;
        for x2=1:w;
        
%% Za sve koordinate x2,y2 nadji koordinate ulazne slike 
%% ------- YOUR CODE HERE ------

          
        endfor
    endfor
endfunction
