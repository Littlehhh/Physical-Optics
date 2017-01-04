function Output = mySinc2D(Xsize,Ysize,N)
X = mySinc(Xsize,N);
Y = mySinc(Ysize,N);
Output = X'*Y;