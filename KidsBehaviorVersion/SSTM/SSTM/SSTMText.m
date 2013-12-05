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

function SSTMText(Text,Font,Size,Color,VPosition,WindowPtr,AdjH,AdjV)
global ptb3

% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% Function used to display the texts and center it.
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
if ptb3
    Screen('TextSize',WindowPtr,Size);
    DrawFormattedText(WindowPtr, Text, 400*AdjH-length(Text)*Size/3-10, VPosition*AdjV-35, Color);
    Screen('Flip', WindowPtr,[],1);
else
    Screen(WindowPtr,'TextFont',Font);
    Screen(WindowPtr,'TextSize',Size);
    width=Screen(WindowPtr,'TextWidth',Text);
    Screen(WindowPtr,'DrawText',Text,400*AdjH-width/2,VPosition*AdjV,Color);
end
