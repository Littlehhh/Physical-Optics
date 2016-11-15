clc
clear all
close all
% sizex = 50;
% sizey = 100;
% deltaN = 100;
% constc = 2;
% output = myRect2D(sizex,sizey,deltaN,constc);
% surf(output)
% figure
% ffoutput = abs(fftshift(fft2(output)));
% surf(ffoutput);
output = myComb2D(10,10);
figure
surf(output)
figure
ffoutput = abs(fftshift(fft2(output)));
surf(ffoutput);