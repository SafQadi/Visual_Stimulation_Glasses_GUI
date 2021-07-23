% Program          :  Visual Stimulation Glasses
% Version          :  1.0

% Copy Rights      :
% Author           :  Dr. Safwan Al-Qadhi
%                  :  saf.qadi@gmail.com
% Last modified    :  08-06-2009


function varargout = Visual_Stimulation_Glasses(varargin)

% The graphical user's interface (GUI) "Visual_Stimulation_Glasses" represents the functioning of the 
% One- and the Multi-Segment Glasses used for the visual stimulation. It shows the different 
% stimulation paradigms programmed for both glasses. In the One-Segment glasses two stimulation
% patterns can be selected, which activate the stimulation glasses either in phase or out of
% phase. By the Multi-segment glasses, seven stimulation patterns are programmed in which the 
% segments of the glasses are activated in different forms. The stimulation frequency of both
% glasses can be given in the input field labelled "Stimulation". By the One-segment glasses 
% the stimulation signal can be modulated by a cosine signal. The modulation signal frequency
% can be given in the input field labelled "Modulation". After pressing the "Start" button, 
% the stimulation will be started. When changing the frequency of a signal or selecting another
% stimulation paradigm within one of the glasses, the stimulation can be restarted with the 
% "refrech" button with no need for pressing the "Start" button again. 



%% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Visual_Stimulation_Glasses_OpeningFcn, ...
                   'gui_OutputFcn',  @Visual_Stimulation_Glasses_OutputFcn, ...
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

%%
function Visual_Stimulation_Glasses_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

global choice;
choice=1;

% set(handles.togglebutton1, 'String','Start Stimulation');
% set(handles.togglebutton1, 'BackgroundColor','green');

set(handles.OSGleft,'Visible','on');
set(handles.OSGright,'Visible','on'); 

set(handles.MSG, 'BackgroundColor','red');
set(handles.OSG, 'BackgroundColor','green');

set(handles.popupmenu1,'String',{...
    'In phase ',...
    'Out of phase'});

set(handles.OSG, 'Enable', 'on'); 
set(handles.MSG, 'Enable', 'on'); 


imgFile = 'greenarrow6.jpg';
img=imread(imgFile);
set(handles.togglebutton1,'CData',img);

imgFile = 'refrech4.jpg';
img=imread(imgFile);
set(handles.pushbutton17,'CData',img);  


% Update handles structure
guidata(hObject, handles);

%%

function varargout = Visual_Stimulation_Glasses_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


function togglebutton1_Callback(hObject, eventdata, handles)


global choice exten;

start=get(hObject,'Value');
if     start==get(hObject,'Max');
    stim=1; 
imgFile = 'stopsymbol6.jpg';
img=imread(imgFile);
set(handles.togglebutton1,'CData',img);

elseif start==get(hObject,'Min')
    stim=0;
imgFile = 'greenarrow6.jpg';
img=imread(imgFile);
set(handles.togglebutton1,'CData',img);
end

switch choice
    case 2
        
        set(handles.OSG, 'Enable', 'off'); 
        set(handles.MSG, 'Enable', 'off'); 
    
freq=str2double(get(handles.freq,'String'))*4;

% if isnan(freq)
%     uiwait(errordlg('Input must be a number','Error'));
%     return;
% elseif isequal(freq,'')
%     uiwait(errordlg('Please insert the stimulation frequency','Error'));
%     return;
% end

segment(1)=handles.pushbutton1;
segment(2)=handles.pushbutton2;
segment(3)=handles.pushbutton3;
segment(4)=handles.pushbutton4;
segment(5)=handles.pushbutton5;
segment(6)=handles.pushbutton6;
segment(7)=handles.pushbutton7;
segment(8)=handles.pushbutton8;
segment(9)=handles.pushbutton9;
segment(10)=handles.pushbutton10;
segment(11)=handles.pushbutton11;
segment(12)=handles.pushbutton12;
segment(13)=handles.pushbutton13;
segment(14)=handles.pushbutton14;
segment(15)=handles.pushbutton15;
segment(16)=handles.pushbutton16;

%% Signal presentation
exten=get(handles.slider2,'Value')+0.1;
if exten>1.0
    exten=1.0;
end

t=0:0.00001:1;
signal=sin(2*pi*t*(freq/8));

signal2=square(2*pi*t*250);
signal4=signal.*signal2;
signal4=signal4.*(signal4>0);

 cla(handles.axes3,'reset')
 plot(handles.axes3,t,signal4*2)
 set(handles.axes3,'Xlim',[0 exten]);
 set(handles.axes3,'Ylim',[0 2]);

%% Stimulation patterns of the Multi-Segment Glasses


val=get(handles.popupmenu1,'Value');
Str=get(handles.popupmenu1,'String');

switch Str{val}
    
    case 'Multlisite inner & outer SEGs'
        
        while stim==1
            
         for i=1:4;

               switch i
                   case 1
                       for j=1:16
                           if j==1 || j==6 || j==3 || j==8
                     set(segment(j), 'BackgroundColor',[0.51 0.51 0.51]);
                           else
                     set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);
                           end
                       end

                   case 2
                       for j=1:16
                           if j==2 || j==5 || j==4 || j==7
                     set(segment(j), 'BackgroundColor',[0.51 0.51 0.51]);
                           else
                     set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);
                           end
                       end

                   case 3
                       for j=1:16
                           if j==9 || j==14 || j==11 || j==16
                     set(segment(j), 'BackgroundColor',[0.51 0.51 0.51]);
                           else
                     set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);
                           end
                       end

                   case 4
                       for j=1:16
                           if j==10 || j==13 || j==12 || j==15
                     set(segment(j), 'BackgroundColor',[0.51 0.51 0.51]);
                           else
                     set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);
                           end
                       end
                end

                pause(1/freq)
                start=get(hObject,'Value');
                if     start==get(hObject,'Min');
                 stim=0;
                 for j=1:16   
                     set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);       
                 end
                 set(handles.OSG, 'Enable', 'on'); 
                 set(handles.MSG, 'Enable', 'on'); 
                 return
                end
         end          
        end
       
        case 'Multisite inner SEGs'

        while stim==1

         for i=1:4;

               switch i
                   case 1
                       for j=1:16
                           if j==1 || j==6 
                     set(segment(j), 'BackgroundColor',[0.51 0.51 0.51]);
                           else
                     set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);
                           end
                       end

                   case 2
                       for j=1:16
                           if j==2 || j==5 
                     set(segment(j), 'BackgroundColor',[0.51 0.51 0.51]);
                           else
                     set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);
                           end
                       end

                   case 3
                       for j=1:16
                           if j==9 || j==14 
                     set(segment(j), 'BackgroundColor',[0.51 0.51 0.51]);
                           else
                     set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);
                           end
                       end

                   case 4
                       for j=1:16
                           if j==10 || j==13 
                     set(segment(j), 'BackgroundColor',[0.51 0.51 0.51]);
                           else
                     set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);
                           end
                       end

                end

                pause(1/freq)
                start=get(hObject,'Value');
                if     start==get(hObject,'Min');
                 stim=0;
                 for j=1:16   
                     set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);       
                 end
                 set(handles.OSG, 'Enable', 'on'); 
                 set(handles.MSG, 'Enable', 'on'); 

                 return
                end
         end          
        end
        
        case 'Multisite outer SEGs'

        while stim==1

         for i=1:4;

               switch i
                   case 1
                       for j=1:16
                           if  j==3 || j==8
                     set(segment(j), 'BackgroundColor',[0.51 0.51 0.51]);
                           else
                     set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);
                           end
                       end

                   case 2
                       for j=1:16
                           if  j==4 || j==7
                     set(segment(j), 'BackgroundColor',[0.51 0.51 0.51]);
                           else
                     set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);
                           end
                       end

                   case 3
                       for j=1:16
                           if  j==11 || j==16
                     set(segment(j), 'BackgroundColor',[0.51 0.51 0.51]);
                           else
                     set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);
                           end
                       end

                   case 4
                       for j=1:16
                           if  j==12 || j==15
                     set(segment(j), 'BackgroundColor',[0.51 0.51 0.51]);
                           else
                     set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);
                           end
                       end

                end

                pause(1/freq)
                start=get(hObject,'Value');
                if     start==get(hObject,'Min');
                 stim=0;
                 for j=1:16   
                     set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);       
                 end
                 set(handles.OSG, 'Enable', 'on'); 
                 set(handles.MSG, 'Enable', 'on');                  
                 return
                end
         end          
        end
        
        case 'Multisite inner & outer in phase'
        
        while stim==1
            
         for i=1:4;

               switch i
                   case 1
                       for j=1:16
                           if j==9 || j==12 || j==14 || j==15
                     set(segment(j), 'BackgroundColor',[0.51 0.51 0.51]);
                           else
                     set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);
                           end
                       end

                   case 2
                       for j=1:16
                           if j==2 || j==3 || j==5 || j==8
                     set(segment(j), 'BackgroundColor',[0.51 0.51 0.51]);
                           else
                     set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);
                           end
                       end

                   case 3
                       for j=1:16
                           if j==1 || j==4 || j==6 || j==7
                     set(segment(j), 'BackgroundColor',[0.51 0.51 0.51]);
                           else
                     set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);
                           end
                       end

                   case 4
                       for j=1:16
                           if j==10 || j==11 || j==13 || j==16
                     set(segment(j), 'BackgroundColor',[0.51 0.51 0.51]);
                           else
                     set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);
                           end
                       end

                end

                pause(1/freq)
                start=get(hObject,'Value');
                if     start==get(hObject,'Min');
                 stim=0;
                 for j=1:16   
                     set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);       
                 end
                 set(handles.OSG, 'Enable', 'on'); 
                 set(handles.MSG, 'Enable', 'on');                  
                 return
                end
         end          
        end

        case 'Blinking out of phase'

        while stim==1

         for i=1:4;

               switch i
                   case 1
                       for j=1:16
                           if j==1 || j==2 || j==5 || j==6 || j==9 || j==10 || j==13 || j==14
                     set(segment(j), 'BackgroundColor',[0.51 0.51 0.51]);
                           else
                     set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);
                           end
                       end

                   case 2
                     
                      %%%%%%%%%%%%%%%%%%

                   case 3
                       for j=1:16
                           if j==3 || j==4 || j==7 || j==8 || j==11 || j==12 || j==15 || j==16
                     set(segment(j), 'BackgroundColor',[0.51 0.51 0.51]);
                           else
                     set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);
                           end
                       end

                   case 4
                       
                       %%%%%%%%%%%%%%%%%%

                end

                pause(1/freq)
                start=get(hObject,'Value');
                if     start==get(hObject,'Min');
                 stim=0;
                 for j=1:16   
                     set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);       
                 end
                 set(handles.OSG, 'Enable', 'on'); 
                 set(handles.MSG, 'Enable', 'on');                  
                 return
                end
         end          
        end
        
        case 'Blinking outer SEGs'

        while stim==1

         for i=1:4;

               switch i
                   case 1
                       for j=1:16
                           if j==3 || j==4 || j==7 || j==8 || j==11 || j==12 || j==15 || j==16
                     set(segment(j), 'BackgroundColor',[0.51 0.51 0.51]);
                           else
                     set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);
                           end
                       end

                   case 2
                     
                       %%%%%%%%%%%%%%%%%%

                   case 3
                       for j=1:16
                           if j==3 || j==4 || j==7 || j==8 || j==11 || j==12 || j==15 || j==16
                      set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);
                           else
                     
                           end
                       end

                   case 4
                       
                       %%%%%%%%%%%%%%%%%%

                end

                pause(1/freq)
                start=get(hObject,'Value');
                if     start==get(hObject,'Min');
                 stim=0;
                 for j=1:16   
                     set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);       
                 end
                 set(handles.OSG, 'Enable', 'on'); 
                 set(handles.MSG, 'Enable', 'on');                  
                 return
                end
         end          
        end
        
         case 'hemi retinal'

        while stim==1

         for i=1:4;

               switch i
                   case 1
                       for j=1:16
                           if j==3 || j==4 || j==5 || j==6 || j==9 || j==10 || j==15 || j==16
                     set(segment(j), 'BackgroundColor',[0.51 0.51 0.51]);
                           else
                     set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);
                           end
                       end

                   case 2
                     
                       %%%%%%%%%%%%%%%%%%

                   case 3
                       for j=1:16
                           if j==1 || j==2 || j==7 || j==8 || j==11 || j==12 || j==13 || j==14
                      set(segment(j), 'BackgroundColor',[0.51 0.51 0.51]);
                           else
                      set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);
                           end
                       end

                   case 4
                       
                       %%%%%%%%%%%%%%%%%%

                end

                pause(1/freq)
                start=get(hObject,'Value');
                if     start==get(hObject,'Min');
                 stim=0;
                 for j=1:16   
                     set(segment(j), 'BackgroundColor',[1.0 1.0 1.0]);       
                 end
                 set(handles.OSG, 'Enable', 'on'); 
                 set(handles.MSG, 'Enable', 'on');                  
                 return
                end
         end          
        end
    otherwise
        return

end

%% Stimulation patterns of the One-segment Glasses

case 1  % global choice =1
    
    set(handles.OSG, 'Enable', 'off'); 
    set(handles.MSG, 'Enable', 'off'); 
    
    freq=str2double(get(handles.freq,'String'));
    modu=str2double(get(handles.modu,'String'));

    val=get(handles.popupmenu1,'Value');
    Str=get(handles.popupmenu1,'String');
    
    side(1)=handles.OSGleft;
    side(2)=handles.OSGright;

      switch Str{val}
    
         case 'In phase '
        
exten=get(handles.slider2,'Value')*10+1;
if exten>10
    exten=10;
end
cla(handles.graph,'reset');
set(handles.graph,'Visible','off')


        t=0:0.001:16;
        signal=0.5*sin(2*pi*t*freq);
        signalC=cos(2*pi*t*modu);
        signalC=signalC.*(signalC>0);
        stimol=signal.*signalC;
        stimol=stimol+0.5;
        
        cla(handles.axes4,'reset')
        plot(handles.axes4,t,stimol)
        set(handles.axes4,'Xlim',[0 exten]);
        set(handles.axes4,'Ylim',[0 1]);
        cla(handles.axes5,'reset')
        plot(handles.axes5,t,stimol)
        set(handles.axes5,'Xlim',[0 exten]);
        set(handles.axes5,'Ylim',[0 1]);

        
        while stim==1  

            for t=0:0.01:16;

                signal=0.5*sin(2*pi*t*freq);
                signalC=cos(2*pi*t*modu);
                signalC=signalC.*(signalC>0);

                stimol=signal.*signalC;
                stimol=stimol+0.5;

                %% the bar plot reduces the stimulation frequency.
                if freq<1
                set(handles.graph,'Visible','on')
                bar(handles.graph,t,stimol);
                set(handles.graph,'Xlim',[t-0.1 t+0.1]);
                set(handles.graph,'Ylim',[0 1]);
                
                end

                set(side, 'BackgroundColor',[ stimol stimol stimol]);
                pause(1/(100))

                start=get(hObject,'Value');
                    if   start==get(hObject,'Min');
                         stim=0;
                             
                             set(side, 'BackgroundColor',[1.0 1.0 1.0]);       
                             set(handles.OSG, 'Enable', 'on'); 
                             set(handles.MSG, 'Enable', 'on'); 
                         return
                    end                                             

             end             
        end
        
        case 'Out of phase'
        
exten=get(handles.slider2,'Value')*10+1;
if exten>10
    exten=10;
end
cla(handles.graph,'reset');
set(handles.graph,'Visible','off')


        t=0:0.001:16;
        signal=0.5*sin(2*pi*t*freq);
        signalC=cos(2*pi*t*modu);
        signalC=signalC.*(signalC>0);
        stimol=signal.*signalC;
        stimol=stimol+0.5;
        stimol2=(-1)*stimol+1;
        
        cla(handles.axes4,'reset')
        plot(handles.axes4,t,stimol)
        set(handles.axes4,'Xlim',[0 exten]);
        set(handles.axes4,'Ylim',[0 1]);
        cla(handles.axes5,'reset')
        plot(handles.axes5,t,stimol2)
        set(handles.axes5,'Xlim',[0 exten]);
        set(handles.axes5,'Ylim',[0 1]);

        
        while stim==1  

            for t=0:0.01:16;

                signal=0.5*sin(2*pi*t*freq);
                signalC=cos(2*pi*t*modu);
                signalC=signalC.*(signalC>0);

                stimol=signal.*signalC;
                stimol=stimol+0.5;
                stimol2=(-1)*stimol+1;

%                 %% the bar plot reduces the stimulation frequency.
%                 if freq<=2
%                 set(handles.graph,'Visible','on')
%                 bar(handles.graph,t,stimol2);
%                 set(handles.graph,'Xlim',[t-0.1 t+0.1]);
%                 set(handles.graph,'Ylim',[0 1]);
%                 
%                 end

                set(side(1), 'BackgroundColor',[stimol stimol stimol]);
                set(side(2), 'BackgroundColor',[stimol2 stimol2 stimol2]);
                pause(1/(100))

                start=get(hObject,'Value');
                    if   start==get(hObject,'Min');
                         stim=0;
                             
                             set(side, 'BackgroundColor',[1.0 1.0 1.0]);       
                             set(handles.OSG, 'Enable', 'on'); 
                             set(handles.MSG, 'Enable', 'on'); 
                         return
                    end                                             

             end             
        end
         
      end
end

%%

function pushbutton17_Callback(hObject, eventdata, handles)

togglebutton1_Callback(handles.togglebutton1, eventdata, handles);


function OSG_Callback(hObject, eventdata, handles)

global choice;
choice=1;

set(handles.MSG, 'BackgroundColor','red');
set(handles.OSG, 'BackgroundColor','green');

cla(handles.axes3,'reset');
set(handles.axes3,'Visible','off');

set(handles.pushbutton1, 'Visible', 'off'); 
set(handles.pushbutton2, 'Visible', 'off');  
set(handles.pushbutton3, 'Visible', 'off');  
set(handles.pushbutton4, 'Visible', 'off');  
set(handles.pushbutton5, 'Visible', 'off');  
set(handles.pushbutton6, 'Visible', 'off');  
set(handles.pushbutton7, 'Visible', 'off');  
set(handles.pushbutton8, 'Visible', 'off');  
set(handles.pushbutton9, 'Visible', 'off');  
set(handles.pushbutton10, 'Visible', 'off');  
set(handles.pushbutton11, 'Visible', 'off');  
set(handles.pushbutton12, 'Visible', 'off');  
set(handles.pushbutton13, 'Visible', 'off');  
set(handles.pushbutton14, 'Visible', 'off');  
set(handles.pushbutton15, 'Visible', 'off');  
set(handles.pushbutton16, 'Visible', 'off'); 

set(handles.OSGleft,'Visible','on');
set(handles.OSGright,'Visible','on'); 

set(handles.modu, 'Enable', 'on'); 

set(handles.axes4,'Visible','on');
set(handles.axes5,'Visible','on');

control=get(handles.popupmenu1,'Value');
if control >1
    set(handles.popupmenu1,'Value',1)
end
set(handles.popupmenu1,'String',{...
    'In phase ',...
    'Out of phase'});

set(handles.freq,'Value',1);
set(handles.modu,'Value',0);

%%
function MSG_Callback(hObject, eventdata, handles)

global choice;
choice=2;

set(handles.MSG, 'BackgroundColor','green');
set(handles.OSG, 'BackgroundColor','red');

set(handles.OSGleft,'Visible','off');
set(handles.OSGright,'Visible','off');  

cla(handles.axes4,'reset');
cla(handles.axes5,'reset');
set(handles.axes4,'Visible','off');
set(handles.axes5,'Visible','off');

set(handles.pushbutton1, 'Visible', 'on'); 
set(handles.pushbutton2, 'Visible', 'on');  
set(handles.pushbutton3, 'Visible', 'on');  
set(handles.pushbutton4, 'Visible', 'on');  
set(handles.pushbutton5, 'Visible', 'on');  
set(handles.pushbutton6, 'Visible', 'on');  
set(handles.pushbutton7, 'Visible', 'on');  
set(handles.pushbutton8, 'Visible', 'on');  
set(handles.pushbutton9, 'Visible', 'on');  
set(handles.pushbutton10, 'Visible', 'on');  
set(handles.pushbutton11, 'Visible', 'on');  
set(handles.pushbutton12, 'Visible', 'on');  
set(handles.pushbutton13, 'Visible', 'on');  
set(handles.pushbutton14, 'Visible', 'on');  
set(handles.pushbutton15, 'Visible', 'on');  
set(handles.pushbutton16, 'Visible', 'on'); 

set(handles.axes3,'Visible','on');

set(handles.modu, 'Enable', 'off'); 

control=get(handles.popupmenu1,'Value');
if control >1
    set(handles.popupmenu1,'Value',1)
end
set(handles.popupmenu1,'String',{...
    'Multlisite inner & outer SEGs',...
'Multisite inner SEGs',...
'Multisite outer SEGs',...
'Multisite inner & outer in phase',...
'Blinking out of phase',...
'Blinking outer SEGs',...
'hemi retinal'});

set(handles.freq,'Value',1);

%%
function popupmenu1_Callback(hObject, eventdata, handles)


function popupmenu1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton2_Callback(hObject, eventdata, handles)
function pushbutton3_Callback(hObject, eventdata, handles)
function pushbutton1_Callback(hObject, eventdata, handles)
function pushbutton4_Callback(hObject, eventdata, handles)
function pushbutton5_Callback(hObject, eventdata, handles)
function pushbutton6_Callback(hObject, eventdata, handles)
function pushbutton7_Callback(hObject, eventdata, handles)
function pushbutton8_Callback(hObject, eventdata, handles)
function pushbutton9_Callback(hObject, eventdata, handles)
function pushbutton10_Callback(hObject, eventdata, handles)
function pushbutton11_Callback(hObject, eventdata, handles)
function pushbutton12_Callback(hObject, eventdata, handles)
function pushbutton13_Callback(hObject, eventdata, handles)
function pushbutton14_Callback(hObject, eventdata, handles)
function pushbutton15_Callback(hObject, eventdata, handles)
function pushbutton16_Callback(hObject, eventdata, handles)

%%

function freq_Callback(hObject, eventdata, handles)

function freq_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function modu_Callback(hObject, eventdata, handles)

function modu_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function OSGleft_Callback(hObject, eventdata, handles)
function OSGright_Callback(hObject, eventdata, handles)

function slider2_Callback(hObject, eventdata, handles)

global choice;

switch choice
    
    case 2
        
exten=get(hObject,'Valu')+0.1;

if exten==1.1
    exten=1.0;
end
set(handles.axes3,'Xlim',[0 exten]);

    case 1
        
exten=get(hObject,'Valu')*10+1;

if exten==11
    exten=10;
end
set(handles.axes4,'Xlim',[0 exten]);
set(handles.axes5,'Xlim',[0 exten]);
end

function slider2_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[1 1 1]);
end



