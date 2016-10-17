function E = Gen_PlanoE(A,lamda,alpha,beta,m,n,dd,z) 


% clc
% clear all
% close all
% parameters of wave
%A = 0.5;
%z = 1;    %  can't zero
%lamda = 500*10e-6;
%alpha = 80; %x
%beta = 90; %y
%parameters of CCD
%m = 20;   %
%n = 10;   
%dd = 0.1; % 采样率  采样间隔
M = m/dd;
N = n/dd;

%caculate
k = 2*pi/lamda;
E = ones(N,M);
cos_gama = sqrt((abs(1-cosd(alpha).^2-cosd(beta).^2)));
[X,Y] = meshgrid(-m/2:dd:(m/2-dd),-n/2:dd:(n/2-dd));

E = E.*A.*exp(1i*k*(X.*cosd(alpha)+Y.*cosd(beta)+z*cos_gama));
E_abs = abs(E);
E_phase = angle(E);



