function [rp,tp,rs,ts,PN,TN,theta] = Fresnel(n1,n2,u1,u2) 
theta = 0:0.1:90;   %入射角范围0-90°，步距0.1°
a=theta*pi/180;   %角度化为弧度
rp =(n2/u2*cos(a)-n1/u1*sqrt(1-(n1/n2*sin(a)).^2))./...
    (n2/u2*cos(a)+n1/u1*sqrt(1-(n1/n2*sin(a)).^2));   %p分量振幅反射系数
rs = (n1/u1*cos(a)-n2/u2*sqrt(1-(n1/n2*sin(a)).^2))./...
    (n1/u1*cos(a)+n2/u2*sqrt(1-(n1/n2*sin(a)).^2));   %s分量振幅反射系数
tp = 2*n1/u1*cos(a)./(n2/u2*cos(a)+n1/u1*sqrt(1-(n1/n2*sin(a)).^2));%p分量振幅透射系数
ts = 2*n1/u1*cos(a)./(n1/u1*cos(a)+n2/u2*sqrt(1-(n1/n2*sin(a)).^2));%s分量振幅透射系数

PS = rs.^2;
PP = rp.^2;
PN = (PS+PP)./2;  %反射比
TN = 1-PN;        %折射比
%TS = 1-PS;
%TP = 1-PP;


