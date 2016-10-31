clc
clear
close all
sizex = 50;
sizey = 50;
deltaN = 100;
constc = 2;
output = myRect2D(sizex,sizey,deltaN,constc);
surf(output)
figure
ffoutput = abs(fftshift(fft2(output)));
surf(ffoutput);

