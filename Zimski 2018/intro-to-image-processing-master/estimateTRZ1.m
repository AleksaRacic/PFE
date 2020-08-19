function [H] = estimateTRZ1 (p1, p2)
  
  m=double([p2(1,1), p2(1,2),1,0; 
            p2(1,2),-p2(1,1),0,1]);
  
  t=double([p1(1,1);p1(1,2)]);
  
  for ii=2:size(p1)(1)
   
     tmp=double([p2(ii,1), p2(ii,2),1,0; 
                 p2(ii,2),-p2(ii,1),0,1]);
     tmp1=double([p1(ii,1);p1(ii,2)]);
   
     m=cat(1,m,tmp);
     t=cat(1,t,tmp1);
     
   endfor
   
   o=m'*m\m'*t;
  
   H=[o(1,1),o(2,1),o(3,1);-o(2,1),o(1,1),o(4,1);0,0,1;];