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

function centertext (screenparms, expinfo, stimulus, onoff)
global ptb3

if onoff
    c = screenparms.black;
else
    c = screenparms.white;
end

if ptb3
    Screen('TextSize', screenparms.window , expinfo.stimulussize);
    DrawFormattedText(screenparms.window, stimulus , 'center', 'center', c);
    %DrawFormattedText centers only approximately. In case of unacceptable
    %deviation, the 'center' argument(s) can be replaced with number
    %(pixel) values, e.g., (..., 'center', 500); [0, 0] indexes the
    %top-left corner
    Screen('Flip', screenparms.window);
else
    fromtop = (screenparms.rect(RectBottom) - screenparms.rect(RectTop))/2 ...
        + expinfo.stimulussize/2 + expinfo.textrow;
    fromleft = (screenparms.rect(RectRight) - screenparms.rect(RectLeft))/2 ...
        - ( (length(stimulus)+expinfo.leftofcenter)/2 * ...
        (expinfo.stimulussize/2.5) );

    Screen(screenparms.window,'TextSize',expinfo.stimulussize);
    Screen(screenparms.window,'TextFont',screenparms.sansSerifFont);
    Screen(screenparms.window,'DrawText', stimulus, fromleft, fromtop, c);
end
