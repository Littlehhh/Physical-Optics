
clc
close  all
clear

Input = InputPicture();

if size(Input,3)==3
    Input = rgb2gray(Input);
end
Input = double(Input)/255;
lamda = 532/1000000;

sizexSLM = 12;
sizeySLM = 12;
%������

%��������
zBeLens = 800; %mm
zAfterLen = 800;
Focal = 400;
%͸��ǰ����������
ImgBeforeLens = PropCov(Input,lamda,zBeLens,sizexSLM,sizeySLM);
myOutput(ImgBeforeLens)
%��͸��
% ImgAftLens = myLens(ImgBeforeLens,Focal,sizexSLM,sizeySLM,lamda);
% myOutput(ImgAftLens)
% %͸�������������
% Out = PropCov(ImgAftLens,lamda,zAfterLen,sizexSLM,sizeySLM);
% myOutput(Out)


% Out_abs = mat2gray(abs(Out));
% Out_angle = mat2gray(angle(Out));
% %Out = uint8(Out);
% figure
% imshow(Out_abs);
% figure
% imshow(Out_angle);
% OutputPicture(Out_abs);







