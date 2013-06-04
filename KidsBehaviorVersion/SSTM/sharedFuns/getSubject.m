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

function subject=getSubject(screenparms)
global ptb3
while 1
    if ptb3
        subject = str2double(Ask(screenparms.window,'Enter Subject Number (followed by Enter or Return):',...
            screenparms.black,screenparms.white, 'GetChar', RectLeft, RectTop, 10));
    else
        subject = GetEchoNumber(screenparms.window, ...
            'Enter Subject Number (followed by Enter or Return):',...
            100,100,screenparms.black,screenparms.white);
    end
    if subject > 0 && subject <= 10000, break; end
    cls(screenparms);
    WaitSecs(0.1); 
end