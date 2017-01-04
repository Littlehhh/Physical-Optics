function Output = mySinc(Xsize,N)
%生成高斯函数
dx = Xsize/N;    
x = -Xsize/2:dx:Xsize/2;
Output = sin(pi*x)./(pi*x);
Output(x==0) = 1;