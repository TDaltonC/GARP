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

%auxiliary function to make an operation that is true
function top = maketrueop
oprtr = ['+', '-'];

while (1)
    oprnd1 = num2str(ceil (rand*10));	%sets ceiling for the 1st operand (here 10)
    oprnd2 = num2str(ceil (rand*10));	%sets ceiling for the 2nd operand (here 10)

    lhs = [oprnd1 oprtr(ceil (rand*2)) oprnd2];
    result = num2str(eval(lhs));
    if str2double(result) > 0
        break
    end
end



top = [lhs '=' result];
end
