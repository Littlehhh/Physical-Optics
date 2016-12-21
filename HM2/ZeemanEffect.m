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

% Last Modified by GUIDE v2.5 21-Dec-2016 19:42:56

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
set(handles.l1,'String','0');
set(handles.s1,'String','1');
set(handles.j1,'String','1');
set(handles.l2,'String','1');
set(handles.s2,'String','1');
set(handles.j2,'String','2');
set(handles.b,'String','1');
set(handles.lamda,'String','546.1');

set(handles.length,'String','150');
set(handles.width,'String','150');
set(handles.dd,'String','0.2');
set(handles.d,'String','0.9');
set(handles.rio,'String','0.99');
axes(handles.fpplot);
axis off;
set(handles.FP,'Enable','off');
set(handles.show,'Enable','off');
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

L1 = str2double(get(handles.l1,'String'));
S1 = str2double(get(handles.s1,'String'));
J1 = str2double(get(handles.j1,'String'));
L2 = str2double(get(handles.l2,'String'));
S2 = str2double(get(handles.s2,'String'));
J2 = str2double(get(handles.j2,'String'));
 
B = str2double(get(handles.b,'String'));
lamda = str2double(get(handles.lamda,'String'));
l = Zeeman(L1,S1,J1,L2,S2,J2,B,lamda);

axes(handles.ZeemanPlot);
cla reset;
for i=1:length(l)
    x=0:0.01:10;
    y = ones(1,length(x));
    y=l(i)*y;
    hold on;
    plot(x,y,'r');%作出谱线图
end
ylabel('谱线波长/nm');
% hold off;
handles.l = l;
set(handles.FP,'Enable','on');

guidata(hObject, handles);



function l = Zeeman(L1,S1,J1,L2,S2,J2,B,lamda)
%计算塞曼效应谱线
% B=1;
% L1=0;
% S1=1;
% J1=1;
% L2=1;
% S2=1;
% J2=2;
% l0=546.1;



f0=3e8/lamda*1e9;%计算谱线频率
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
z = 1000;


%parameters of CCD
m = str2double(get(handles.length,'String'));   %
n = str2double(get(handles.width,'String'));   
dd = str2double(get(handles.dd,'String')); % 采样率  采样间隔

M = m/dd;
N = n/dd;
EE = zeros(N,M);
A = 1;
rio = str2double(get(handles.rio,'String'));
d = str2double(get(handles.d,'String'));
%l =[546.0861  546.1070  546.1278  546.0791  546.1000  546.1209  546.0722  546.0930  546.1139]*1e-6;
l = sort(handles.l*1e-6);
for j = 1:length(l)
    A0 = (1-rio)*A;
    E = Gen_Sphere(A0,l(j),m,n,dd,z); 
    for i=1:20
        z = z+d;
        A0 = rio*A0;
        E1 = Gen_Sphere(A0,l(j),m,n,dd,z); 

        E = E+E1;
    end
     E = abs(E.^2);
    EE = EE+E;
end
E_output = EE;
axes(handles.fpplot);
imshow(E_output,[]);
handles.E_output = E_output;
set(handles.show,'Enable','on');
guidata(hObject, handles);




function l1_Callback(hObject, eventdata, handles)
% hObject    handle to l1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of l1 as text
%        str2double(get(hObject,'String')) returns contents of l1 as a double


% --- Executes during object creation, after setting all properties.
function l1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s1_Callback(hObject, eventdata, handles)
% hObject    handle to s1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s1 as text
%        str2double(get(hObject,'String')) returns contents of s1 as a double


% --- Executes during object creation, after setting all properties.
function s1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function j1_Callback(hObject, eventdata, handles)
% hObject    handle to j1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of j1 as text
%        str2double(get(hObject,'String')) returns contents of j1 as a double


% --- Executes during object creation, after setting all properties.
function j1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function l2_Callback(hObject, eventdata, handles)
% hObject    handle to l2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of l2 as text
%        str2double(get(hObject,'String')) returns contents of l2 as a double


% --- Executes during object creation, after setting all properties.
function l2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s2_Callback(hObject, eventdata, handles)
% hObject    handle to s2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s2 as text
%        str2double(get(hObject,'String')) returns contents of s2 as a double


% --- Executes during object creation, after setting all properties.
function s2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function j2_Callback(hObject, eventdata, handles)
% hObject    handle to j2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of j2 as text
%        str2double(get(hObject,'String')) returns contents of j2 as a double


% --- Executes during object creation, after setting all properties.
function j2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b_Callback(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of b as text
%        str2double(get(hObject,'String')) returns contents of b as a double


% --- Executes during object creation, after setting all properties.
function b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lamda_Callback(hObject, eventdata, handles)
% hObject    handle to lamda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lamda as text
%        str2double(get(hObject,'String')) returns contents of lamda as a double


% --- Executes during object creation, after setting all properties.
function lamda_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lamda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rio_Callback(hObject, eventdata, handles)
% hObject    handle to rio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rio as text
%        str2double(get(hObject,'String')) returns contents of rio as a double


% --- Executes during object creation, after setting all properties.
function rio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d_Callback(hObject, eventdata, handles)
% hObject    handle to d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d as text
%        str2double(get(hObject,'String')) returns contents of d as a double


% --- Executes during object creation, after setting all properties.
function d_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function length_Callback(hObject, eventdata, handles)
% hObject    handle to length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of length as text
%        str2double(get(hObject,'String')) returns contents of length as a double


% --- Executes during object creation, after setting all properties.
function length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function width_Callback(hObject, eventdata, handles)
% hObject    handle to width (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of width as text
%        str2double(get(hObject,'String')) returns contents of width as a double


% --- Executes during object creation, after setting all properties.
function width_CreateFcn(hObject, eventdata, handles)
% hObject    handle to width (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function dd_Callback(hObject, eventdata, handles)
% hObject    handle to dd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dd as text
%        str2double(get(hObject,'String')) returns contents of dd as a double


% --- Executes during object creation, after setting all properties.
function dd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in show.
function show_Callback(hObject, eventdata, handles)
% hObject    handle to show (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure
imshow(handles.E_output,[]);
