function [H] = estimateProj(p1, p2)
  %% izracunava projektivnu homografiju iz tacaka korespondencije p1 i p2
  
%% prebaci tacke u homogene koordinate
  cols = size(p1,1);
  p1 = cat(2, p1, ones(cols, 1));
  p2 = cat(2, p2, ones(cols, 1));
  
  x1 = p1(:, 1);
  y1 = p1(:, 2);
  w1 = p1(:, 3);
  
  x2 = -w1(1)*p2(1,:)';
  y2 = y1(1)*p2(1,:)';
  w2 = w1(1)*p2(1,:)';
  k2=zeros(1,3);
  r2=-x1(1)*p2(1,:)';
  
%% Postavi sistem jednacina 
    
    N=double([zeros(1,3), -w1(1)*p2(1,:) ,y1(1)*p2(1,:); 
              w1(1)*p2(1,:),zeros(1,3), -x1(1)*p2(1,:)]);
    
    
    for ii=2:size(p1)(1)
   
      m=double([zeros(1,3), -w1(ii)*p2(ii,:) ,y1(ii)*p2(ii,:); 
              w1(ii)*p2(ii,:),zeros(1,3), -x1(ii)*p2(ii,:)]);
     
      N=cat(1,N,m);
     
     
   endfor
   
%%trazenje null space
    
  h=null(N);    

%Popunjavanje matrice
  
  H=[h(1),h(2),h(3);h(4),h(5),h(6);h(7),h(8),h(9)];
 

  H = H/H(3,3);
  
endfunction
