function E = Gen_Sphere(A,lamda,m,n,dd,z) 

% clc
% clear all
% close all
%球面波
% parameters of wave
% A = 0.5;
% z = 1;    %  can't zero
% lamda = 500*10e-6;
% % alpha = 80; %x
% % beta = 90; %y
% 
% %parameters of CCD
% m = 20;   %
% n = 10;   
% dd = 0.05; % 采样率  采样间隔
M = m/dd;
N = n/dd;

k = 2*pi/lamda;
E = ones(N,M);
[X,Y] = meshgrid(-m/2:dd:(m/2-dd),-n/2:dd:(n/2-dd));

%caculate
r = sqrt(X.^2+Y.^2+z^2);
E = E.*(A./r).*exp(1i*k.*r);
% E_abs = abs(E);
% E_phase = angle(E);
% E_output = mat2gray(E_abs.^2);
% imshow(E_output)








