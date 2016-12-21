function output = myRect2D(sizex,sizey,deltaN)
%%Rect2D function 

% clc
% clear
% close all

Lx = sizex;
Ly = sizey;
N = deltaN;



tempx = myRect(Lx,N);
tempy = myRect(Ly,N);
%output = zeros();

output = tempx'*tempy;








