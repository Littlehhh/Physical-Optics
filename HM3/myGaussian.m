function Output = myGaussian(Xsize,N)
%生成高斯函数
dx = Xsize/N;    
x = -Xsize/2:dx:Xsize/2;
Output = exp(-pi*x.^2);