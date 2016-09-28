function [rp,tp,rs,ts,PN,TN,theta] = Fresnel(n1,n2,u1,u2) 
theta = 0:0.1:90;   %����Ƿ�Χ0-90�㣬����0.1��
a=theta*pi/180;   %�ǶȻ�Ϊ����
rp =(n2/u2*cos(a)-n1/u1*sqrt(1-(n1/n2*sin(a)).^2))./...
    (n2/u2*cos(a)+n1/u1*sqrt(1-(n1/n2*sin(a)).^2));   %p�����������ϵ��
rs = (n1/u1*cos(a)-n2/u2*sqrt(1-(n1/n2*sin(a)).^2))./...
    (n1/u1*cos(a)+n2/u2*sqrt(1-(n1/n2*sin(a)).^2));   %s�����������ϵ��
tp = 2*n1/u1*cos(a)./(n2/u2*cos(a)+n1/u1*sqrt(1-(n1/n2*sin(a)).^2));%p�������͸��ϵ��
ts = 2*n1/u1*cos(a)./(n1/u1*cos(a)+n2/u2*sqrt(1-(n1/n2*sin(a)).^2));%s�������͸��ϵ��

PS = rs.^2;
PP = rp.^2;
PN = (PS+PP)./2;  %�����
TN = 1-PN;        %�����
%TS = 1-PS;
%TP = 1-PP;


