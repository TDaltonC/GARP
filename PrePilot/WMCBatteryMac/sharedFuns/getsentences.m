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

%This function receives an N x 2 cell array with a large number of
%sentences, plus a random array of [0 1..] that is of length 'list length'
%and indicates whether a sentence should be meaningful (1) or not (0). The
%function returns an array of sentences for that trial whose meaningfulness
%matches the input array of [0 1...]. The function assumes that meaningful
%sentences are in column 1 of the cell array, and meaningless sentences in
%column 2. The rows are indexed by global variables mfulptr and mlessptr
%which are advanced after each sentence has been assigned.

function ss4trial = getsentences (allsentences, meanings)
global mfulptr mlessptr

ss4trial=cell(size(meanings));
for i=1:length(meanings)
    if meanings(i)==1
        ss4trial{i} = allsentences{mfulptr, 1};
        mfulptr = mfulptr + 1;
    else
        ss4trial{i} = allsentences{mlessptr,2};
        mlessptr = mlessptr+1;
    end
end
