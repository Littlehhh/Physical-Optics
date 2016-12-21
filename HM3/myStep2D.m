function Output = myStep2D(Xsize,Ysize,N)
X = myStep(Xsize,N);
Y = myStep(Ysize,N);
Output =Y'*X;