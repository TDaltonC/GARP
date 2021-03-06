function [ output_args ] = oneItemChoice(item1,item2,w)
%One item on each half of screen
     screenNumber = max(Screen('Screens'));
     [width height] = Screen('WindowSize', screenNumber);

    %% If input srguments are not provided, these gives the defauls values
    if exist('item1','var') == 0;
        item1 = imread('juice.jpg');
    end
    if exist('item2','var') == 0;
        item2 = imread('chips.jpg');
    end
    
    item1t = Screen('MakeTexture',w,item1); 
    item2t = Screen('MakeTexture',w,item2);

%% These are the position values for the item of the ***LEFT*** side of the screen
    leftLeft = width/6;
    leftTop = 3*height/7;
    leftRight = (1.5)*width/6;
    leftBottom = 4*height/7;
    
%% These are the position values for the item of the ***RIGHT*** side of the screen
    rightLeft = (4.5)*width/6;
    rightTop = 3*height/7;
    rightRight = 5*width/6;
    rightBottom = 4*height/7;
    
%%
    %I have to create these variables as empty sets ahead of time, this is
    %becuase of how cat() works
draw = [];
leftPositions = [];
topPositions = [];
rightPositions = [];
bottomPositions = [];

i = 1;
j = 1;
if i >= 1;
    draw = cat(1,draw,item1t);  % These are concatonated in the FIRST dimention (cat(1, . . .)) because they need to be seperated by ","
    leftPositions = cat(2,leftPositions, leftLeft);  % These are concatonated in the SECOND dimention (cat(2, . . .)) because they need to be seperated by ";"
    topPositions = cat(2,topPositions, leftTop); 
    rightPositions = cat(2,rightPositions, leftRight);
    bottomPositions = cat(2,bottomPositions, leftBottom);
end


if j >= 1;
    draw = cat(1,draw,item2t);
    leftPositions = cat(2,leftPositions, rightLeft);
    topPositions = cat(2,topPositions, rightTop);
    rightPositions = cat(2,rightPositions, rightRight);
    bottomPositions = cat(2,bottomPositions, rightBottom);
end

positions = cat(1,leftPositions,topPositions,rightPositions,bottomPositions);

    Screen('DrawTextures',w,draw,[],positions);
    % Screen('Flip',w);
end
