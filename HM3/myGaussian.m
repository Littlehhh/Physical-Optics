function Output = myGaussian(Xsize,N)
%���ɸ�˹����
dx = Xsize/N;    
x = -Xsize/2:dx:Xsize/2;
Output = exp(-pi*x.^2);