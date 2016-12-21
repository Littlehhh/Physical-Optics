function Output = myComb2D(Xsize,Ysize,N)

X = myComb(Xsize,N);
Y = myComb(Ysize,N);
Output = X'*Y;