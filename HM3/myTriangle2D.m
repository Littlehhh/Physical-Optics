function Output = myTriangle2D(Xsize,Ysize)

% Xsize = 100;
% Ysize = 100;

X = myTriangle(Xsize);
Y = myTriangle(Ysize);
Output = X'*Y;
