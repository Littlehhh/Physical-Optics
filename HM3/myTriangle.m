function Output = myTriangle(Xsize,N)

% Xsize = 10;
dx = Xsize/N;    
x = -Xsize/2:dx:Xsize/2;
Output = zeros(1,length(x));
Output(abs(x)<=1) = 1-abs(x(abs(x)<=1));
