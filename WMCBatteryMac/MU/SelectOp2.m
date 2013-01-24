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

function [Op, value] = SelectOp2(value, Oploc, Op, step)

ok = 0;
while ok == 0
    n = randperm(8);
    sg = randperm(2);
    Op(step) = n(1);
    if sg(1) == 1, Op(step) = -Op(step); end
    newvalue = value(Oploc(step)) + Op(step);
    if and(newvalue > 0, newvalue < 10), ok = 1; end
    if step > 1
       if abs(Op(step)) == abs(Op(step-1)), ok = 0; end  %forces new operation to have different absolute value from previous one
    end
end
value(Oploc(step)) = newvalue;

    
