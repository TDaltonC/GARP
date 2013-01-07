function [ output_args ] = drawFixation(w)
% Simple -- It draws a fiation cross on the off screen window.
screenNumber = max(Screen('Screens'));
%[window, rect] = Screen('OpenWindow', screenNumber, 128,[],[],[]);
[X,Y] = RectCenter(rect);
FixCross = [X-1,Y-40,X+1,Y+40;X-40,Y-1,X+40,Y+1];
Screen('FillRect', w, [0,0,0], FixCross');
Screen('Flip', w);
WaitSecs(2)
sca

end

