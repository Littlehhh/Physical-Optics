function Output = myStep(Xsize,N)

dx = Xsize/N;    
x = -Xsize/2:dx:Xsize/2;
Output = zeros(1,length(x));
Output(x==0)=1/2;
Output(x>0)=1;