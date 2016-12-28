function [rp,tp,PP,TP,rs,ts,PS,TS,PN,TN,theta] = Fresnel(n1,n2,u1,u2) 
%n1 incident lingt index
%n2 deflect light index
theta = 0:0.1:90;   %����Ƿ�Χ0-90�㣬����0.1��

a=theta*pi/180;   %�ǶȻ�Ϊ����
%temp=(1-(n1/n2*sin(a)).^2);
%temp(temp<0) = 0;
%b = sqrt(temp);
b = asin(n1/n2*sin(a));
% b(b>=1)=1;
b = cos(b);
rp =(n2/u2*cos(a)-n1/u1*b)./...
    (n2/u2*cos(a)+n1/u1*b);   %p�����������ϵ��
rs = (n1/u1*cos(a)-n2/u2*b)./...
    (n1/u1*cos(a)+n2/u2*b);   %s�����������ϵ��
tp = 2*n1/u1*cos(a)./(n2/u2*cos(a)+n1/u1*b);%p�������͸��ϵ��
ts = 2*n1/u1*cos(a)./(n1/u1*cos(a)+n2/u2*b);%s�������͸��ϵ��
if n1>n2
    [max,index] = findpeaks(real(rp));
    rp(index:end) = max;
    [max,index] = findpeaks(real(rs));
    rs(index:end) = max;
    [max,index] = findpeaks(real(tp));
    tp(index:end) = max;
    [max,index] = findpeaks(real(ts));
    ts(index:end) = max;
end
PS = rs.^2;
PP = rp.^2;
TS = 1-PS;
TP = 1-PP;
PN = (PS+PP)./2;  %�����
TN = 1-PN;        %�����



