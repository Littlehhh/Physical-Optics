clc
clear all
% close all

lamda = 546.1e-6;



% z = 10000;
% z2 = 10500;
%caculate
k = 2*pi/lamda;


z = 1000;
%parameters of CCD
% m = 20;   %
% n = 20;   
% dd = 0.02; % 采样率  采样间隔
m = 80;   %
n = 80;   
dd = 0.1; % 采样率  采样间隔

M = m/dd;
N = n/dd;
EE = zeros(N,M);
A = 1;
rio = 0.9;
l =[544.7122  546.7966  548.8970  544.0209  546.1000  548.1950  543.3314  545.4052  547.4949]*1e-6;
for j = 1:6
    A0 = (1-rio)*A;
    E = Gen_Sphere(A0,l(j),m,n,dd,z); 
    for i=1:50
        z = z+2;
        A0 = rio*A0;
        E1 = Gen_Sphere(A0,l(j),m,n,dd,z); 

        E = E+E1;
%         E_output = abs(E.^2);
    %     figure
    %     imshow(E_output,[])
    %     figure
    %     mesh(E_output)
    %     pause
    end
    E = abs(E.^2);
%     E(E<max(max((E)/3)))=0;
    EE = EE+E;
%     EE = abs(EE.^2);
% EE(EE<max(max((EE)/3)))=0;
%     lamda = lamda+1e-9;
end



% E1 = Gen_PlanoE(A1,lamda,alpha1,beta1,m,n,dd,z);
% E2 = Gen_PlanoE(A2,lamda,alpha2,beta2,m,n,dd,z); 

% E2 = Gen_Sphere(A2,lamda,m,n,dd,z2); 
% lamda1=550e-6;
% E4 = Gen_Sphere(A2,lamda1,m,n,dd,z2);
% E3 = Gen_Sphere(A1,lamda1,m,n,dd,z1); 
% E = E1+E2;
% E = E1+E2+E3+E4;

% E_output = abs(EE);
% E_phase = angle(E);
% E_output = mat2gray(E_abs.^2);
% EE = abs(EE.^2);
% EE(EE<max(max((EE)/3)))=0;
E_output = EE;
% E_output = abs(E.^2);
% E_output(E_output<max(max((E_output)/10)))=0;
figure
imshow(E_output,[])
figure
% mesh(E_output)

plot(1:800,EE(400,:))

