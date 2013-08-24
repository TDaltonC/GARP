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

function [RecAns,RT]=Response(screenparms,Trial,NumIndex,Dot,Text,Board,AdjH,AdjV,WindowPtr)
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% Subfunction of SSTM
% This function used to creat a response interface, and record the response
% location data.
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
global ptb3

rect_screen=screenparms.rect;
if (rect_screen(3)/rect_screen(4))>4/3%Check if widescreen is used
    AdjH=rect_screen(4)/600;
end

if (rect_screen(3)/rect_screen(4))>4/3%Check if widescreen is used
    AdjH1=rect_screen(4)/600;
    LeftOriginal=151*AdjV;
    Board.Left=151*AdjV;Board.Right=Board.Left+500;
    p=1;%for widescreen
    for i=1:11
        if ptb3
            Screen('DrawLine',WindowPtr,Text.Color1,LeftOriginal*AdjH1,(51+(i-1)*50)*AdjV,(LeftOriginal+500)*AdjH1,(51+(i-1)*50)*AdjV,2);
            Screen('DrawLine',WindowPtr,Text.Color1,(LeftOriginal+(i-1)*50)*AdjH1,51*AdjV,(LeftOriginal+(i-1)*50)*AdjH1,551*AdjV,2);
        else
            SCREEN(WindowPtr,'DrawLine',Text.Color1,LeftOriginal*AdjH1,(51+(i-1)*50)*AdjV,(LeftOriginal+500)*AdjH1,(51+(i-1)*50)*AdjV,2,[],'patCopy');
            SCREEN(WindowPtr,'DrawLine',Text.Color1,(LeftOriginal+(i-1)*50)*AdjH1,51*AdjV,(LeftOriginal+(i-1)*50)*AdjH1,551*AdjV,2,[],'patCopy');
        end
    end;
else
    p=0;
    for i=1:11
        if ptb3
            Screen('DrawLine',WindowPtr,Text.Color1,151*AdjH,(51+(i-1)*50)*AdjV,651*AdjH,(51+(i-1)*50)*AdjV,2);
            Screen('DrawLine',WindowPtr,Text.Color1,(151+(i-1)*50)*AdjH,51*AdjV,(151+(i-1)*50)*AdjH,551*AdjV,2);
        else
            SCREEN(WindowPtr,'DrawLine',Text.Color1,151*AdjH,(51+(i-1)*50)*AdjV,651*AdjH,(51+(i-1)*50)*AdjV,2,[],'patCopy');
            SCREEN(WindowPtr,'DrawLine',Text.Color1,(151+(i-1)*50)*AdjH,51*AdjV,(151+(i-1)*50)*AdjH,551*AdjV,2,[],'patCopy');
        end
    end;
end
if ptb3, Screen('Flip', WindowPtr,[],1); end
NumDot=NumIndex(1,Trial);


MaxAns=0;
tt=0;
stop=0;
RecAns=zeros(NumDot,2);
RecSec=zeros(NumDot,1);
SetMouse(400*AdjH,300*AdjV);

t1=GetSecs;
% Start the response process
while ~stop
    click=0;
    ShowCursor;
     while ~click
         [MPos(1,1) MPos(1,2) botton]=GetMouse(WindowPtr);
         click=botton(1);
     end;
     while click
         [MPos(1,1) MPos(1,2) botton]=GetMouse(WindowPtr);
         tSet=GetSecs;
         click=botton(1);
     end;
   % [clicks,MPos(1,1) MPos(1,2),whichButton]=GetClicks(WindowPtr,0)
    %HideCursor;
    tic;
    if ((MPos(1,1)>Board.Left*AdjH) && (Board.Right*AdjH>MPos(1,1))) && ((MPos(1,2)>Board.Top*AdjV) && (Board.Bottom*AdjV>MPos(1,2)))
        TemAnsLocIndex(1,1)=fix((MPos(1,1)-Board.Left*AdjH)/(Board.Cell*AdjH))+1;
        TemAnsLocIndex(1,2)=fix((MPos(1,2)-Board.Top*AdjV)/(Board.Cell*AdjV))+1;
        AnsLoc=CalLoc(Dot.Size,Dot.Gap,TemAnsLocIndex,AdjH,AdjV,p);
        %         Check if the current answer is on the board already, if it's
        %         true, then erase it.
        for Check=1:NumDot
            if TemAnsLocIndex==RecAns(Check,:)
                disp('a1')
                if ptb3
                     Screen('FillRect', WindowPtr,Text.Color2,AnsLoc);
                     Screen('Flip', WindowPtr,[],1);
                else
                    SCREEN(WindowPtr,'FillRect',Text.Color2,AnsLoc);
                end
                RecAns(Check,:)=[0 0];
                ifErase=1;
                break;
            else
                ifErase=0;
            end;
        end;
        %         If the current answer isn't on the board and the maxium allowed
        %         answer isn't reached, then draw it.
        if ifErase==0
            for Check=1:NumDot
                if sum(RecAns(Check,:))==0;
                    RecAns(Check,:)=TemAnsLocIndex(1,:);
                    RecSec(Check,1)=tSet;
                    if ptb3
                        Screen('FillOval', WindowPtr,Text.Color1,AnsLoc);
                        Screen('Flip', WindowPtr,[],1);
                    else
                        SCREEN(WindowPtr,'FillOval',Text.Color1,AnsLoc);
                    end
                    break;
                end;
            end;
        end;
        %         Check if the maxium allowed answer is reached, if it does show the next.
        if min(min(RecAns))~=0
            if ptb3
                Screen('FillRect',WindowPtr,Text.Color1,[400*AdjH-50 (587-20)*AdjV 400*AdjH+50 (587+5)*AdjV]);
                Screen('FillRect',WindowPtr,Text.Color2,[400*AdjH-50+1 (587-20)*AdjV+1 400*AdjH+50-1 (587+5)*AdjV-1]);
                Screen('Flip', WindowPtr,[],1);                
            else
                Screen(WindowPtr,'FillRect',Text.Color1,[400*AdjH-50 (587-20)*AdjV 400*AdjH+50 (587+5)*AdjV]);
                Screen(WindowPtr,'FillRect',Text.Color2,[400*AdjH-50+1 (587-20)*AdjV+1 400*AdjH+50-1 (587+5)*AdjV-1]);
            end
            SSTMText(Text.Next,'Arial',Text.Size1,Text.Color1,587,WindowPtr,AdjH,AdjV);
            MaxAns=1;
        elseif MaxAns==1 && min(min(RecAns))==0;
            if ptb3
                Screen('FillRect',WindowPtr,Text.Color2,[400*AdjH-50 (587-20)*AdjV 400*AdjH+50 (587+5)*AdjV]);
                Screen('Flip', WindowPtr,[],1); 
            else
                Screen(WindowPtr,'FillRect',Text.Color2,[400*AdjH-50 (587-20)*AdjV 400*AdjH+50 (587+5)*AdjV]);
            end
            MaxAns=0;
        else MaxAns=0;
        end;
        tt2=toc;tt=tt+tt2;
        tic;
    elseif (MPos(1,1)-(400*AdjH-50))*((400*AdjH+50)-MPos(1,1))>0 && (MPos(1,2)-(587-20)*AdjV)*((587+5)*AdjV-MPos(1,2))>0 &&MaxAns==1;
        ttt=toc;
        stop=1;
    end;
end;
RT=max(RecSec)-t1-tt-ttt;
HideCursor;