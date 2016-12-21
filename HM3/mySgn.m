function Output = mySgn(Xsize,N)

% Xsize = 10;
dx = Xsize/N;    
x = -Xsize/2:dx:Xsize/2;
Output = zeros(1,length(x));
Output(x<0) = -1;
Output(x>0) = 1;