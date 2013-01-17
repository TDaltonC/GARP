function [ output_args ] = fourItemGARP( item1, item2, item3, item4, item5, item6, item7, item8, ...
                                        amountOfItem1, amountOfItem2, amountOfItem3, amountOfItem4, ...
                                        amountOfItem5, amountOfItem6, amountOfItem7, amountOfItem8, w )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    screenNumber = max(Screen('Screens'));
    [width height] = Screen('WindowSize', screenNumber);
   
   
    
    %% Defaults --- If input arguments are not provided, these gives the default values
    
    if exist('item1','var') == 0;
        item1 = imread('pear.jpg');
    end
    if exist('item2','var') == 0;
        item2 = imread('apple.jpg');
    end
    if exist('item3','var') == 0;
        item3 = imread('banana.png');
    end
    if exist('item4','var') == 0;
        item4 = imread('grey.jpg');
    end
    if exist('item5','var') == 0;
        item5 = imread('banana.png');
    end
    if exist('item6','var') == 0;
        item6 = imread('apple.jpg');
    end
    if exist('item7','var') == 0;
        item7 = imread('pear.jpg');
    end
    if exist('item8','var') == 0;
        item8 = imread('grey.jpg');
    end
    
    
    if exist('amountOfItem1','var') == 0; % If 'amountOfItem1' doesn't exist  . . . 
        amountOfItem1 = 4;                % Create it and set it equal to (default)
    end

    if exist('amountOfItem2','var') == 0; 
        amountOfItem2 = 5;
    end
    
    if exist('amountOfItem3','var') == 0; 
        amountOfItem3 = 5;                
    end

    if exist('amountOfItem4','var') == 0; 
        amountOfItem4 = 5;
    end
    
    if exist('amountOfItem5','var') == 0; 
        amountOfItem5 = 2;                
    end

    if exist('amountOfItem6','var') == 0; 
        amountOfItem6 = 5;
    end
    
    if exist('amountOfItem7','var') == 0; 
        amountOfItem7 = 5;               
    end

    if exist('amountOfItem8','var') == 0; 
        amountOfItem8 = 5;
    end
    
    if exist('w','var') == 0;
        w = Screen(screenNumber, 'OpenWindow',[],[],[],[]);
    end
    
    black = imread('black.jpg');
    grey = imread('grey.jpg');
    
    %% Make all of the tesxtures
    item1t = Screen('MakeTexture',w,item1); 
    item2t = Screen('MakeTexture',w,item2);
    item3t = Screen('MakeTexture',w,item3); 
    item4t = Screen('MakeTexture',w,item4);
    item5t = Screen('MakeTexture',w,item5); 
    item6t = Screen('MakeTexture',w,item6);
    item7t = Screen('MakeTexture',w,item7); 
    item8t = Screen('MakeTexture',w,item8);
    blackt = Screen('MakeTexture',w,black);
    greyt = Screen('MakeTexture',w,grey);
    
    %% These are all of the position constants  

    centerw = width/2;  % This the center width of the screen
    centerh = height/2; % THe center of the height of the screen
    eccen =   150;       % This is the eccentricity. Distance from the center to the right edge of the array
    itemw =   70;       % The width of one item in the array
    itemh =   1.5*itemw;% The hight of one item in the array
    gutterw = 20;       % The width of the gutters between the items
    gutterh = 20;       % The hight of the gutters between the items
    
    devLineHeight = height*.9;  % The height of the black box inthe middle of the screen
    devLineWidth  = 1;          % The width of the black box in the middle of the screen
    
    % Everything below here is coded in terms of the numbers above
    
    pwl1= centerw - eccen;
    pwl2= pwl1 - itemw;
    pwl3= pwl2 - gutterw;
    pwl4= pwl3 - itemw;
    pwl5= pwl4 - gutterw;
    pwl6= pwl5 - itemw;
    pwl7= pwl6 - gutterw;
    pwl8= pwl7 - itemw;
    
    pwr1= centerw + eccen;
    pwr2= pwr1 + itemw;
    pwr3= pwr2 + gutterw;
    pwr4= pwr3 + itemw;
    pwr5= pwr4 + gutterw;
    pwr6= pwr5 + itemw;
    pwr7= pwr6 + gutterw;
    pwr8= pwr7 + itemw;
    
    ph1= centerh - (2*gutterh + 2.5*itemh);
    ph2= ph1 + itemh;
    ph3= ph2 + gutterh;
    ph4= ph3 + itemh;
    ph5= ph4 + gutterh;
    ph6= ph5 + itemh;
    ph7= ph6 + gutterh;
    ph8= ph7 + itemh;
    ph9= ph8 + gutterh;
    ph10=ph9 + itemh;
    
% These are here so that the cat()'s will have something to grab on to.

    draw = [];
    leftPositions = [];
    topPositions = [];
    rightPositions = [];
    bottomPositions = [];

% The line that devides the the screen in half    
    
     draw = cat(1,draw,blackt);
     leftPositions = cat(2,leftPositions,    centerw - devLineWidth);
     topPositions = cat(2,topPositions,      centerh - devLineHeight/2);
     rightPositions = cat(2,rightPositions,  centerw + devLineWidth);
     bottomPositions = cat(2,bottomPositions,centerh + devLineHeight/2);

    
% Left    
% Box 1L    
if amountOfItem1 >= 1;  %If there is supposed to be one or more item(s) on the left, Add all on the numbers that we need to add so that a image will be drawn in the 1 position
    draw = cat(1,draw,item1t);
    leftPositions = cat(2,leftPositions,    pwl2);
    topPositions = cat(2,topPositions,       ph5); 
    rightPositions = cat(2,rightPositions,  pwl1);
    bottomPositions = cat(2,bottomPositions, ph6);
end
% Box 2L    
if amountOfItem1 >= 2;
    draw = cat(1,draw,item1t);
    leftPositions = cat(2,leftPositions,    pwl2);
    topPositions = cat(2,topPositions,       ph3); 
    rightPositions = cat(2,rightPositions,  pwl1);
    bottomPositions = cat(2,bottomPositions, ph4);
end
% Box 3L
if amountOfItem1 >= 3;
    draw = cat(1,draw,item1t);
    leftPositions = cat(2,leftPositions,    pwl2);
    topPositions = cat(2,topPositions,       ph7); 
    rightPositions = cat(2,rightPositions,  pwl1);
    bottomPositions = cat(2,bottomPositions, ph8);
end
% Box 4L
if amountOfItem1 >= 4;
    draw = cat(1,draw,item1t);
    leftPositions = cat(2,leftPositions,    pwl2);
    topPositions = cat(2,topPositions,       ph1); 
    rightPositions = cat(2,rightPositions,  pwl1);
    bottomPositions = cat(2,bottomPositions, ph2);
end
% Box 5L
if amountOfItem1 >= 5;
    draw = cat(1,draw,item1t);
    leftPositions = cat(2,leftPositions,    pwl2);
    topPositions = cat(2,topPositions,       ph9); 
    rightPositions = cat(2,rightPositions,  pwl1);
    bottomPositions = cat(2,bottomPositions, ph10);
end

% Box 6L    
if amountOfItem2 >= 1;
    draw = cat(1,draw,item2t);
    leftPositions = cat(2,leftPositions,    pwl4);
    topPositions = cat(2,topPositions,       ph5); 
    rightPositions = cat(2,rightPositions,  pwl3);
    bottomPositions = cat(2,bottomPositions, ph6);
end
% Box 7L    
if amountOfItem2 >= 2;
    draw = cat(1,draw,item2t);
    leftPositions = cat(2,leftPositions,    pwl4);
    topPositions = cat(2,topPositions,       ph3); 
    rightPositions = cat(2,rightPositions,  pwl3);
    bottomPositions = cat(2,bottomPositions, ph4);
end
% Box 8L
if amountOfItem2 >= 3;
    draw = cat(1,draw,item2t);
    leftPositions = cat(2,leftPositions,    pwl4);
    topPositions = cat(2,topPositions,       ph7); 
    rightPositions = cat(2,rightPositions,  pwl3);
    bottomPositions = cat(2,bottomPositions, ph8);
end
% Box 9L
if amountOfItem2 >= 4;
    draw = cat(1,draw,item2t);
    leftPositions = cat(2,leftPositions,    pwl4);
    topPositions = cat(2,topPositions,       ph1); 
    rightPositions = cat(2,rightPositions,  pwl3);
    bottomPositions = cat(2,bottomPositions, ph2);
end
% Box 10L
if amountOfItem2 >= 5;
    draw = cat(1,draw,item2t);
    leftPositions = cat(2,leftPositions,    pwl4);
    topPositions = cat(2,topPositions,       ph9); 
    rightPositions = cat(2,rightPositions,  pwl3);
    bottomPositions = cat(2,bottomPositions, ph10);
end
   
% Box 11L    
if amountOfItem3 >= 1; 
    draw = cat(1,draw,item3t);
    leftPositions = cat(2,leftPositions,    pwl6);
    topPositions = cat(2,topPositions,       ph5); 
    rightPositions = cat(2,rightPositions,  pwl5);
    bottomPositions = cat(2,bottomPositions, ph6);
end
% Box 12L    
if amountOfItem3 >= 2;
    draw = cat(1,draw,item3t);
    leftPositions = cat(2,leftPositions,    pwl6);
    topPositions = cat(2,topPositions,       ph3); 
    rightPositions = cat(2,rightPositions,  pwl5);
    bottomPositions = cat(2,bottomPositions, ph4);
end
% Box 13L
if amountOfItem3 >= 3;
    draw = cat(1,draw,item3t);
    leftPositions = cat(2,leftPositions,    pwl6);
    topPositions = cat(2,topPositions,       ph7); 
    rightPositions = cat(2,rightPositions,  pwl5);
    bottomPositions = cat(2,bottomPositions, ph8);
end
% Box 14L
if amountOfItem3 >= 4;
    draw = cat(1,draw,item3t);
    leftPositions = cat(2,leftPositions,    pwl6);
    topPositions = cat(2,topPositions,       ph1); 
    rightPositions = cat(2,rightPositions,  pwl5);
    bottomPositions = cat(2,bottomPositions, ph2);
end
% Box 15L
if amountOfItem3 >= 5;
    draw = cat(1,draw,item3t);
    leftPositions = cat(2,leftPositions,    pwl6);
    topPositions = cat(2,topPositions,       ph9); 
    rightPositions = cat(2,rightPositions,  pwl5);
    bottomPositions = cat(2,bottomPositions, ph10);
end

% Box 16L    
if amountOfItem4 >= 1;
    draw = cat(1,draw,item4t);
    leftPositions = cat(2,leftPositions,    pwl8);
    topPositions = cat(2,topPositions,       ph5); 
    rightPositions = cat(2,rightPositions,  pwl7);
    bottomPositions = cat(2,bottomPositions, ph6);
end
% Box 17L    
if amountOfItem4 >= 2;
    draw = cat(1,draw,item4t);
    leftPositions = cat(2,leftPositions,    pwl8);
    topPositions = cat(2,topPositions,       ph3); 
    rightPositions = cat(2,rightPositions,  pwl7);
    bottomPositions = cat(2,bottomPositions, ph4);
end
% Box 18L
if amountOfItem4 >= 3;
    draw = cat(1,draw,item4t);
    leftPositions = cat(2,leftPositions,    pwl8);
    topPositions = cat(2,topPositions,       ph7); 
    rightPositions = cat(2,rightPositions,  pwl7);
    bottomPositions = cat(2,bottomPositions, ph8);
end
% Box 19L
if amountOfItem4 >= 4;
    draw = cat(1,draw,item4t);
    leftPositions = cat(2,leftPositions,    pwl8);
    topPositions = cat(2,topPositions,       ph1); 
    rightPositions = cat(2,rightPositions,  pwl7);
    bottomPositions = cat(2,bottomPositions, ph2);
end
% Box 20L
if amountOfItem4 >= 5;
    draw = cat(1,draw,item4t);
    leftPositions = cat(2,leftPositions,    pwl8);
    topPositions = cat(2,topPositions,       ph9); 
    rightPositions = cat(2,rightPositions,  pwl7);
    bottomPositions = cat(2,bottomPositions, ph10);
end
    
   


% Box 1r    
if amountOfItem5 >= 1;
     draw = cat(1,draw,item5t);
     leftPositions = cat(2,leftPositions,    pwr1);
     topPositions = cat(2,topPositions,       ph5); 
     rightPositions = cat(2,rightPositions,  pwr2);
     bottomPositions = cat(2,bottomPositions, ph6);
 end
% Box 2r    
 if amountOfItem5 >= 2;
     draw = cat(1,draw,item5t);
     leftPositions = cat(2,leftPositions,    pwr1);
     topPositions = cat(2,topPositions,       ph3); 
     rightPositions = cat(2,rightPositions,  pwr2);
     bottomPositions = cat(2,bottomPositions, ph4);
 end
 % Box 3r    
 if amountOfItem5 >= 3;
     draw = cat(1,draw,item5t);
     leftPositions = cat(2,leftPositions,    pwr1);
     topPositions = cat(2,topPositions,       ph7); 
     rightPositions = cat(2,rightPositions,  pwr2);
     bottomPositions = cat(2,bottomPositions, ph8);
 end
 % Box 4r    
 if amountOfItem5 >= 4;
     draw = cat(1,draw,item5t);
     leftPositions = cat(2,leftPositions,    pwr1);
     topPositions = cat(2,topPositions,       ph1); 
     rightPositions = cat(2,rightPositions,  pwr2);
     bottomPositions = cat(2,bottomPositions, ph2);
 end
 % Box 5r    
 if amountOfItem5 >= 5;
     draw = cat(1,draw,item5t);
     leftPositions = cat(2,leftPositions,    pwr1);
     topPositions = cat(2,topPositions,       ph9); 
     rightPositions = cat(2,rightPositions,  pwr2);
     bottomPositions = cat(2,bottomPositions, ph10);
 end
 % Box 6r    
 if amountOfItem6 >= 1;
     draw = cat(1,draw,item6t);
     leftPositions = cat(2,leftPositions,    pwr3);
     topPositions = cat(2,topPositions,       ph5); 
     rightPositions = cat(2,rightPositions,  pwr4);
     bottomPositions = cat(2,bottomPositions, ph6);
 end
% % Box 7r    
 if amountOfItem6 >= 2;
     draw = cat(1,draw,item6t);
     leftPositions = cat(2,leftPositions,    pwr3);
     topPositions = cat(2,topPositions,       ph3); 
     rightPositions = cat(2,rightPositions,  pwr4);
     bottomPositions = cat(2,bottomPositions, ph4);
 end
 % Box 8r    
 if amountOfItem6 >= 3;
     draw = cat(1,draw,item6t);
     leftPositions = cat(2,leftPositions,    pwr3);
     topPositions = cat(2,topPositions,       ph7); 
     rightPositions = cat(2,rightPositions,  pwr4);
     bottomPositions = cat(2,bottomPositions, ph8);
 end
 % Box9r    
 if amountOfItem6 >= 4;
     draw = cat(1,draw,item6t);
     leftPositions = cat(2,leftPositions,    pwr3);
     topPositions = cat(2,topPositions,       ph1); 
     rightPositions = cat(2,rightPositions,  pwr4);
     bottomPositions = cat(2,bottomPositions, ph2);
 end
 % Box10r    
 if amountOfItem6 >= 5;
     draw = cat(1,draw,item6t);
     leftPositions = cat(2,leftPositions,    pwr3);
     topPositions = cat(2,topPositions,       ph9); 
     rightPositions = cat(2,rightPositions,  pwr4);
     bottomPositions = cat(2,bottomPositions, ph10);
 end

% Box 11r    
if amountOfItem7 >= 1;
     draw = cat(1,draw,item7t);
     leftPositions = cat(2,leftPositions,    pwr5);
     topPositions = cat(2,topPositions,       ph5); 
     rightPositions = cat(2,rightPositions,  pwr6);
     bottomPositions = cat(2,bottomPositions, ph6);
 end
% Box 12r    
 if amountOfItem7 >= 2;
     draw = cat(1,draw,item7t);
     leftPositions = cat(2,leftPositions,    pwr5);
     topPositions = cat(2,topPositions,       ph3); 
     rightPositions = cat(2,rightPositions,  pwr6);
     bottomPositions = cat(2,bottomPositions, ph4);
 end
 % Box 13r    
 if amountOfItem7 >= 3;
     draw = cat(1,draw,item7t);
     leftPositions = cat(2,leftPositions,    pwr5);
     topPositions = cat(2,topPositions,       ph7); 
     rightPositions = cat(2,rightPositions,  pwr6);
     bottomPositions = cat(2,bottomPositions, ph8);
 end
 % Box 14r    
 if amountOfItem7 >= 4;
     draw = cat(1,draw,item7t);
     leftPositions = cat(2,leftPositions,    pwr5);
     topPositions = cat(2,topPositions,       ph1); 
     rightPositions = cat(2,rightPositions,  pwr6);
     bottomPositions = cat(2,bottomPositions, ph2);
 end
 % Box 15r    
 if amountOfItem7 >= 5;
     draw = cat(1,draw,item7t);
     leftPositions = cat(2,leftPositions,    pwr5);
     topPositions = cat(2,topPositions,       ph9); 
     rightPositions = cat(2,rightPositions,  pwr6);
     bottomPositions = cat(2,bottomPositions, ph10);
 end
 % Box 16r    
 if amountOfItem8 >= 1;
     draw = cat(1,draw,item8t);
     leftPositions = cat(2,leftPositions,    pwr7);
     topPositions = cat(2,topPositions,       ph5); 
     rightPositions = cat(2,rightPositions,  pwr8);
     bottomPositions = cat(2,bottomPositions, ph6);
 end
% % Box 17r    
 if amountOfItem8 >= 2;
     draw = cat(1,draw,item8t);
     leftPositions = cat(2,leftPositions,    pwr7);
     topPositions = cat(2,topPositions,       ph3); 
     rightPositions = cat(2,rightPositions,  pwr8);
     bottomPositions = cat(2,bottomPositions, ph4);
 end
 % Box 18r    
 if amountOfItem8 >= 3;
     draw = cat(1,draw,item8t);
     leftPositions = cat(2,leftPositions,    pwr7);
     topPositions = cat(2,topPositions,       ph7); 
     rightPositions = cat(2,rightPositions,  pwr8);
     bottomPositions = cat(2,bottomPositions, ph8);
 end
 % Box19r    
 if amountOfItem8 >= 4;
     draw = cat(1,draw,item8t);
     leftPositions = cat(2,leftPositions,    pwr7);
     topPositions = cat(2,topPositions,       ph1); 
     rightPositions = cat(2,rightPositions,  pwr8);
     bottomPositions = cat(2,bottomPositions, ph2);
 end
 % Box20r    
 if amountOfItem8 >= 5;
     draw = cat(1,draw,item8t);
     leftPositions = cat(2,leftPositions,    pwr7);
     topPositions = cat(2,topPositions,       ph9); 
     rightPositions = cat(2,rightPositions,  pwr8);
     bottomPositions = cat(2,bottomPositions, ph10);
 end
 
 
%greys
% Left    
% Box 1L    
if amountOfItem1 <= 1;  %If there is supposed to be one or more item(s) on the left, Add all on the numbers that we need to add so that a image will be drawn in the 1 position
    draw = cat(1,draw,greyt);
    leftPositions = cat(2,leftPositions,    pwl2);
    topPositions = cat(2,topPositions,       ph5); 
    rightPositions = cat(2,rightPositions,  pwl1);
    bottomPositions = cat(2,bottomPositions, ph6);
end
% Box 2L    
if amountOfItem1 <= 2;
    draw = cat(1,draw,greyt);
    leftPositions = cat(2,leftPositions,    pwl2);
    topPositions = cat(2,topPositions,       ph3); 
    rightPositions = cat(2,rightPositions,  pwl1);
    bottomPositions = cat(2,bottomPositions, ph4);
end
% Box 3L
if amountOfItem1 <= 3;
    draw = cat(1,draw,greyt);
    leftPositions = cat(2,leftPositions,    pwl2);
    topPositions = cat(2,topPositions,       ph7); 
    rightPositions = cat(2,rightPositions,  pwl1);
    bottomPositions = cat(2,bottomPositions, ph8);
end
% Box 4L
if amountOfItem1 <= 4;
    draw = cat(1,draw,greyt);
    leftPositions = cat(2,leftPositions,    pwl2);
    topPositions = cat(2,topPositions,       ph1); 
    rightPositions = cat(2,rightPositions,  pwl1);
    bottomPositions = cat(2,bottomPositions, ph2);
end
% Box 5L
if amountOfItem1 <= 5;
    draw = cat(1,draw,greyt);
    leftPositions = cat(2,leftPositions,    pwl2);
    topPositions = cat(2,topPositions,       ph9); 
    rightPositions = cat(2,rightPositions,  pwl1);
    bottomPositions = cat(2,bottomPositions, ph10);
end

% Box 6L    
if amountOfItem2 <= 1;
    draw = cat(1,draw,greyt);
    leftPositions = cat(2,leftPositions,    pwl4);
    topPositions = cat(2,topPositions,       ph5); 
    rightPositions = cat(2,rightPositions,  pwl3);
    bottomPositions = cat(2,bottomPositions, ph6);
end
% Box 7L    
if amountOfItem2 <= 2;
    draw = cat(1,draw,greyt);
    leftPositions = cat(2,leftPositions,    pwl4);
    topPositions = cat(2,topPositions,       ph3); 
    rightPositions = cat(2,rightPositions,  pwl3);
    bottomPositions = cat(2,bottomPositions, ph4);
end
% Box 8L
if amountOfItem2 <= 3;
    draw = cat(1,draw,greyt);
    leftPositions = cat(2,leftPositions,    pwl4);
    topPositions = cat(2,topPositions,       ph7); 
    rightPositions = cat(2,rightPositions,  pwl3);
    bottomPositions = cat(2,bottomPositions, ph8);
end
% Box 9L
if amountOfItem2 <= 4;
    draw = cat(1,draw,greyt);
    leftPositions = cat(2,leftPositions,    pwl4);
    topPositions = cat(2,topPositions,       ph1); 
    rightPositions = cat(2,rightPositions,  pwl3);
    bottomPositions = cat(2,bottomPositions, ph2);
end
% Box 10L
if amountOfItem2 <= 5;
    draw = cat(1,draw,greyt);
    leftPositions = cat(2,leftPositions,    pwl4);
    topPositions = cat(2,topPositions,       ph9); 
    rightPositions = cat(2,rightPositions,  pwl3);
    bottomPositions = cat(2,bottomPositions, ph10);
end
   
% Box 11L    
if amountOfItem3 <= 1; 
    draw = cat(1,draw,greyt);
    leftPositions = cat(2,leftPositions,    pwl6);
    topPositions = cat(2,topPositions,       ph5); 
    rightPositions = cat(2,rightPositions,  pwl5);
    bottomPositions = cat(2,bottomPositions, ph6);
end
% Box 12L    
if amountOfItem3 <= 2;
    draw = cat(1,draw,greyt);
    leftPositions = cat(2,leftPositions,    pwl6);
    topPositions = cat(2,topPositions,       ph3); 
    rightPositions = cat(2,rightPositions,  pwl5);
    bottomPositions = cat(2,bottomPositions, ph4);
end
% Box 13L
if amountOfItem3 <= 3;
    draw = cat(1,draw,greyt);
    leftPositions = cat(2,leftPositions,    pwl6);
    topPositions = cat(2,topPositions,       ph7); 
    rightPositions = cat(2,rightPositions,  pwl5);
    bottomPositions = cat(2,bottomPositions, ph8);
end
% Box 14L
if amountOfItem3 <= 4;
    draw = cat(1,draw,greyt);
    leftPositions = cat(2,leftPositions,    pwl6);
    topPositions = cat(2,topPositions,       ph1); 
    rightPositions = cat(2,rightPositions,  pwl5);
    bottomPositions = cat(2,bottomPositions, ph2);
end
% Box 15L
if amountOfItem3 <= 5;
    draw = cat(1,draw,greyt);
    leftPositions = cat(2,leftPositions,    pwl6);
    topPositions = cat(2,topPositions,       ph9); 
    rightPositions = cat(2,rightPositions,  pwl5);
    bottomPositions = cat(2,bottomPositions, ph10);
end

% Box 16L    
if amountOfItem4 <= 1;
    draw = cat(1,draw,greyt);
    leftPositions = cat(2,leftPositions,    pwl8);
    topPositions = cat(2,topPositions,       ph5); 
    rightPositions = cat(2,rightPositions,  pwl7);
    bottomPositions = cat(2,bottomPositions, ph6);
end
% Box 17L    
if amountOfItem4 <= 2;
    draw = cat(1,draw,greyt);
    leftPositions = cat(2,leftPositions,    pwl8);
    topPositions = cat(2,topPositions,       ph3); 
    rightPositions = cat(2,rightPositions,  pwl7);
    bottomPositions = cat(2,bottomPositions, ph4);
end
% Box 18L
if amountOfItem4 <= 3;
    draw = cat(1,draw,greyt);
    leftPositions = cat(2,leftPositions,    pwl8);
    topPositions = cat(2,topPositions,       ph7); 
    rightPositions = cat(2,rightPositions,  pwl7);
    bottomPositions = cat(2,bottomPositions, ph8);
end
% Box 19L
if amountOfItem4 <= 4;
    draw = cat(1,draw,greyt);
    leftPositions = cat(2,leftPositions,    pwl8);
    topPositions = cat(2,topPositions,       ph1); 
    rightPositions = cat(2,rightPositions,  pwl7);
    bottomPositions = cat(2,bottomPositions, ph2);
end
% Box 20L
if amountOfItem4 <= 5;
    draw = cat(1,draw,greyt);
    leftPositions = cat(2,leftPositions,    pwl8);
    topPositions = cat(2,topPositions,       ph9); 
    rightPositions = cat(2,rightPositions,  pwl7);
    bottomPositions = cat(2,bottomPositions, ph10);
end
    
   


% Box 1r    
if amountOfItem5 <= 1;
     draw = cat(1,draw,greyt);
     leftPositions = cat(2,leftPositions,    pwr1);
     topPositions = cat(2,topPositions,       ph5); 
     rightPositions = cat(2,rightPositions,  pwr2);
     bottomPositions = cat(2,bottomPositions, ph6);
 end
% Box 2r    
 if amountOfItem5 <= 2;
     draw = cat(1,draw,greyt);
     leftPositions = cat(2,leftPositions,    pwr1);
     topPositions = cat(2,topPositions,       ph3); 
     rightPositions = cat(2,rightPositions,  pwr2);
     bottomPositions = cat(2,bottomPositions, ph4);
 end
 % Box 3r    
 if amountOfItem5 <= 3;
     draw = cat(1,draw,greyt);
     leftPositions = cat(2,leftPositions,    pwr1);
     topPositions = cat(2,topPositions,       ph7); 
     rightPositions = cat(2,rightPositions,  pwr2);
     bottomPositions = cat(2,bottomPositions, ph8);
 end
 % Box 4r    
 if amountOfItem5 <= 4;
     draw = cat(1,draw,greyt);
     leftPositions = cat(2,leftPositions,    pwr1);
     topPositions = cat(2,topPositions,       ph1); 
     rightPositions = cat(2,rightPositions,  pwr2);
     bottomPositions = cat(2,bottomPositions, ph2);
 end
 % Box 5r    
 if amountOfItem5 <= 5;
     draw = cat(1,draw,greyt);
     leftPositions = cat(2,leftPositions,    pwr1);
     topPositions = cat(2,topPositions,       ph9); 
     rightPositions = cat(2,rightPositions,  pwr2);
     bottomPositions = cat(2,bottomPositions, ph10);
 end
 % Box 6r    
 if amountOfItem6 <= 1;
     draw = cat(1,draw,greyt);
     leftPositions = cat(2,leftPositions,    pwr3);
     topPositions = cat(2,topPositions,       ph5); 
     rightPositions = cat(2,rightPositions,  pwr4);
     bottomPositions = cat(2,bottomPositions, ph6);
 end
% % Box 7r    
 if amountOfItem6 <= 2;
     draw = cat(1,draw,greyt);
     leftPositions = cat(2,leftPositions,    pwr3);
     topPositions = cat(2,topPositions,       ph3); 
     rightPositions = cat(2,rightPositions,  pwr4);
     bottomPositions = cat(2,bottomPositions, ph4);
 end
 % Box 8r    
 if amountOfItem6 <= 3;
     draw = cat(1,draw,greyt);
     leftPositions = cat(2,leftPositions,    pwr3);
     topPositions = cat(2,topPositions,       ph7); 
     rightPositions = cat(2,rightPositions,  pwr4);
     bottomPositions = cat(2,bottomPositions, ph8);
 end
 % Box9r    
 if amountOfItem6 <= 4;
     draw = cat(1,draw,greyt);
     leftPositions = cat(2,leftPositions,    pwr3);
     topPositions = cat(2,topPositions,       ph1); 
     rightPositions = cat(2,rightPositions,  pwr4);
     bottomPositions = cat(2,bottomPositions, ph2);
 end
 % Box10r    
 if amountOfItem6 <= 5;
     draw = cat(1,draw,greyt);
     leftPositions = cat(2,leftPositions,    pwr3);
     topPositions = cat(2,topPositions,       ph9); 
     rightPositions = cat(2,rightPositions,  pwr4);
     bottomPositions = cat(2,bottomPositions, ph10);
 end

% Box 11r    
if amountOfItem7 <= 1;
     draw = cat(1,draw,greyt);
     leftPositions = cat(2,leftPositions,    pwr5);
     topPositions = cat(2,topPositions,       ph5); 
     rightPositions = cat(2,rightPositions,  pwr6);
     bottomPositions = cat(2,bottomPositions, ph6);
 end
% Box 12r    
 if amountOfItem7 <= 2;
     draw = cat(1,draw,greyt);
     leftPositions = cat(2,leftPositions,    pwr5);
     topPositions = cat(2,topPositions,       ph3); 
     rightPositions = cat(2,rightPositions,  pwr6);
     bottomPositions = cat(2,bottomPositions, ph4);
 end
 % Box 13r    
 if amountOfItem7 <= 3;
     draw = cat(1,draw,greyt);
     leftPositions = cat(2,leftPositions,    pwr5);
     topPositions = cat(2,topPositions,       ph7); 
     rightPositions = cat(2,rightPositions,  pwr6);
     bottomPositions = cat(2,bottomPositions, ph8);
 end
 % Box 14r    
 if amountOfItem7 <= 4;
     draw = cat(1,draw,greyt);
     leftPositions = cat(2,leftPositions,    pwr5);
     topPositions = cat(2,topPositions,       ph1); 
     rightPositions = cat(2,rightPositions,  pwr6);
     bottomPositions = cat(2,bottomPositions, ph2);
 end
 % Box 15r    
 if amountOfItem7 <= 5;
     draw = cat(1,draw,greyt);
     leftPositions = cat(2,leftPositions,    pwr5);
     topPositions = cat(2,topPositions,       ph9); 
     rightPositions = cat(2,rightPositions,  pwr6);
     bottomPositions = cat(2,bottomPositions, ph10);
 end
 % Box 16r    
 if amountOfItem8 <= 1;
     draw = cat(1,draw,greyt);
     leftPositions = cat(2,leftPositions,    pwr7);
     topPositions = cat(2,topPositions,       ph5); 
     rightPositions = cat(2,rightPositions,  pwr8);
     bottomPositions = cat(2,bottomPositions, ph6);
 end
% % Box 17r    
 if amountOfItem8 <= 2;
     draw = cat(1,draw,greyt);
     leftPositions = cat(2,leftPositions,    pwr7);
     topPositions = cat(2,topPositions,       ph3); 
     rightPositions = cat(2,rightPositions,  pwr8);
     bottomPositions = cat(2,bottomPositions, ph4);
 end
 % Box 18r    
 if amountOfItem8 <= 3;
     draw = cat(1,draw,greyt);
     leftPositions = cat(2,leftPositions,    pwr7);
     topPositions = cat(2,topPositions,       ph7); 
     rightPositions = cat(2,rightPositions,  pwr8);
     bottomPositions = cat(2,bottomPositions, ph8);
 end
 % Box19r    
 if amountOfItem8 <= 4;
     draw = cat(1,draw,greyt);
     leftPositions = cat(2,leftPositions,    pwr7);
     topPositions = cat(2,topPositions,       ph1); 
     rightPositions = cat(2,rightPositions,  pwr8);
     bottomPositions = cat(2,bottomPositions, ph2);
 end
 % Box20r    
 if amountOfItem8 <= 5;
     draw = cat(1,draw,greyt);
     leftPositions = cat(2,leftPositions,    pwr7);
     topPositions = cat(2,topPositions,       ph9); 
     rightPositions = cat(2,rightPositions,  pwr8);
     bottomPositions = cat(2,bottomPositions, ph10);
 end
v = cat(1,leftPositions,topPositions,rightPositions,bottomPositions);

    Screen('DrawTextures',w,draw,[],v)
     Screen('Flip',w);
     KbWait
     Screen('CloseAll');

end
