function Output = myCirc(Xsize,Ysize,N)
% Xsize=10;
% Ysize=10;
dx = Xsize/N; 

x = -Xsize/2:dx:Xsize/2;
y = -Ysize/2:dx:Ysize/2;
Output = zeros(length(x),length(y));
for i = 1:length(x)
    for j = 1:length(y)
        if sqrt(x(i)^2+y(j)^2)<=1
            Output(i,j) = 1;
        end
    end
end



% figure
% surf(Output)
% figure
% ffoutput = abs(fftshift(fft2(Output)));
% surf(ffoutput);