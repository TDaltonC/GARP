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

function [Order RecTrial]=RandLoc2(subject)
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% This function used to random the oringial dot locations data. In order to
% random the data for different participants.
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
load('OrinTrial');

for j=1:2
    RecTrial{j,1}=OrinTrial{j,1};
    RecTrial{j,2}=OrinTrial{j,2};
    RecTrial{j,3}=OrinTrial{j,3};
end;

seed = 54369; %use 'seed=54369 + subject;' to change sequence for each subject
rand ('state', seed);
NumTrial=size(OrinTrial);

%For all trials are fully randomized 
Order=randperm(30)';
k=1;
for j=3:NumTrial(1,1)
    RecTrial{j,1}=OrinTrial{Order(k,1)+2,1};
    RecTrial{j,2}=OrinTrial{Order(k,1)+2,2};
    RecTrial{j,3}=OrinTrial{Order(k,1)+2,3};
    k=k+1;
end;
