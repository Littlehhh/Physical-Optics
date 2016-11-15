function Output = mySgn(Xsize)

% Xsize = 10;
dx = 0.1;    
x = -Xsize/2:dx:Xsize/2;
Output = zeros(1,length(x));
Output(x<0) = -1;
Output(x>0) = 1;