function varargout = Physics_Optical(varargin)
% PHYSICS_OPTICAL MATLAB code for Physics_Optical.fig
%      PHYSICS_OPTICAL, by itself, creates a new PHYSICS_OPTICAL or raises the existing
%      singleton*.
%
%      H = PHYSICS_OPTICAL returns the handle to a new PHYSICS_OPTICAL or the handle to
%      the existing singleton*.
%
%      PHYSICS_OPTICAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PHYSICS_OPTICAL.M with the given input arguments.
%
%      PHYSICS_OPTICAL('Property','Value',...) creates a new PHYSICS_OPTICAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Physics_Optical_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Physics_Optical_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Physics_Optical

% Last Modified by GUIDE v2.5 28-Sep-2016 18:27:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Physics_Optical_OpeningFcn, ...
                   'gui_OutputFcn',  @Physics_Optical_OutputFcn, ...
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


% --- Executes just before Physics_Optical is made visible.
function Physics_Optical_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Physics_Optical (see VARARGIN)
set(handles.n1,'String','1');
set(handles.n2,'String','1');
set(handles.u1,'String','1');
set(handles.u2,'String','1');
set(handles.radiobutton1,'Value',1);
set(handles.radiobutton2,'Value',0);
set(handles.radiobutton3,'Value',0);


% Choose default command line output for Physics_Optical
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Physics_Optical wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Physics_Optical_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(~, ~, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.radiobutton2,'Value',0);
set(handles.radiobutton3,'Value',0);

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(~, ~, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton1,'Value',0);
set(handles.radiobutton3,'Value',0);
% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton1,'Value',0);
set(handles.radiobutton2,'Value',0);
% Hint: get(hObject,'Value') returns toggle state of radiobutton3



function u1_Callback(hObject, eventdata, handles)
% hObject    handle to u1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of u1 as text
%        str2double(get(hObject,'String')) returns contents of u1 as a double


% --- Executes during object creation, after setting all properties.
function u1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to u1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function u2_Callback(hObject, eventdata, handles)
% hObject    handle to u2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of u2 as text
%        str2double(get(hObject,'String')) returns contents of u2 as a double


% --- Executes during object creation, after setting all properties.
function u2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to u2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n1_Callback(hObject, eventdata, handles)
% hObject    handle to n1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n1 as text
%        str2double(get(hObject,'String')) returns contents of n1 as a double


% --- Executes during object creation, after setting all properties.
function n1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n2_Callback(hObject, eventdata, handles)
% hObject    handle to n2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n2 as text
%        str2double(get(hObject,'String')) returns contents of n2 as a double


% --- Executes during object creation, after setting all properties.
function n2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n1=str2double(get(handles.n1,'String'));
n2=str2double(get(handles.n2,'String'));
u1=str2double(get(handles.u1,'String'));
u2=str2double(get(handles.u2,'String'));
[rp,tp,rs,ts,PN,TN,theta] = Fresnel(n1,n2,u1,u2); 

if get(handles.radiobutton1,'Value')==1
    
    plot(theta,rp,'-',theta,tp,':','LineWidth',3);
    grid on;
    legend('rp','tp');
    xlabel('入射角\theta');
    ylabel('折、反射系数');
    title(['n1=',num2str(n1),', n2=',num2str(n2),' 时P波折、反射系数随入射角的变化曲线']);
else if get(handles.radiobutton2,'Value')==1
    plot(theta,rs,'-',theta,ts,':','LineWidth',3);
    grid on;
    legend('rs','ts');
    xlabel('入射角\theta');
    ylabel('折、反射系数');
    title(['n1=',num2str(n1),', n2=',num2str(n2),' 时S波折、反射系数随入射角的变化曲线']);
    else if get(handles.radiobutton3,'Value')==1 
    plot(theta,PN,'-',theta,TN,':','LineWidth',3);
    grid on;
    legend('Pn','Tn');
    xlabel('入射角\theta');
    ylabel('折、反射率');
    title(['n1=',num2str(n1),', n2=',num2str(n2),' 时自然光折、反射率随入射角的变化曲线']);
        else
    helpdlg('请选择一个类型的光波',...
        '提示');
        end
     end
end
