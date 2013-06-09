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

function waitfkey (varargin)
global ptb3

screenparms = varargin{1};
expinfo = varargin{2};
msg = varargin{3};
while KbCheck; end

if ptb3
    Screen('TextSize', screenparms.window , expinfo.msgsize);
    Screen('TextFont', screenparms.window, screenparms.sansSerifFont);
    DrawFormattedText(screenparms.window, msg , 'center', 'center');
    %DrawFormattedText centers only approximately. In case of unacceptable
    %deviation, the 'center' argument(s) can be replaced with number
    %(pixel) values, e.g., (..., 'center', 500); [0, 0] indexes the top-left corner
    Screen('Flip', screenparms.window);
else
    expinfo.stimulussize=expinfo.msgsize;
    centertext (screenparms, expinfo, msg, 1);
end

if nargin==3
    SetMouse(0,0,screenparms.window);
    while 1
        [keyIsDown,timeSecs,keyCode] = KbCheck;
        if keyCode(KbName('f12'))
            error('User terminated WMCBattery');
        end
        
        if keyIsDown
            c = KbName(keyCode);
            while KbCheck; end
            if strcmp(c,'space')
                break;
            end
        end
        [MPos(1,1) MPos(1,2) botton]=GetMouse(screenparms.window);
        if MPos(1,1) ~= 0
            break;
        end;
    end
    cls(screenparms);
    while KbCheck; end
end