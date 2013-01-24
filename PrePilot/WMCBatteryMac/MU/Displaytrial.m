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
function [WW, response] = Displaytrial(screenparms, expinfo, trial)
global ptb3

if ptb3
    Screen('TextSize', screenparms.window,expinfo.stimulussize);
    Screen('TextFont', screenparms.window,screenparms.sansSerifFont);
else
    Screen(screenparms.window,'TextFont',screenparms.sansSerifFont);
    Screen(screenparms.window,'TextSize',expinfo.stimulussize);
end

maxrect=screenparms.rect;
maxx = maxrect(3); maxy = maxrect(4);
frame = [0, 0, maxx/6, maxy/4];
bottomrect = [0, 6*maxy/7, maxx, maxy];

switch trial.setsize
    case 2
        X = [maxx/3, 2*maxx/3];
        Y = [maxy/2, maxy/2];
    case 3
        X = [maxx/4, maxx/2, 3*maxx/4];
        Y = [maxy/2, maxy/2, maxy/2];
    case 4
        X = [maxx/3, 2*maxx/3, maxx/3, 2*maxx/3];
        Y = [maxy/3, maxy/3, 2*maxy/3, 2*maxy/3];
    case 5
        X = [maxx/4, maxx/2, 3*maxx/4, maxx/3, 2*maxx/3];
        Y = [maxy/3, maxy/3, maxy/3, 2*maxy/3, 2*maxy/3];
    case 6
        X = [maxx/4, maxx/2, 3*maxx/4, maxx/4, maxx/2, 3*maxx/4];
        Y = [maxy/3, maxy/3, maxy/3, 2*maxy/3, 2*maxy/3, 2*maxy/3];
end


%draw frames
cls(screenparms);
for r = 1:trial.setsize
    Frame(r).rect = CenterRectOnPoint(frame, X(r), Y(r));
    Frame(r).inrect = InsetRect(Frame(r).rect,2,2);
    if ptb3
        Screen('FrameRect',screenparms.window,[],Frame(r).rect);
    else
        Screen(screenparms.window,'FrameRect',[],Frame(r).rect);
    end
end
if ptb3, Screen('Flip', screenparms.window,[],1); end
WaitSecs(expinfo.startinterval);


for i=1:trial.setsize   %display start values
    frameText(screenparms.window, mat2str(trial.startvalue(i)), X(i), Y(i));
    WaitSecs(expinfo.prestime(1));
    clrFrame(Frame(i).inrect);
    WaitSecs(expinfo.iii);
end

for i=1:trial.opnum  %display operations until interruption
    if trial.op(i) > 0
        operation = ['+', mat2str(trial.op(i))];
    else
        operation = mat2str(trial.op(i));
    end
    frameText(screenparms.window, operation, X(trial.oploc(i)), Y(trial.oploc(i)));
    WaitSecs(expinfo.prestime(2));
    clrFrame(Frame(trial.oploc(i)).inrect);
    WaitSecs(expinfo.iii);
end

WW = -ones(1,6);
response=['0' '0' '0' '0' '0' '0'];
for i=trial.testorder(1:trial.setsize)   %display question marks for final recall
    frameText(screenparms.window, '?', X(i), Y(i));
    [response(i), RT] = getresponse(screenparms,1);  %second arg suppresses blink
    WW(i) = response(i) == mat2str(trial.endvalue(i));
    clrFrame(Frame(i).inrect)
    frameText(screenparms.window, response(i), X(i), Y(i));
    WaitSecs(expinfo.itesti);
    clrFrame(Frame(i).inrect)
    clrFrame(bottomrect)
end
cls(screenparms);


    function frameText(w,text,x,y,color)
        % Displays a text centered on x, y,
        % w = window, color does not need to be specified (default = black)

        if nargin < 5, color = BlackIndex(w); end
        if ptb3
            height=Screen('TextSize',w);
            ftX = x - height/2;
            ftY = y;           
            Screen('DrawText',w, text, ftX, ftY, color);
            Screen('Flip', screenparms.window,[],1);            
        else
            width=Screen(w,'TextWidth',text);
            height=Screen(w,'TextSize');
            ftX = x - width/2;
            ftY = y + height/2;  
            Screen(w,'DrawText',text, ftX, ftY, color);
        end
    end

    function clrFrame(f)
        if ptb3
            Screen('FillRect',screenparms.window,screenparms.white,f);
            Screen('Flip', screenparms.window,[],1);    
        else
            Screen(screenparms.window,'FillRect', [], f);
        end
    end

end