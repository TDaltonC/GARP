function [ output_args ] = drawBreak( w )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% screenNumber = max(Screen('Screens'));
% [width height] = Screen('WindowSize', screenNumber);

if exist('w','var') == 0;
        w = Screen(screenNumber, 'OpenWindow',[],[],[],[]);
end
Screen(w,'TextSize',300)
DrawFormattedText(w, 'break', 'center', 'center', [0 0 0]);

% Screen('Flip',w);
% WaitSecs(.2)
% KbWait
% Screen('CloseAll') 

end

