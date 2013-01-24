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

function [resps, rts, senresps, sentrts] = dosentspantrial(screenparms, expinfo, trial)
global ptb3

senresps = zeros(1,length(trial.list));
sentrts  = zeros(1,length(trial.list));
rts      = zeros(1,length(trial.list));
resps    = repmat(' ',1,length(trial.list));

%fixation point
centertext (screenparms, expinfo, '+', 1);
WaitSecs(1.5);
cls(screenparms);

for i=1:length(trial.list)
    %present sentence & get judgment
    printsentence (screenparms, expinfo, trial.sentences{i})
    [tempr, sr] = noblinkgetresponse(screenparms,expinfo);
    cls(screenparms);
    switch tempr
        case expinfo.yeskey
            senresps(i) = 1;
        case expinfo.nokey
            senresps(i) = 0;
        otherwise
            senresps(i)=-9;
    end
    sentrts(i)=sr;

    %now present TBR item
    centertext (screenparms, expinfo, trial.list(i), 1);
    WaitSecs (expinfo.Presentationduration);
    cls(screenparms);

    if i < length(trial.list), WaitSecs(expinfo.iii); end
end

%commence retrieval
for i=1:length(trial.list)
    expinfo.leftofcenter = 5;              %print prompt
    centertext (screenparms, expinfo, '? ', 1);
    expinfo.leftofcenter = 0;
    %activate only letter keys
    resps(i) = ' ';
    while ~any(strcmp(resps(i),{'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'}));

        [resps(i), rts(i)]= getresponse(screenparms);
    end
    expinfo.leftofcenter = 5;              %briefly present response
    centertext (screenparms, expinfo, '? ', 1);
    expinfo.leftofcenter = 0;
    if ptb3;
        Screen('DrawText',screenparms.window, upper(resps(i)));
        Screen('Flip', screenparms.window);
    else
        Screen(screenparms.window,'DrawText', upper(resps(i)));
    end;
    WaitSecs(expinfo.responsevisible);
    cls(screenparms);
end
cls(screenparms);



%------------------ auxiliary function does actual presentation
function printsentence(screenparms,expinfo, msg)
    cls(screenparms);
    if ptb3
        Screen('TextSize', screenparms.window , expinfo.msgsize);
        DrawFormattedText(screenparms.window, double(msg), 'center', 'center', screenparms.black);
        Screen('Flip', screenparms.window);
    else
        Screen(screenparms.window,'TextSize',expinfo.msgsize);
        Screen(screenparms.window,'TextFont',screenparms.sansSerifFont);

        width=screen(screenparms.window,'TextWidth',msg);
        height=Screen(screenparms.window,'TextSize');
        Screen(screenparms.window,'DrawText', msg, screenparms.rect(3)/2 - width/2, screenparms.rect(4)/2 - height/2);
    end
end

end