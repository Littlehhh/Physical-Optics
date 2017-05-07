function varargout = Diffraction(varargin)
% DIFFRACTION MATLAB code for Diffraction.fig
%      DIFFRACTION, by itself, creates a new DIFFRACTION or raises the existing
%      singleton*.
%
%      H = DIFFRACTION returns the handle to a new DIFFRACTION or the handle to
%      the existing singleton*.
%
%      DIFFRACTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIFFRACTION.M with the given input arguments.
%
%      DIFFRACTION('Property','Value',...) creates a new DIFFRACTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Diffraction_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Diffraction_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Diffraction

% Last Modified by GUIDE v2.5 07-May-2017 11:30:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Diffraction_OpeningFcn, ...
                   'gui_OutputFcn',  @Diffraction_OutputFcn, ...
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


% --- Executes just before Diffraction is made visible.
function Diffraction_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Diffraction (see VARARGIN)

% Choose default command line output for Diffraction
handles.output = hObject;
axes(handles.blen);
axis off;
axes(handles.alen);
axis off;
axes(handles.imaging);
axis off;
axes(handles.original);
axis off;
set(handles.BeLen,'String','800');
set(handles.AfLen,'String','800');
set(handles.focal,'String','400');
set(handles.slider1,'Max',1000);
set(handles.slider1,'Value',800);
set(handles.slider2,'Max',1000);
set(handles.slider2,'Value',800);
set(handles.slider3,'Max',1000);
set(handles.slider3,'Value',400);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Diffraction wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Diffraction_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function AfLen_Callback(hObject, eventdata, handles)
% hObject    handle to AfLen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zBeLens = str2double(get(handles.BeLen,'String'));
zAfterLen = str2double(get(handles.AfLen,'String'));
Focal = str2double(get(handles.focal,'String'));

% set(handles.BeLen,'String',num2str(zBeLens));
% set(handles.AfLen,'String',num2str(zAfterLen));
% set(handles.focal,'String',num2str(Focal));


[ImgBeforeLens,ImgAftLens,Out] = Imaging(handles.Input,zBeLens,zAfterLen,Focal);
axes(handles.blen);
imshow(abs(ImgBeforeLens),[]);
axes(handles.alen);
imshow(abs(ImgAftLens),[]);
axes(handles.imaging);
imshow(abs(Out),[]);
handles.ImgBeforeLens = mat2gray(abs(ImgBeforeLens));
handles.ImgAftLens = mat2gray(abs(ImgAftLens));
handles.Out = mat2gray(abs(Out));
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of AfLen as text
%        str2double(get(hObject,'String')) returns contents of AfLen as a double


% --- Executes during object creation, after setting all properties.
function AfLen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AfLen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function BeLen_Callback(hObject, eventdata, handles)
% hObject    handle to BeLen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zBeLens = str2double(get(handles.BeLen,'String'));
zAfterLen = str2double(get(handles.AfLen,'String'));
Focal = str2double(get(handles.focal,'String'));

% set(handles.BeLen,'String',num2str(zBeLens));
% set(handles.AfLen,'String',num2str(zAfterLen));
% set(handles.focal,'String',num2str(Focal));


[ImgBeforeLens,ImgAftLens,Out] = Imaging(handles.Input,zBeLens,zAfterLen,Focal);
axes(handles.blen);
imshow(abs(ImgBeforeLens),[]);
axes(handles.alen);
imshow(abs(ImgAftLens),[]);
axes(handles.imaging);
imshow(abs(Out),[]);
handles.ImgBeforeLens = mat2gray(abs(ImgBeforeLens));
handles.ImgAftLens = mat2gray(abs(ImgAftLens));
handles.Out = mat2gray(abs(Out));
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of BeLen as text
%        str2double(get(hObject,'String')) returns contents of BeLen as a double


% --- Executes during object creation, after setting all properties.
function BeLen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BeLen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function focal_Callback(hObject, eventdata, handles)
% hObject    handle to focal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zBeLens = str2double(get(handles.BeLen,'String'));
zAfterLen = str2double(get(handles.AfLen,'String'));
Focal = str2double(get(handles.focal,'String'));

% set(handles.BeLen,'String',num2str(zBeLens));
% set(handles.AfLen,'String',num2str(zAfterLen));
% set(handles.focal,'String',num2str(Focal));


[ImgBeforeLens,ImgAftLens,Out] = Imaging(handles.Input,zBeLens,zAfterLen,Focal);
axes(handles.blen);
imshow(abs(ImgBeforeLens),[]);
axes(handles.alen);
imshow(abs(ImgAftLens),[]);
axes(handles.imaging);
imshow(abs(Out),[]);
handles.ImgBeforeLens = mat2gray(abs(ImgBeforeLens));
handles.ImgAftLens = mat2gray(abs(ImgAftLens));
handles.Out = mat2gray(abs(Out));
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of focal as text
%        str2double(get(hObject,'String')) returns contents of focal as a double


% --- Executes during object creation, after setting all properties.
function focal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to focal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zBeLens = get(handles.slider1,'Value');
zAfterLen = get(handles.slider2,'Value');
Focal = get(handles.slider3,'Value');

set(handles.BeLen,'String',num2str(zBeLens));
% set(handles.AfLen,'String',num2str(zAfterLen));
% set(handles.focal,'String',num2str(Focal));


[ImgBeforeLens,ImgAftLens,Out] = Imaging(handles.Input,zBeLens,zAfterLen,Focal);
axes(handles.blen);
imshow(abs(ImgBeforeLens),[]);
axes(handles.alen);
imshow(abs(ImgAftLens),[]);
axes(handles.imaging);
imshow(abs(Out),[]);
handles.ImgBeforeLens = mat2gray(abs(ImgBeforeLens));
handles.ImgAftLens = mat2gray(abs(ImgAftLens));
handles.Out = mat2gray(abs(Out));
guidata(hObject, handles);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zBeLens = get(handles.slider1,'Value');
zAfterLen = get(handles.slider2,'Value');
Focal = get(handles.slider3,'Value');

% set(handles.BeLen,'String','800');
set(handles.AfLen,'String',num2str(zAfterLen));
% set(handles.focal,'String',num2str(Focal));


[ImgBeforeLens,ImgAftLens,Out] = Imaging(handles.Input,zBeLens,zAfterLen,Focal);
axes(handles.blen);
imshow(abs(ImgBeforeLens),[]);
axes(handles.alen);
imshow(abs(ImgAftLens),[]);
axes(handles.imaging);
imshow(abs(Out),[]);
handles.ImgBeforeLens = mat2gray(abs(ImgBeforeLens));
handles.ImgAftLens = mat2gray(abs(ImgAftLens));
handles.Out = mat2gray(abs(Out));
guidata(hObject, handles);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zBeLens = get(handles.slider1,'Value');
zAfterLen = get(handles.slider2,'Value');
Focal = get(handles.slider3,'Value');

% set(handles.BeLen,'String','800');
% set(handles.AfLen,'String','800');
set(handles.focal,'String',num2str(Focal));


[ImgBeforeLens,ImgAftLens,Out] = Imaging(handles.Input,zBeLens,zAfterLen,Focal);
axes(handles.blen);
imshow(abs(ImgBeforeLens),[]);
axes(handles.alen);
imshow(abs(ImgAftLens),[]);
axes(handles.imaging);
imshow(abs(Out),[]);
handles.ImgBeforeLens = mat2gray(abs(ImgBeforeLens));
handles.ImgAftLens = mat2gray(abs(ImgAftLens));
handles.Out = mat2gray(abs(Out));
guidata(hObject, handles);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function [ImgBeforeLens,ImgAftLens,Out] = Imaging(Input,zBeLens,zAfterLen,Focal)
%´«²¥¾àÀë
% zBeLens = 800; %mm
% zAfterLen = 800;
% Focal = 400;
%  zBeLens = get(handles.slider1,'Value');
% zAfterLen = get(handles.slider2,'Value');
% Focal = get(handles.slider3,'Value');
lamda = 532/1000000;

sizexSLM = 10;
sizeySLM = 10;
%Í¸¾µÇ°·ÆÄù¶úÑÜÉä
ImgBeforeLens = PropCov(Input,lamda,zBeLens,sizexSLM,sizeySLM);

%¹ýÍ¸¾µ
ImgAftLens = myLens(ImgBeforeLens,Focal,sizexSLM,sizeySLM,lamda);

%Í¸¾µºó·ÆÄù¶ûÑÜÉä
Out = PropCov(ImgAftLens,lamda,zAfterLen,sizexSLM,sizeySLM);


% --- Executes on button press in open.
function open_Callback(hObject, eventdata, handles)
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Input=InputPicture();
if size(handles.Input,3)==3
    handles.Input = rgb2gray(handles.Input);
end
handles.Input = double(handles.Input)/255;
axes(handles.original);
imshow(handles.Input,[]);
zBeLens = get(handles.slider1,'Value');
zAfterLen = get(handles.slider2,'Value');
Focal = get(handles.slider3,'Value');

% set(handles.BeLen,'String','800');
% set(handles.AfLen,'String','800');
% set(handles.focal,'String',num2str(Focal));


[ImgBeforeLens,ImgAftLens,Out] = Imaging(handles.Input,zBeLens,zAfterLen,Focal);
axes(handles.blen);
imshow(abs(ImgBeforeLens),[]);
axes(handles.alen);
imshow(abs(ImgAftLens),[]);
axes(handles.imaging);
handles.imaging
imshow(abs(Out),[]);
handles.ImgBeforeLens = mat2gray(abs(ImgBeforeLens));
handles.ImgAftLens = mat2gray(abs(ImgAftLens));
handles.Out = mat2gray(abs(Out));
guidata(hObject, handles);


% --- Executes on button press in save1.
function save1_Callback(hObject, eventdata, handles)
% hObject    handle to save1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

OutputPicture(handles.Input)
% --- Executes on button press in save2.
function save2_Callback(hObject, eventdata, handles)
% hObject    handle to save2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
OutputPicture(handles.ImgBeforeLens)

% --- Executes on button press in save3.
function save3_Callback(hObject, eventdata, handles)
% hObject    handle to save3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
OutputPicture(handles.ImgAftLens)

% --- Executes on button press in save4.
function save4_Callback(hObject, eventdata, handles)
% hObject    handle to save4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
OutputPicture(handles.Out)
