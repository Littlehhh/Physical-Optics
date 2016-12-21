function Output = mySgn2D(Xsize,Ysize,N)

X = mySgn(Xsize,N);
Y = mySgn(Ysize,N);
Output = Y'*X;