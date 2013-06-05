function varargout = myFirstGui(varargin)
% MYFIRSTGUI M-file for myFirstGui.fig
%      MYFIRSTGUI, by itself, creates a new MYFIRSTGUI or raises the existing
%      singleton*.
%
%      H = MYFIRSTGUI returns the handle to a new MYFIRSTGUI or the handle to
%      the existing singleton*.
%
%      MYFIRSTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYFIRSTGUI.M with the given input arguments.
%
%      MYFIRSTGUI('Property','Value',...) creates a new MYFIRSTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before myFirstGui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to myFirstGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help myFirstGui

% Last Modified by GUIDE v2.5 03-May-2013 16:46:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @myFirstGui_OpeningFcn, ...
                   'gui_OutputFcn',  @myFirstGui_OutputFcn, ...
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


% --- Executes just before myFirstGui is made visible.
function myFirstGui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to myFirstGui (see VARARGIN)

% Choose default command line output for myFirstGui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes myFirstGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = myFirstGui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnPlot.
function btnPlot_Callback(hObject, eventdata, handles)
% hObject    handle to btnPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = -2:0.2:2;
y = exp(-x.^2);
plot(x, y);
if get(handles.chbxGridX, 'Value')
    set(gca, 'XGrid', 'on')
else
    set(gca, 'XGrid', 'off')
end

if get(handles.chbxGridY, 'Value')
    set(gca, 'YGrid', 'on')
else
    set(gca, 'YGrid', 'off')
end

set(hObject, 'Enable', 'off');
set(handles.btnClear, 'Enable', 'on');



% --- Executes on button press in btnClear.
function btnClear_Callback(hObject, eventdata, handles)
% hObject    handle to btnClear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla;
set(handles.btnPlot, 'Enable', 'on');
set(hObject, 'Enable', 'off');

if get(handles.chbxGridY, 'Value')
    set(gca, 'YGrid', 'off')
end
if get(handles.chbxGridX, 'Value')
    set(gca, 'XGrid', 'off')
end


% --- Executes on button press in chbxGridX.
function chbxGridX_Callback(hObject, eventdata, handles)
% hObject    handle to chbxGridX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chbxGridX
if get(handles.chbxGridX, 'Value')
    set(gca, 'XGrid', 'on')
else
    set(gca, 'XGrid', 'off')
end



% --- Executes on button press in chbxGridY.
function chbxGridY_Callback(hObject, eventdata, handles)
% hObject    handle to chbxGridY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.chbxGridY, 'Value')
    set(gca, 'YGrid', 'on')
else
    set(gca, 'YGrid', 'off')
end
% Hint: get(hObject,'Value') returns toggle state of chbxGridY
