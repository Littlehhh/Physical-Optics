function Output = myGaussian2D(Xsize,Ysize,N)

X = myGaussian(Xsize,N);
Y = myGaussian(Ysize,N);
Output = X'*Y;



