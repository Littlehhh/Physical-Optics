function Output = myLens(Input_BeLens,Focal,Lx,Ly,waveLength)
[length,width] = size(Input_BeLens);
dx = Lx/length;
dy = Ly/width;
xx = -Lx/2:dx:Lx/2-dx;
yy = -Ly/2:dx:Ly/2-dy;
[x,y] = meshgrid(xx,yy);
k = 2*pi/waveLength;
%‘§¥¶¿Ì
tLens = exp(-1i*k*(x.^2+y.^2)./(2*Focal));

Output = Input_BeLens.*tLens;