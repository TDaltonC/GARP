function [ output_args ] = DisplayImage(item1)
%Displays one image
    screenNumber = max(Screen('Screens'));
    [width height] = Screen('WindowSize', screenNumber);
    w = Screen(screenNumber, 'OpenWindow',[],[],[],[]);    
    item1 = imread('juice.jpg');
    item1t = Screen('MakeTexture',w,item1);   
    Screen('DrawTexture',w,item1t);
    Screen('Flip',w);
end

