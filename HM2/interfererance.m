
clc
clear all
close all
%parameters of wave
A1 = 0.5;
A2 = 0.3;
z = 1;    %  can't zero
lamda = 500e-6;


alpha1 = 80; %x
beta1 = 90; %y

alpha2 = 100; %x
beta2 = 90; %y



%parameters of CCD
m = 2;   %
n = 1;   
dd = 0.01; % 采样率  采样间隔


%caculate
k = 2*pi/lamda;

E1 = Gen_PlanoE(A1,lamda,alpha1,beta1,m,n,dd,z);
E2 = Gen_PlanoE(A2,lamda,alpha2,beta2,m,n,dd,z); 
% E2 = Gen_Sphere(A2,lamda,m,n,dd,z); 
E = E1+E2;

E_abs = abs(E);
% E_phase = angle(E);
% E_output = mat2gray(E_abs.^2);
% imshow(E_output,[])
imshow(E_abs,[])




