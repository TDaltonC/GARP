function [ output_args ] = drawFixation(window)
% Simple -- It draws a fiation cross on the off screen window.
screenNumber = max(Screen('Screens'));
%[window, rect] = Screen('OpenWindow', screenNumber, 128,[],[],[]);
[width height] = Screen('WindowSize', screenNumber);
rect = [0,0,width,height];
[X,Y] = RectCenter(rect);
FixCross = [X-1,Y-40,X+1,Y+40;X-40,Y-1,X+40,Y+1];
Screen('FillRect', window, [0,0,0], FixCross');
Screen('Flip', window);
%WaitSecs(2)
%sca

end

