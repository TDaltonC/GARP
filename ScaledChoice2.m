function [ output_args ] = ScaledChoice(item1,item2,itemsOnLeft,itemsOnRight)
%Scaled choice with more than one type of good 
    screenNumber = max(Screen('Screens'));
    [width height] = Screen('WindowSize', screenNumber);
    w = Screen(screenNumber, 'OpenWindow',[],[],[],[]);   
    
    %% If input srguments are not provided, these gives the defauls values
    
    if exist('item1','var') == 0;
        item1 = imread('juice.jpg');
    end
    if exist('item2','var') == 0;
        item2 = imread('chips.jpg');
    end
    
    item1t = Screen('MakeTexture',w,item1); 
    item2t = Screen('MakeTexture',w,item2);
    
    %% 
        % Again these are the default values is nothing is added via the
        % function
    if exist('itemsOnLeft','var') == 0; % If 'itemitemsOnLeft' doesn't exist  . . . 
        itemsOnLeft = 3;                % Create it and set it equal to 3 (default)
    end
    if exist('itemsOnRight','var') == 0;% If 'itemitemsOnLeft' doesn't exist  . . . 
        itemsOnRight = 3;               % Create it and set it equal to 3 (default)
    end
    
    
    %Added these so that we could stick with your original nomenclature
    A = itemsOnLeft;
    B = itemsOnRight;
    
    %% These are all of the position constants
    
    pw1=width/10;
    pw2=2*width/10;
    pw3=3*width/10;
    pw4=4*width/10;
    pw5=5*width/10;
    pw6=6*width/10;
    pw7=7*width/10;
    pw8=8*width/10;
    pw9=9*width/10;
    ph1=height/7;
    ph2=2*height/7;
    ph3=3*height/7;
    ph4=4*height/7;
    ph5=5*height/7;
    ph6=6*height/7;
    
    draw = [];
    leftPositions = [];
    topPositions = [];
    rightPositions = [];
    bottomPositions = [];
    
    %%
    
if A >= 1;  %If there is suposed to be one or more item(s) on the left, Add all on the numbers that we need to add so that a image will be drawn in the 1 position
    draw = cat(1,draw,item1t);
    leftPositions = cat(2,leftPositions, pw1);
    topPositions = cat(2,topPositions, ph3); 
    rightPositions = cat(2,rightPositions, pw2);
    bottomPositions = cat(2,bottomPositions, ph4);
end
    
if A >= 2;
    draw = cat(1,draw,item1t);
    leftPositions = cat(2,leftPositions, pw3);
    topPositions = cat(2,topPositions, ph3); 
    rightPositions = cat(2,rightPositions, pw4);
    bottomPositions = cat(2,bottomPositions, ph4);
end
    
if A >= 3;
    draw = cat(1,draw,item1t);
    leftPositions = cat(2,leftPositions, pw1);
    topPositions = cat(2,topPositions, ph1); 
    rightPositions = cat(2,rightPositions, pw2);
    bottomPositions = cat(2,bottomPositions, ph2);
end
  



 % AND SO ON . . . . . 




%     if 
%     for A=[2 3 4 5 6];
%         for B=[2 3 4 5 6];
%             if A(2) && B(2)
%                 draw = [item1t;item1t;item2t;item2t];
%                 v = [pw1 pw3 pw6 pw8; ph3 ph3 ph3 ph3; pw2 pw4 pw7 pw9; ph4 ph4 ph4 ph4];
%             elseif A(2) && B(3) 
%                 draw = [item1t;item1t;item2t;item2t;item2t];
%                 v = [pw1 pw3 pw6 pw8 pw6; ph3 ph3 ph3 ph3 ph1; pw2 pw4 pw7 pw9 pw7; ph4 ph4 ph4 ph4 ph2];
%             elseif A(2) && B(4) 
%                 draw = [item1t;item1t;item2t;item2t;item2t;item2t];
%                 v = [pw1 pw3 pw6 pw8 pw6 pw8; ph3 ph3 ph3 ph3 ph1 ph1; pw2 pw4 pw7 pw9 pw7 pw9; ph4 ph4 ph4 ph4 ph2 ph2];
%             elseif A(2) && B(5) 
%                 draw = [item1t;item1t;item2t;item2t;item2t;item2t;item2t];
%                 v = [pw1 pw3 pw6 pw8 pw6 pw8 pw6; ph3 ph3 ph3 ph3 ph1 ph1 ph5; pw2 pw4 pw7 pw9 pw7 pw9 pw7; ph4 ph4 ph4 ph4 ph2 ph2 ph6];
%             elseif A(2) && B(6) 
%                 draw = [item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t];
%                 v = [pw1 pw3 pw6 pw8 pw6 pw8 pw6 pw8; ph3 ph3 ph3 ph3 ph1 ph1 ph5 ph5; pw2 pw4 pw7 pw9 pw7 pw9 pw7 pw9; ph4 ph4 ph4 ph4 ph2 ph2 ph6 ph6];
%             elseif A(3) && B(2) 
%                 draw = [item1t;item1t;item1t;item2t;item2t];
%                 v = [pw1 pw3 pw1 pw6 pw8; ph3 ph3 ph1 ph3 ph3; pw2 pw4 pw2 pw7 pw9; ph4 ph4 ph2 ph4 ph4];
%             elseif A(3) && B(3)
%                 draw = [item1t;item1t;item1t;item2t;item2t;item2t];
%                 v = [pw1 pw3 pw1 pw6 pw8 pw6; ph3 ph3 ph1 ph3 ph3 ph1; pw2 pw4 pw2 pw7 pw9 pw7; ph4 ph4 ph2 ph4 ph4 ph2];
%             elseif A(3) && B(4) 
%                 draw = [item1t;item1t;item1t;item2t;item2t;item2t;item2t];
%                 v = [pw1 pw3 pw1 pw6 pw8 pw6 pw8; ph3 ph3 ph1 ph3 ph3 ph1 ph1; pw2 pw4 pw2 pw7 pw9 pw7 pw9; ph4 ph4 ph2 ph4 ph4 ph2 ph2];
%             elseif A(3) && B(5) 
%                 draw = [item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t];
%                 v = [pw1 pw3 pw1 pw6 pw8 pw6 pw8 pw6; ph3 ph3 ph1 ph3 ph3 ph1 ph1 ph5; pw2 pw4 pw2 pw7 pw9 pw7 pw9 pw7; ph4 ph4 ph2 ph4 ph4 ph2 ph2 ph6];
%             elseif A(3) && B(6)
%                 draw = [item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t];
%                 v = [pw1 pw3 pw1 pw6 pw8 pw6 pw8 pw6 pw8; ph3 ph3 ph1 ph3 ph3 ph1 ph1 ph5 ph5; pw2 pw4 pw2 pw7 pw9 pw7 pw9 pw7 pw9; ph4 ph4 ph2 ph4 ph4 ph2 ph2 ph6 ph6];
%             elseif A(4) && B(2)
%                 draw = [item1t;item1t;item1t;item1t;item2t;item2t];
%                 v = [pw1 pw3 pw1 pw3 pw6 pw8; ph3 ph3 ph1 ph1 ph3 ph3; pw2 pw4 pw2 pw4 pw7 pw9; ph4 ph4 ph2 ph2 ph4 ph4];
%             elseif A(4) && B(3)
%                 draw = [item1t;item1t;item1t;item1t;item2t;item2t;item2t];
%                 v = [pw1 pw3 pw1 pw3 pw6 pw8 pw6; ph3 ph3 ph1 ph1 ph3 ph3 ph1; pw2 pw4 pw2 pw4 pw7 pw9 pw7; ph4 ph4 ph2 ph2 ph4 ph4 ph2];
%             elseif A(4) && B(4)
%                 draw = [item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t];
%                 v = [pw1 pw3 pw1 pw3 pw6 pw8 pw6 pw8; ph3 ph3 ph1 ph1 ph3 ph3 ph1 ph1; pw2 pw4 pw2 pw4 pw7 pw9 pw7 pw9; ph4 ph4 ph2 ph2 ph4 ph4 ph2 ph2];
%             elseif A(4) && B(5)
%                 draw = [item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t];
%                 v = [pw1 pw3 pw1 pw3 pw6 pw8 pw6 pw8 pw6; ph3 ph3 ph1 ph1 ph3 ph3 ph1 ph1 ph5; pw2 pw4 pw2 pw4 pw7 pw9 pw7 pw9 pw7; ph4 ph4 ph2 ph2 ph4 ph4 ph2 ph2 ph6];
%             elseif A(4) && B(6)
%                 draw = [item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t];
%                 v = [pw1 pw3 pw1 pw3 pw6 pw8 pw6 pw8 pw6 pw8; ph3 ph3 ph1 ph1 ph3 ph3 ph1 ph1 ph5 ph5; pw2 pw4 pw2 pw4 pw7 pw9 pw7 pw9 pw7 pw9; ph4 ph4 ph2 ph2 ph4 ph4 ph2 ph2 ph6 ph6];
%             elseif A(5) && B(2)
%                 draw = [item1t;item1t;item1t;item1t;item1t;item2t;item2t];
%                 v = [pw1 pw3 pw1 pw3 pw1 pw6 pw8; ph3 ph3 ph1 ph1 ph5 ph3 ph3; pw2 pw4 pw2 pw4 pw2 pw7 pw9; ph4 ph4 ph2 ph2 ph6 ph4 ph4];
%             elseif A(5) && B(3)
%                 draw = [item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t];
%                 v = [pw1 pw3 pw1 pw3 pw1 pw6 pw8 pw6; ph3 ph3 ph1 ph1 ph5 ph3 ph3 ph1; pw2 pw4 pw2 pw4 pw2 pw7 pw9 pw7; ph4 ph4 ph2 ph2 ph6 ph4 ph4 ph2];
%             elseif A(5) && B(4)
%                 draw = [item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t];
%                 v = [pw1 pw3 pw1 pw3 pw1 pw6 pw8 pw6 pw8; ph3 ph3 ph1 ph1 ph5 ph3 ph3 ph1 ph1; pw2 pw4 pw2 pw4 pw2 pw7 pw9 pw7 pw9; ph4 ph4 ph2 ph2 ph6 ph4 ph4 ph2 ph2];
%             elseif A(5) && B(5)
%                 draw = [item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t];
%                 v = [pw1 pw3 pw1 pw3 pw1 pw6 pw8 pw6 pw8 pw6; ph3 ph3 ph1 ph1 ph5 ph3 ph3 ph1 ph1 ph5; pw2 pw4 pw2 pw4 pw2 pw7 pw9 pw7 pw9 pw7; ph4 ph4 ph2 ph2 ph6 ph4 ph4 ph2 ph2 ph6];
%             elseif A(5) && B(6)
%                 draw = [item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t];
%                 v = [pw1 pw3 pw1 pw3 pw1 pw6 pw8 pw6 pw8 pw6 pw8; ph3 ph3 ph1 ph1 ph5 ph3 ph3 ph1 ph1 ph5 ph5; pw2 pw4 pw2 pw4 pw2 pw7 pw9 pw7 pw9 pw7 pw9; ph4 ph4 ph2 ph2 ph6 ph4 ph4 ph2 ph2 ph6 ph6];
%             elseif A(6) && B(2)
%                 draw = [item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t];
%                 v = [pw1 pw3 pw1 pw3 pw1 pw3 pw6 pw8; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3; pw2 pw4 pw2 pw4 pw2 pw4 pw7 pw9; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4];
%             elseif A(6) && B(3)
%                 draw = [item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t];
%                 v = [pw1 pw3 pw1 pw3 pw1 pw3 pw6 pw8 pw6; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1; pw2 pw4 pw2 pw4 pw2 pw4 pw7 pw9 pw7; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2];
%             elseif A(6) && B(4) 
%                 draw = [item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t];
%                 v = [pw1 pw3 pw1 pw3 pw1 pw3 pw6 pw8 pw6 pw8; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1; pw2 pw4 pw2 pw4 pw2 pw4 pw7 pw9 pw7 pw9; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2];
%             elseif A(6) && B(5)
%                 draw = [item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t];
%                 v = [pw1 pw3 pw1 pw3 pw1 pw3 pw6 pw8 pw6 pw8 pw6; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5; pw2 pw4 pw2 pw4 pw2 pw4 pw7 pw9 pw7 pw9 pw7; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6];
%             elseif A(6) && B(6)
%                 draw = [item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t];
%                 v = [pw1 pw3 pw1 pw3 pw1 pw3 pw6 pw8 pw6 pw8 pw6 pw8; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5 ph5; pw2 pw4 pw2 pw4 pw2 pw4 pw7 pw9 pw7 pw9 pw7 pw9; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6 ph6];
%             end
%         end
%     end

v = cat(1,leftPositions,topPositions,rightPositions,bottomPositions);

    Screen('DrawTextures',w,draw,[],v)
    Screen('Flip',w);
    KbWait
    Screen('CloseAll');
end
