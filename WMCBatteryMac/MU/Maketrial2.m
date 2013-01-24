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

% Make trials for MU arithmetic (2 practice followed by 15 test)
function Maketrial2(setsize,opnum)


fid = fopen ('mutrials.txt','w');

for trial = 1:length(setsize)

    st = randperm(9);
    startvalue = [st(1:setsize(trial)), zeros(1, 6-setsize(trial))];
    value = startvalue;

    Op = zeros(1,8);
    Oploc = zeros(1,8);
    for step = 1:opnum(trial)
        oploc = randperm(setsize(trial));
        Oploc(step) = oploc(1);
        [Op, value] = SelectOp2(value, Oploc, Op, step);
    end
    endvalue = value;
    testorder = [randperm(setsize(trial)), zeros(1, 6-setsize(trial))];
    
    fprintf (fid, '%1d %1d %1d   %1d %1d %1d %1d %1d %1d  ', trial, setsize(trial), opnum(trial), startvalue);
    fprintf (fid, '%1d %1d %1d %1d %1d %1d %1d %1d  ', Oploc);
    fprintf (fid, '%1d %1d %1d %1d %1d %1d %1d %1d  ', Op);
    fprintf (fid, '%1d %1d %1d %1d %1d %1d  ', testorder);
    fprintf (fid, '%1d %1d %1d %1d %1d %1d \n', endvalue);
    
end
fclose(fid);