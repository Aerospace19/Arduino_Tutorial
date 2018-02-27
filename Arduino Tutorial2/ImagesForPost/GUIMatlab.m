function varargout = GUIMatlab(varargin)
% GUIMATLAB MATLAB code for GUIMatlab.fig
%      GUIMATLAB, by itself, creates a new GUIMATLAB or raises the existing
%      singleton*.
%
%      H = GUIMATLAB returns the handle to a new GUIMATLAB or the handle to
%      the existing singleton*.
%
%      GUIMATLAB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIMATLAB.M with the given input arguments.
%
%      GUIMATLAB('Property','Value',...) creates a new GUIMATLAB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUIMatlab_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUIMatlab_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIMatlab

% Last Modified by GUIDE v2.5 08-Nov-2017 08:51:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIMatlab_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIMatlab_OutputFcn, ...
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


% --- Executes just before GUIMatlab is made visible.
function GUIMatlab_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUIMatlab (see VARARGIN)

% Choose default command line output for GUIMatlab
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUIMatlab wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global s;
s=serial('COM4','BaudRate',9600);
fopen(s);


% --- Outputs from this function are returned to the command line.
function varargout = GUIMatlab_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in StartButton.
function StartButton_Callback(hObject, eventdata, handles)
% hObject    handle to StartButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global s;

i=0;
adc=zeros(1, 1000);
while(1)
    i=i+1;
    adc(i)=fscanf(s,'%d');
    drawnow;
    axes(handles.axes1);
    plot(adc);
    set(handles.Analog_Actual_Value,'String',adc(i));
    grid on;
end    

function Analog_Actual_Value_Callback(hObject, eventdata, handles)
% hObject    handle to Analog_Actual_Value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Analog_Actual_Value as text
%        str2double(get(hObject,'String')) returns contents of Analog_Actual_Value as a double


% --- Executes during object creation, after setting all properties.
function Analog_Actual_Value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Analog_Actual_Value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PWM_Actual_Value_Callback(hObject, eventdata, handles)
% hObject    handle to PWM_Actual_Value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PWM_Actual_Value as text
%        str2double(get(hObject,'String')) returns contents of PWM_Actual_Value as a double


% --- Executes during object creation, after setting all properties.
function PWM_Actual_Value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PWM_Actual_Value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in StopButton.
function StopButton_Callback(hObject, eventdata, handles)
% hObject    handle to StopButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on Analog_Actual_Value and none of its controls.
function Analog_Actual_Value_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to Analog_Actual_Value (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function text4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
