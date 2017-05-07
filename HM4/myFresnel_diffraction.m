% function Out = myFresnel_diffraction(Input,lamda,z,sizexSLM,sizeySLM)
clc
% close  all
clear

 Input = InputPicture();

if size(Input,3)==3
    Input = rgb2gray(Input);
end
Input = double(Input)/255;
lamda = 532/1000000;
k = 2*pi/lamda;
% sizexSLM = 128;
% sizeySLM = 128;
sizexSLM = 25 * lamda;
sizeySLM = 25 * lamda;
% %采样率
 [length,width] = size(Input);
 dx = sizexSLM/length;
 dy = sizeySLM/width;
% %传播距离
z = 100 * lamda; %mm

%预处理
xx = -sizexSLM/2:dx:sizexSLM/2-dx;
yy = -sizeySLM/2:dx:sizeySLM/2-dy;
[x,y] = meshgrid(xx,yy);
h = exp(1i*k*(x.^2+y.^2)./(2*z));

% Output = fftshift(ifft2(fft2(Input).*fft2(h)));  %利用卷积定理将菲涅尔衍射转化为傅里叶变换的乘积
% Output = conv2(Input,h,'same'); 
Output = ifft2(fft2(Input).*fft2(h));
Out = exp(1i*k*z).*Output/(1i*lamda*z);
%  Out = fftshift(Out);
% Out_abs = mat2gray(abs(Out));
% Out_angle = mat2gray(angle(Out));
%Out = uint8(Out);
% Out = fftshift(Out);
figure
imshow(abs(Out),[]);
% imshow(Out_abs,[]);
% figure
% imshow(Out_angle);
% OutputPicture(Out_abs);
normal = abs(Out)/max(abs(Out(:)));
figure
plot(normal(250,:))
figure()
mesh(abs(Out));
figure
plot(abs(Out(250,:)))
figure
plot(phase(Out(250,:)))


