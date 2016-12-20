function varargout = ZeemanEffect(varargin)
% ZEEMANEFFECT MATLAB code for ZeemanEffect.fig
%      ZEEMANEFFECT, by itself, creates a new ZEEMANEFFECT or raises the existing
%      singleton*.
%
%      H = ZEEMANEFFECT returns the handle to a new ZEEMANEFFECT or the handle to
%      the existing singleton*.
%
%      ZEEMANEFFECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZEEMANEFFECT.M with the given input arguments.
%
%      ZEEMANEFFECT('Property','Value',...) creates a new ZEEMANEFFECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ZeemanEffect_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ZeemanEffect_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ZeemanEffect

% Last Modified by GUIDE v2.5 19-Dec-2016 23:15:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ZeemanEffect_OpeningFcn, ...
                   'gui_OutputFcn',  @ZeemanEffect_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ZeemanEffect is made visible.
function ZeemanEffect_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ZeemanEffect (see VARARGIN)

% Choose default command line output for ZeemanEffect
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ZeemanEffect wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ZeemanEffect_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
% --- Executes on button press in Caculate.

function Caculate_Callback(hObject, eventdata, handles)
% hObject    handle to Caculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
l = Zeeman();

axes(handles.ZeemanPlot)
for i=1:length(l)
    x=0:0.01:10;
    y = ones(1,length(x));
    y=l(i)*y;
    hold on;
    plot(x,y,'r');%作出谱线图
    
    
end
ylabel('谱线波长/nm');
handles.l = l;
guidata(hObject, handles);



function l = Zeeman()
%计算塞曼效应谱线
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
        if(abs(M1-M2)<=1)   %跃迁定则
            ddE(i)=u*B*(M1*g1-M2*g2);   %计算分裂后的能级间距
            dE(i)=dE0+ddE(i);
            f(i)=dE(i)/h;
            l(i)=3e8/f(i)*1e9;  %计算谱线波长
            i=i+1;
        end
    end
end


% --- Executes on button press in FP.
function FP_Callback(hObject, eventdata, handles)
% hObject    handle to FP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
z = 1000;
%parameters of CCD
% m = 20;   %
% n = 20;   
% dd = 0.02; % 采样率  采样间隔
m = 80;   %
n = 80;   
dd = 0.08; % 采样率  采样间隔

M = m/dd;
N = n/dd;
EE = zeros(N,M);
A = 1;
rio = 0.9;
l = handles.l*1e-6;
for j = 1:length(l)
    A0 = (1-rio)*A;
    E = Gen_Sphere(A0,l(j),m,n,dd,z); 
    for i=1:12
        z = z+2;
        A0 = rio*A0;
        E1 = Gen_Sphere(A0,l(j),m,n,dd,z); 

        E = E+E1;
    %     E_output = abs(E.^2);
    %     figure
    %     imshow(E_output,[])
    %     figure
    %     mesh(E_output)
    %     pause
    end
    E = abs(E.^2);
%     E(E<max(max((E)/10)))=0;
    EE = EE+E;
%     lamda = lamda+1e-9;
end
axes(handles.F_P)
imshow(EE,[])
figure
imshow(EE,[])
