
clc
clear all
close all
%parameters of wave
A1 = 0.5;
A2 = 50;
z = 1;    %  can't zero
lamda = 500*10e-6;


alpha1 = 90; %x
beta1 = 90; %y

alpha2 = 90; %x
beta2 = 90; %y



%parameters of CCD
m = 20;   %
n = 10;   
dd = 0.05; % ������  �������


%caculate
k = 2*pi/lamda;

E1 = Gen_PlanoE(A1,lamda,alpha1,beta1,m,n,dd,z);
% E2 = Gen_PlanoE(A,lamda,alpha2,beta2,m,n,dd,z); 
E2 = Gen_Sphere(A2,lamda,m,n,dd,z); 
E = E1+E2;

E_abs = abs(E);
E_phase = angle(E);
E_output = mat2gray(E_abs.^2);
imshow(E_output)





