% This program forms part of the Working Memory Capacity Battery, 
% written by Stephan Lewandowsky, Klaus Oberauer, Lee-Xieng Yang, and Ullrich Ecker. 
% The WMCBattery is available online at the website of the Cognitive Science
% Laboratories of the University of Western Australia's School of Psychology:
% http://www.cogsciwa.com ("Software" button on main menu).
% Conditions of Use: Using the WMCBattery is free of charge but the authors 
% request that the associated paper be cited (add details later) 
% when publications arise out of data collection with the WMCBattery. 
% The authors do not guarantee the WMCBattery's functionality. 
% This task requires Matlab version 7.5 (2007b) or higher and the 
% Psychophysics Toolbox version 2.54 or 3.0.8. 

function DisPlayDot(screenparms,Text,Time,Trial,NumIndex,AdjH,AdjV,RecTrial,Dot,Board,WindowPtr)
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% this function used to display the dots in each trial
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
global ptb3

SSTMText(Text.Fix,'Arial',Text.Size2,Text.Color1,300,WindowPtr,AdjH,AdjV)
WaitSecs(Time.Alert);

cls(screenparms);
rect_screen=screenparms.rect;
if (rect_screen(3)/rect_screen(4))>4/3%Check if widescreen is used
    AdjH1=rect_screen(4)/600;
    LeftOriginal=151*AdjV;
    p=1;%for widescreen
    for i=1:11
        if ptb3
            Screen('DrawLine',WindowPtr,Text.Color1,LeftOriginal*AdjH1,(51+(i-1)*50)*AdjV,(LeftOriginal+500)*AdjH1,(51+(i-1)*50)*AdjV,1);
            Screen('DrawLine',WindowPtr,Text.Color1,(LeftOriginal+(i-1)*50)*AdjH1,51*AdjV,(LeftOriginal+(i-1)*50)*AdjH1,551*AdjV,1);
        else
            SCREEN(WindowPtr,'DrawLine',Text.Color1,LeftOriginal*AdjH1,(51+(i-1)*50)*AdjV,(LeftOriginal+500)*AdjH1,(51+(i-1)*50)*AdjV,2,[],'patCopy');
            SCREEN(WindowPtr,'DrawLine',Text.Color1,(LeftOriginal+(i-1)*50)*AdjH1,51*AdjV,(LeftOriginal+(i-1)*50)*AdjH1,551*AdjV,2,[],'patCopy');
        end
    end;
else
    AdjH1=AdjH;
    p=0;
    for i=1:11
        if ptb3
            Screen('DrawLine',WindowPtr,Text.Color1,151*AdjH,(51+(i-1)*50)*AdjV,651*AdjH,(51+(i-1)*50)*AdjV,1);
            Screen('DrawLine',WindowPtr,Text.Color1,(151+(i-1)*50)*AdjH,51*AdjV,(151+(i-1)*50)*AdjH,551*AdjV,1);
        else
            SCREEN(WindowPtr,'DrawLine',Text.Color1,151*AdjH,(51+(i-1)*50)*AdjV,651*AdjH,(51+(i-1)*50)*AdjV,2,[],'patCopy');
            SCREEN(WindowPtr,'DrawLine',Text.Color1,(151+(i-1)*50)*AdjH,51*AdjV,(151+(i-1)*50)*AdjH,551*AdjV,2,[],'patCopy');
        end
    end;
end
if ptb3, Screen('Flip', WindowPtr,[],1); end
WaitSecs(Time.PostAlert);
NumDot=NumIndex(1,Trial);

for DotIndex=1:NumDot
    Loc=CalLoc(Dot.Size,Dot.Gap,RecTrial{Trial,1}(DotIndex,:),AdjH1,AdjV,p);
    if ptb3
        Screen('FillOval',WindowPtr,Text.Color1,Loc);        
        Screen('Flip', WindowPtr,[],1);
    else
        SCREEN(WindowPtr,'FillOval',Text.Color1,Loc);
    end
    WaitSecs(Time.Dot);
    if ptb3
        Screen('FillRect',WindowPtr,Text.Color2,Loc);        
        Screen('Flip', WindowPtr,[],1);        
    else
        SCREEN(WindowPtr,'FillRect',Text.Color2,Loc);
    end
    WaitSecs(Time.PostDot);
end;
WaitSecs(Time.PostTrial);

% Draw the "End Please Draw the Dots"
if ptb3
    Screen('FillRect',WindowPtr,Text.Color1,[(Board.Left-4)*AdjH (Board.Top-4)*AdjV (Board.Right+4)*AdjH (Board.Bottom+4)*AdjV]);
    Screen('FillRect',WindowPtr,Text.Color2,[(Board.Left-2)*AdjH (Board.Top-2)*AdjV (Board.Right+2)*AdjH (Board.Bottom+2)*AdjV]);
    Screen('FillRect',WindowPtr,Text.Color1,[Board.Left*AdjH Board.Top*AdjV Board.Right*AdjH Board.Bottom*AdjV]);
    Screen('FillRect',WindowPtr,Text.Color2,[(Board.Left+2)*AdjH (Board.Top+2)*AdjV (Board.Right-2)*AdjH (Board.Bottom-2)*AdjV]);
    Screen('Flip', WindowPtr);
else
    SCREEN(WindowPtr,'FillRect',Text.Color1,[(Board.Left-4)*AdjH (Board.Top-4)*AdjV (Board.Right+4)*AdjH (Board.Bottom+4)*AdjV]);
    SCREEN(WindowPtr,'FillRect',Text.Color2,[(Board.Left-2)*AdjH (Board.Top-2)*AdjV (Board.Right+2)*AdjH (Board.Bottom+2)*AdjV]);
    SCREEN(WindowPtr,'FillRect',Text.Color1,[Board.Left*AdjH Board.Top*AdjV Board.Right*AdjH Board.Bottom*AdjV]);
    SCREEN(WindowPtr,'FillRect',Text.Color2,[(Board.Left+2)*AdjH (Board.Top+2)*AdjV (Board.Right-2)*AdjH (Board.Bottom-2)*AdjV]);
end
SSTMText('End','Arial',Text.Size3,Text.Color1,250,WindowPtr,AdjH,AdjV);
SSTMText(Text.Draw,'Arial',Text.Size2,Text.Color1,350,WindowPtr,AdjH,AdjV);
WaitSecs(Time.Result);
cls(screenparms);

