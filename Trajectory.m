function varargout = Trajectory(varargin)
% TRAJECTORY M-file for Trajectory.fig
%      TRAJECTORY, by itself, creates a new TRAJECTORY or raises the existing
%      singleton*.
%
%      H = TRAJECTORY returns the handle to a new TRAJECTORY or the handle to
%      the existing singleton*.
%
%      TRAJECTORY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRAJECTORY.M with the given input arguments.
%
%      TRAJECTORY('Property','Value',...) creates a new TRAJECTORY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Trajectory_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Trajectory_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Trajectory

% Last Modified by GUIDE v2.5 16-May-2013 17:07:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Trajectory_OpeningFcn, ...
                   'gui_OutputFcn',  @Trajectory_OutputFcn, ...
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


% --- Executes just before Trajectory is made visible.
function Trajectory_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Trajectory (see VARARGIN)

% Choose default command line output for Trajectory
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Trajectory wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Trajectory_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pbTrajectory.
function pbTrajectory_Callback(hObject, eventdata, handles)
% hObject    handle to pbTrajectory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ins_but.
function ins_but_Callback(hObject, eventdata, handles)
% hObject    handle to ins_but (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in gen_but.
function gen_but_Callback(hObject, eventdata, handles)
% hObject    handle to gen_but (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.ins_but, 'Enable', 'on');

if get(handles.cbStat, 'Value')
    set(handles.rbStatic, 'Enable', 'on');
end
  
if get(handles.cbStrLine, 'Value')
    set(handles.rbStraightLine, 'Enable', 'on');
end

if get(handles.cbCircle, 'Value')
    set(handles.rbCircle, 'Enable', 'on');
end

if get(handles.cbSline, 'Value')
    set(handles.rbSline, 'Enable', 'on');
end
set(handles.axes8, 'Visible', 'off');
set(handles.rbGyro, 'Enable', 'on');
set(handles.rbForces, 'Enable', 'on');
set(handles.rbTrajectory, 'Enable', 'on');



% --- Executes on button press in cbStat.
function cbStat_Callback(hObject, eventdata, handles)
% hObject    handle to cbStat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cbStat


% --- Executes on button press in cbStrLine.
function cbStrLine_Callback(hObject, eventdata, handles)
% hObject    handle to cbStrLine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cbStrLine


% --- Executes on button press in cbCircle.
function cbCircle_Callback(hObject, eventdata, handles)
% hObject    handle to cbCircle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cbCircle



function eLat_Callback(hObject, eventdata, handles)
% hObject    handle to eLat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eLat as text
%        str2double(get(hObject,'String')) returns contents of eLat as a double


% --- Executes during object creation, after setting all properties.
function eLat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eLat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eLong_Callback(hObject, eventdata, handles)
% hObject    handle to eLong (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eLong as text
%        str2double(get(hObject,'String')) returns contents of eLong as a double


% --- Executes during object creation, after setting all properties.
function eLong_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eLong (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eVel_Callback(hObject, eventdata, handles)
% hObject    handle to eVel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eVel as text
%        str2double(get(hObject,'String')) returns contents of eVel as a double


% --- Executes during object creation, after setting all properties.
function eVel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eVel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eAcc_Callback(hObject, eventdata, handles)
% hObject    handle to eAcc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eAcc as text
%        str2double(get(hObject,'String')) returns contents of eAcc as a double


% --- Executes during object creation, after setting all properties.
function eAcc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eAcc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eRad_Callback(hObject, eventdata, handles)
% hObject    handle to eRad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eRad as text
%        str2double(get(hObject,'String')) returns contents of eRad as a double


% --- Executes during object creation, after setting all properties.
function eRad_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eRad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in rbStatic.
function rbStatic_Callback(hObject, eventdata, handles)
% hObject    handle to rbStatic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbStatic


% --- Executes on button press in rbStraightLine.
function rbStraightLine_Callback(hObject, eventdata, handles)
% hObject    handle to rbStraightLine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbStraightLine


% --- Executes on button press in rbCircle.
function rbCircle_Callback(hObject, eventdata, handles)
% hObject    handle to rbCircle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbCircle


% --- Executes on button press in rbSline.
function rbSline_Callback(hObject, eventdata, handles)
% hObject    handle to rbSline (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbSline


% --- Executes on button press in rbTrajectory.
function rbTrajectory_Callback(hObject, eventdata, handles)
% hObject    handle to rbTrajectory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbTrajectory
set(handles.axes8, 'Visible', 'off');


% --- Executes on button press in rbGyro.
function rbGyro_Callback(hObject, eventdata, handles)
% hObject    handle to rbGyro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbGyro

set(handles.axes8, 'Visible', 'on');
set(handles.ins_but, 'Enable', 'off');


% --- Executes on button press in rbForces.
function rbForces_Callback(hObject, eventdata, handles)
% hObject    handle to rbForces (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbForces


% --- Executes on button press in radiobutton9.
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton9


% --- Executes on button press in cbSline.
function cbSline_Callback(hObject, eventdata, handles)
% hObject    handle to cbSline (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cbSline


% --- Executes on button press in pbClear.
function pbClear_Callback(hObject, eventdata, handles)
% hObject    handle to pbClear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.ins_but, 'Enable', 'off');
set(handles.rbStatic, 'Enable', 'off');
set(handles.rbStraightLine, 'Enable', 'off');
set(handles.rbCircle, 'Enable', 'off');
set(handles.rbSline, 'Enable', 'off');
set(handles.rbGyro, 'Enable', 'off');
set(handles.rbForces, 'Enable', 'off');
set(handles.rbTrajectory, 'Enable', 'off');
