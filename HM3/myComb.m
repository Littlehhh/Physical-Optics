function Output = myComb(Xsize,N)
dx = Xsize/N;    
x = -Xsize/2:dx:Xsize/2;
Output = zeros(1,length(x));

Output(x==fix(x)) = 1;