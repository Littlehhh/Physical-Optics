% B=input('请输入磁场大小/T：');
% L1=input('请输入L1：');
% S1=input('请输入S1：');
% J1=input('请输入J1：');
% L2=input('请输入L2：');
% S2=input('请输入S2：');
% J2=input('请输入J2：');
% l0=input('请输入分裂前的谱线波长l/nm：');
B=1;
L1=0;
S1=1;
J1=1;
L2=1;
S2=1;
J2=2;
l0=546.1;

f0=3e8/l0*1e9;%计算谱线频率
u=9.274e-24;%玻尔磁子
h=6.626e-34;%普朗克常量
g1=1+(J1*(J1+1)-L1*(L1+1)+S1*(S1+1))/2/J1/(J1+1);%计算朗德因子
g2=1+(J2*(J2+1)-L2*(L2+1)+S2*(S2+1))/2/J2/(J2+1);
dE0=h*f0;%计算分裂前的能级间距
i=1;
for M1=-J1:J1
    for M2=-J2:J2
        if(abs(M1-M2)<=1)%跃迁定则
            ddE(i)=u*B*(M1*g1-M2*g2);%计算分裂后的能级间距
            dE(i)=dE0+ddE(i);
            f(i)=dE(i)/h;
            l(i)=3e8/f(i)*1e9;%计算谱线波长
            i=i+1;
        end
    end
end
K=i-1;
for j=1:K
    x=0:0.01:10;
    y = ones(1,length(x));
    y=l(j)*y;
    plot(x,y,'r');%作出谱线图
    hold on;
    ylabel('谱线波长/nm');
end