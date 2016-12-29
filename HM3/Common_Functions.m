function varargout = Common_Functions(varargin)
% COMMON_FUNCTIONS MATLAB code for Common_Functions.fig
%      COMMON_FUNCTIONS, by itself, creates a new COMMON_FUNCTIONS or raises the existing
%      singleton*.
%
%      H = COMMON_FUNCTIONS returns the handle to a new COMMON_FUNCTIONS or the handle to
%      the existing singleton*.
%
%      COMMON_FUNCTIONS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMMON_FUNCTIONS.M with the given input arguments.
%
%      COMMON_FUNCTIONS('Property','Value',...) creates a new COMMON_FUNCTIONS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Common_Functions_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Common_Functions_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Common_Functions

% Last Modified by GUIDE v2.5 21-Dec-2016 23:48:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Common_Functions_OpeningFcn, ...
                   'gui_OutputFcn',  @Common_Functions_OutputFcn, ...
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


% --- Executes just before Common_Functions is made visible.
function Common_Functions_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Common_Functions (see VARARGIN)

% Choose default command line output for Common_Functions
handles.output = hObject;
axes(handles.TD);
axis off;
axes(handles.fft);
axis off;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Common_Functions wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Common_Functions_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in select.
function select_Callback(hObject, eventdata, handles)
% hObject    handle to select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Xsize = 10;
Ysize = 10;
deltaN = 100;
select = get(handles.select,'Value');
switch select
    case 1
       Output = myRect2D(Xsize,Ysize,deltaN);
    case 2
       Output = myTriangle2D(Xsize,Ysize,deltaN);   
    case 3
       Output = myComb2D(Xsize,Ysize,deltaN);         
    case 4
       Output = mySgn2D(Xsize,Ysize,deltaN);             
    case 5
       Output = myStep2D(Xsize,Ysize,deltaN);                
    case 6
       Output = myCirc(Xsize,Ysize,deltaN);                     
    case 7
       Output = myGaussian2D(Xsize,Ysize,deltaN); 
end
x = -deltaN/2:deltaN/2;
DFT = abs(fftshift(fft2(Output)));
axes(handles.TD);
% axis off;
mesh(x,x,Output);
axes(handles.fft);
mesh(x,x,DFT);
handles.DFT = DFT;
guidata(hObject, handles);


% Hints: contents = cellstr(get(hObject,'String')) returns select contents as cell array
%        contents{get(hObject,'Value')} returns selected item from select





% --- Executes during object creation, after setting all properties.
function select_CreateFcn(hObject, eventdata, handles)
% hObject    handle to select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in show.
function show_Callback(hObject, eventdata, handles)
% hObject    handle to show (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Xsize = 10;
Ysize = 10;
deltaN = 100;
select = get(handles.select,'Value');
switch select
    case 1
       Output = myRect2D(Xsize,Ysize,deltaN);
    case 2
       Output = myTriangle2D(Xsize,Ysize,deltaN);   
    case 3
       Output = myComb2D(Xsize,Ysize,deltaN);         
    case 4
       Output = mySgn2D(Xsize,Ysize,deltaN);             
    case 5
       Output = myStep2D(Xsize,Ysize,deltaN);                
    case 6
       Output = myCirc(Xsize,Ysize,deltaN);                     
    case 7
       Output = myGaussian2D(Xsize,Ysize,deltaN); 
end
x = -deltaN/2:deltaN/2;
DFT = abs(fftshift(fft2(Output)));
axes(handles.TD);
% axis off;
mesh(x,x,Output);
axes(handles.fft);
mesh(x,x,DFT);
handles.DFT = DFT;
guidata(hObject, handles);


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
OutputPicture(handles.DFT);
