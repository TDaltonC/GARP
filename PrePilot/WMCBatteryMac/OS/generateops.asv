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

%This function generates operations for the ops task and returns them in
%two arrays:
%   pracsentences = cell array two columns, true and false
%   allsentences =  cell array two columns, true and false
%where the number of rows is Ntotalops for allsentences and Npracops for
%pracsentences.
%Note that only approximately half of each column will be used because true
%and false are randomly determined on each trial. So there is some generous
%padding going on here.

function [pracsentences, allsentences] = generateops(Ntotalops, Npracops)

allsentences  = cell(Ntotalops,2);
pracsentences = cell(Npracops,2);
for i=1:Ntotalops
    allsentences{i,1}=maketrueop;
    allsentences{i,2}=makefalseop;
end

for i=1:Npracops
    pracsentences{i,1}=maketrueop;
    pracsentences{i,2}=makefalseop;
end
end

