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

function [cx, t] = noblinkgetresponse(screenparms, expinfo)

startSecs = GetSecs;
cut = 0;
cx = ' ';
t = 0;
while cut < expinfo.ptDuration       %max duration 
    [keyIsDown,timeSecs,keyCode] = KbCheck;
    if keyCode(KbName('f12'))
        error('User terminated WMCBattery');
    end
    if keyIsDown
        cx = upper(KbName(keyCode));
        if length(cx)==2, cx=cx(1); end
        t = timeSecs-startSecs;
        while KbCheck; end
        %only activate response keys
        if strcmp(cx,expinfo.yeskey) || strcmp(cx,expinfo.nokey)
            break;
        end
    end
    cut = GetSecs - startSecs;
end
%if no response is given, return "." and RT 0
if isempty(cx)
    cx = '.';
    t = 0;
end