function [H] = estimateTRZ (p1, p2)


thetasum=0;
scalesum=0;
dsum=0;
csum=0;
u=1;
count=0;

for ii=1:size(p1)(1)
  for jj= ii+1:size(p1)(1)
    

      m=double([p2(ii,1),p2(ii,2),1,0; 
        p2(ii,2),-p2(ii,1),0,1;
        p2(jj,1),p2(jj,2),1,0;
        p2(jj,2),-p2(jj,1),0,1]);


      r=[p1(ii,1);p1(ii,2);p1(jj,1);p1(jj,2)];

      o=m\r;
      
      %scalesum
      
      scale1=det([o(1,1),o(2,1);-o(2,1),o(1,1)]);
      
      scalesum=scalesum+ scale1;
      
      %thetasum

      theta=asin(o(2,1)/scale1);
      if(isreal(theta))
        thetasum=thetasum+theta;
        count=count+1;
      endif
      %avrty
      
      dsum=dsum+o(4,1);
      
      %avrtx
      
      csum=csum+o(3,1);
      
      %counter
      
      u=u+1;
      
  endfor
endfor

%averages

avrtheta=thetasum/count;
avrscale=scalesum/u;
avrd = dsum/u;
avrc = csum/u;


a=avrscale*cos(avrtheta);
b=avrscale*sin(avrtheta);
c=avrc;
d=avrd;

H=[a,b,c;-b,a,d;0,0,1;];
endfunction
