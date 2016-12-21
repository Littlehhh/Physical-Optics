function output = myRect(xsize,deltaN)%
%%Rect function
%%2016 10 31


Lx = xsize;%20;%mm
N = deltaN;%100;
dx = Lx/N;
c = 2; %2;
u = -Lx/2:dx:Lx/2;

[a,b] = size(u);
output =zeros(a,b);
output(abs(u)<=c) = 1/c;

