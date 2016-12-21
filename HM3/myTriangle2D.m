function Output = myTriangle2D(Xsize,Ysize,N)

% Xsize = 100;
% Ysize = 100;

X = myTriangle(Xsize,N);
Y = myTriangle(Ysize,N);
Output = X'*Y;
