function Output = mySinc(Xsize,N)
%���ɸ�˹����
dx = Xsize/N;    
x = -Xsize/2:dx:Xsize/2;
Output = sin(pi*x)./(pi*x);
Output(x==0) = 1;