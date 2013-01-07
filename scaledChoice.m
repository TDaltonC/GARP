function [ output_args ] = scaledChoice2(item1,item2,A,B,w)
%Scaled choice with more than one type of good 
    screenNumber = max(Screen('Screens'));
    [width height] = Screen('WindowSize', screenNumber);    
    
    if exist('item1','var') == 0;
        item1 = imread('juice.jpg');
    end
    if exist('item2','var') == 0;
        item2 = imread('chips.jpg');
    end
    
    item1t = Screen('MakeTexture',w,item1); 
    item2t = Screen('MakeTexture',w,item2);
    pw1=width/10;
    pw2=2*width/10;
    pw3=3*width/10;
    pw4=4*width/10;
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
    if A==2 && B==2
        draw = [item1t;item1t;item2t;item2t];
        v = [pw1 pw3 pw6 pw8; ph3 ph3 ph3 ph3; pw2 pw4 pw7 pw9; ph4 ph4 ph4 ph4];
    elseif A==2 && B==3 
        draw = [item1t;item1t;item2t;item2t;item2t];
        v = [pw1 pw3 pw6 pw8 pw6; ph3 ph3 ph3 ph3 ph1; pw2 pw4 pw7 pw9 pw7; ph4 ph4 ph4 ph4 ph2];
    elseif A==2 && B==4 
        draw = [item1t;item1t;item2t;item2t;item2t;item2t];
        v = [pw1 pw3 pw6 pw8 pw6 pw8; ph3 ph3 ph3 ph3 ph1 ph1; pw2 pw4 pw7 pw9 pw7 pw9; ph4 ph4 ph4 ph4 ph2 ph2];
    elseif A==2 && B==5 
        draw = [item1t;item1t;item2t;item2t;item2t;item2t;item2t];
        v = [pw1 pw3 pw6 pw8 pw6 pw8 pw6; ph3 ph3 ph3 ph3 ph1 ph1 ph5; pw2 pw4 pw7 pw9 pw7 pw9 pw7; ph4 ph4 ph4 ph4 ph2 ph2 ph6];
    elseif A==2 && B==6 
        draw = [item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t];
        v = [pw1 pw3 pw6 pw8 pw6 pw8 pw6 pw8; ph3 ph3 ph3 ph3 ph1 ph1 ph5 ph5; pw2 pw4 pw7 pw9 pw7 pw9 pw7 pw9; ph4 ph4 ph4 ph4 ph2 ph2 ph6 ph6];
    elseif A==3 && B==2 
        draw = [item1t;item1t;item1t;item2t;item2t];
        v = [pw1 pw3 pw1 pw6 pw8; ph3 ph3 ph1 ph3 ph3; pw2 pw4 pw2 pw7 pw9; ph4 ph4 ph2 ph4 ph4];
    elseif A==3 && B==3
        draw = [item1t;item1t;item1t;item2t;item2t;item2t];
        v = [pw1 pw3 pw1 pw6 pw8 pw6; ph3 ph3 ph1 ph3 ph3 ph1; pw2 pw4 pw2 pw7 pw9 pw7; ph4 ph4 ph2 ph4 ph4 ph2];
    elseif A==3 && B==4 
        draw = [item1t;item1t;item1t;item2t;item2t;item2t;item2t];
        v = [pw1 pw3 pw1 pw6 pw8 pw6 pw8; ph3 ph3 ph1 ph3 ph3 ph1 ph1; pw2 pw4 pw2 pw7 pw9 pw7 pw9; ph4 ph4 ph2 ph4 ph4 ph2 ph2];
    elseif A==3 && B==5 
        draw = [item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t];
        v = [pw1 pw3 pw1 pw6 pw8 pw6 pw8 pw6; ph3 ph3 ph1 ph3 ph3 ph1 ph1 ph5; pw2 pw4 pw2 pw7 pw9 pw7 pw9 pw7; ph4 ph4 ph2 ph4 ph4 ph2 ph2 ph6];
    elseif A==3 && B==6
        draw = [item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t];
        v = [pw1 pw3 pw1 pw6 pw8 pw6 pw8 pw6 pw8; ph3 ph3 ph1 ph3 ph3 ph1 ph1 ph5 ph5; pw2 pw4 pw2 pw7 pw9 pw7 pw9 pw7 pw9; ph4 ph4 ph2 ph4 ph4 ph2 ph2 ph6 ph6];
    elseif A==4 && B==2
        draw = [item1t;item1t;item1t;item1t;item2t;item2t];
        v = [pw1 pw3 pw1 pw3 pw6 pw8; ph3 ph3 ph1 ph1 ph3 ph3; pw2 pw4 pw2 pw4 pw7 pw9; ph4 ph4 ph2 ph2 ph4 ph4];
    elseif A==4 && B==3
        draw = [item1t;item1t;item1t;item1t;item2t;item2t;item2t];
        v = [pw1 pw3 pw1 pw3 pw6 pw8 pw6; ph3 ph3 ph1 ph1 ph3 ph3 ph1; pw2 pw4 pw2 pw4 pw7 pw9 pw7; ph4 ph4 ph2 ph2 ph4 ph4 ph2];
    elseif A==4 && B==4
        draw = [item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t];
        v = [pw1 pw3 pw1 pw3 pw6 pw8 pw6 pw8; ph3 ph3 ph1 ph1 ph3 ph3 ph1 ph1; pw2 pw4 pw2 pw4 pw7 pw9 pw7 pw9; ph4 ph4 ph2 ph2 ph4 ph4 ph2 ph2];
    elseif A==4 && B==5
        draw = [item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t];
        v = [pw1 pw3 pw1 pw3 pw6 pw8 pw6 pw8 pw6; ph3 ph3 ph1 ph1 ph3 ph3 ph1 ph1 ph5; pw2 pw4 pw2 pw4 pw7 pw9 pw7 pw9 pw7; ph4 ph4 ph2 ph2 ph4 ph4 ph2 ph2 ph6];
    elseif A==4 && B==6
        draw = [item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t];
        v = [pw1 pw3 pw1 pw3 pw6 pw8 pw6 pw8 pw6 pw8; ph3 ph3 ph1 ph1 ph3 ph3 ph1 ph1 ph5 ph5; pw2 pw4 pw2 pw4 pw7 pw9 pw7 pw9 pw7 pw9; ph4 ph4 ph2 ph2 ph4 ph4 ph2 ph2 ph6 ph6];
    elseif A==5 && B==2
        draw = [item1t;item1t;item1t;item1t;item1t;item2t;item2t];
        v = [pw1 pw3 pw1 pw3 pw1 pw6 pw8; ph3 ph3 ph1 ph1 ph5 ph3 ph3; pw2 pw4 pw2 pw4 pw2 pw7 pw9; ph4 ph4 ph2 ph2 ph6 ph4 ph4];
    elseif A==5 && B==3
        draw = [item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t];
        v = [pw1 pw3 pw1 pw3 pw1 pw6 pw8 pw6; ph3 ph3 ph1 ph1 ph5 ph3 ph3 ph1; pw2 pw4 pw2 pw4 pw2 pw7 pw9 pw7; ph4 ph4 ph2 ph2 ph6 ph4 ph4 ph2];
    elseif A==5 && B==4
        draw = [item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t];
        v = [pw1 pw3 pw1 pw3 pw1 pw6 pw8 pw6 pw8; ph3 ph3 ph1 ph1 ph5 ph3 ph3 ph1 ph1; pw2 pw4 pw2 pw4 pw2 pw7 pw9 pw7 pw9; ph4 ph4 ph2 ph2 ph6 ph4 ph4 ph2 ph2];
    elseif A==5 && B==5
        draw = [item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t];
        v = [pw1 pw3 pw1 pw3 pw1 pw6 pw8 pw6 pw8 pw6; ph3 ph3 ph1 ph1 ph5 ph3 ph3 ph1 ph1 ph5; pw2 pw4 pw2 pw4 pw2 pw7 pw9 pw7 pw9 pw7; ph4 ph4 ph2 ph2 ph6 ph4 ph4 ph2 ph2 ph6];
    elseif A==5 && B==6
        draw = [item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t];
        v = [pw1 pw3 pw1 pw3 pw1 pw6 pw8 pw6 pw8 pw6 pw8; ph3 ph3 ph1 ph1 ph5 ph3 ph3 ph1 ph1 ph5 ph5; pw2 pw4 pw2 pw4 pw2 pw7 pw9 pw7 pw9 pw7 pw9; ph4 ph4 ph2 ph2 ph6 ph4 ph4 ph2 ph2 ph6 ph6];
    elseif A==6 && B==2
        draw = [item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t];
        v = [pw1 pw3 pw1 pw3 pw1 pw3 pw6 pw8; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3; pw2 pw4 pw2 pw4 pw2 pw4 pw7 pw9; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4];
    elseif A==6 && B==3
        draw = [item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t];
        v = [pw1 pw3 pw1 pw3 pw1 pw3 pw6 pw8 pw6; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1; pw2 pw4 pw2 pw4 pw2 pw4 pw7 pw9 pw7; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2];
    elseif A==6 && B==4 
        draw = [item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t];
        v = [pw1 pw3 pw1 pw3 pw1 pw3 pw6 pw8 pw6 pw8; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1; pw2 pw4 pw2 pw4 pw2 pw4 pw7 pw9 pw7 pw9; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2];
    elseif A==6 && B==5
        draw = [item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t];
        v = [pw1 pw3 pw1 pw3 pw1 pw3 pw6 pw8 pw6 pw8 pw6; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5; pw2 pw4 pw2 pw4 pw2 pw4 pw7 pw9 pw7 pw9 pw7; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6];
    elseif A==6 && B==6
        draw = [item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t];
        v = [pw1 pw3 pw1 pw3 pw1 pw3 pw6 pw8 pw6 pw8 pw6 pw8; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5 ph5; pw2 pw4 pw2 pw4 pw2 pw4 pw7 pw9 pw7 pw9 pw7 pw9; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6 ph6];
    end
    Screen('DrawTextures',w,draw,[],v)
    %Screen('Flip',w);
end

