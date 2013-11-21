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

function [charx, t] = getresponse(screenparms,noblink)
global ptb3

startSecs = GetSecs;
blink = startSecs;

if ptb3;
    [newX, newY] = Screen('DrawText',screenparms.window, '');
else
    [newX, newY] = Screen(screenparms.window,'DrawText', '');
end;

black = BlackIndex(screenparms.window);
white = WhiteIndex(screenparms.window);
c = black;
while 1
    [keyIsDown,timeSecs,keyCode] = KbCheck;
    if keyCode(KbName('f12'))
        error('User terminated WMCBattery');
    end
    if (timeSecs - blink) > .3
        blink = timeSecs;
        if c == black
            c = white;
        else
            c = black;
        end

        if nargin==1   %only blink if not suppressed by noblink 2nd arg
            if ptb3;
                Screen('DrawText',screenparms.window, '_', newX, newY, c);
            else
                Screen(screenparms.window,'DrawText', '_', newX, newY, c);
            end;
        end
    end
    if keyIsDown
        c = KbName(keyCode);
        if length(c)>1 && ~ismember(c(1),'0':'9')
            c = '.';
        end
        charx = upper(c(1));
        t = timeSecs-startSecs;

        if ptb3;
            Screen('DrawText',screenparms.window, '_', newX, newY, white);
            Screen('DrawText',screenparms.window, '', newX, newY, white);
        else
            Screen(screenparms.window,'DrawText', '_', newX, newY, white);
            Screen(screenparms.window,'DrawText', '', newX, newY, white);
        end;
        break;
    end
end
%FlushEvents('keyDown');
