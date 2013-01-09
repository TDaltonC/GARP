function [output_args] = SingleGARPChoiceRight(item1,item2,firstitemOnRight,seconditemOnRight)
%This function is for the single GARP choice task with two goods on each
%side of the screen. The maximum number of goods per side is 12.
    screenNumber = max(Screen('Screens'));
    [width height] = Screen('WindowSize', screenNumber);
    w = Screen(screenNumber, 'OpenWindow',[],[],[],[]);   
    
    %% If input arguments are not provided, these gives the default values
    
    if exist('item1','var') == 0;
        item1 = imread('juice.jpg');
    end
    if exist('item2','var') == 0;
        item2 = imread('chips.jpg');
    end
    
    item1t = Screen('MakeTexture',w,item1); 
    item2t = Screen('MakeTexture',w,item2);
  
    %% Again these are the default values if nothing is added via the function

    if exist('firstitemOnRight','var') == 0;% If 'itemitemsOnLeft' doesn't exist  . . . 
        firstitemOnRight = 5;               % Create it and set it equal to 3 (default)
    end
    
    if exist('seconditemOnRight','var') == 0;
        seconditemOnRight = 5;
    end
    
    D = firstitemOnRight;
    F = seconditemOnRight;
    
    
    %% These are all of the position constants
    pw1=width/18;
    pw2=2*width/18;
    pw3=3*width/18;
    pw4=4*width/18;
    pw5=5*width/18;
    pw6=6*width/18;
    pw7=7*width/18;
    pw8=8*width/18;
    pw9=9*width/18;
    pw10=10*width/18;
    pw11=11*width/18;
    pw12=12*width/18;
    pw13=13*width/18;
    pw14=14*width/18;
    pw15=15*width/18;
    pw16=16*width/18;
    pw17=17*width/18;
    pw18=18*width/18;
    ph1=height/7;
    ph2=2*height/7;
    ph3=3*height/7;
    ph4=4*height/7;
    ph5=5*height/7;
    ph6=6*height/7;
    ph7=7*height/7;
    
    
    
%**RIGHT** side
    if D==0 && F==2
        draw=[item2t;item2t];
        v=[pw10 pw12; ph3 ph3; pw11 pw13; ph4 ph4];
    
    elseif D==0 && F==3 
        draw=[item2t;item2t;item2t];
        v=[pw10 pw12 pw10; ph3 ph3 ph1; pw11 pw13 pw11; ph4 ph4 ph2];
    
    elseif D==0 && F==4 
        draw=[item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12; ph3 ph3 ph1 ph1; pw11 pw13 pw11 pw13; ph4 ph4 ph2 ph2];
    
    elseif D==0 && F==5 
        draw=[item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10; ph3 ph3 ph1 ph1 ph5; pw11 pw13 pw11 pw13 pw11; ph4 ph4 ph2 ph2 ph6];
    
    elseif D==0 && F==6
        draw=[item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12; ph3 ph3 ph1 ph1 ph5 ph5; pw11 pw13 pw11 pw13 pw11 pw13; ph4 ph4 ph2 ph2 ph6 ph6];
    
    elseif D==0 && F==7 
        draw=[item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3; pw11 pw13 pw11 pw13 pw11 pw13 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4];
    
    elseif D==0 && F==8
        draw=[item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4];
    
    elseif D==0 && F==9
        draw=[item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2];
    
    elseif D==0 && F==10
        draw=[item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14 pw16; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15 pw17; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2];
    
    elseif D==0 && F==11
        draw=[item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14 pw16 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15 pw17 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6];
    
    elseif D==1 && F==2
        draw=[item1t;item2t;item2t];
        v=[pw10 pw12 pw10; ph3 ph3 ph1; pw11 pw13 pw11; ph4 ph4 ph2];
    
    elseif D==1 && F==3
        draw=[item1t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12; ph3 ph3 ph1 ph1; pw11 pw13 pw11 pw13; ph4 ph4 ph2 ph2];
    
    elseif D==1 && F==4
        draw=[item1t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10; ph3 ph3 ph1 ph1 ph5; pw11 pw13 pw11 pw13 pw11; ph4 ph4 ph2 ph2 ph6];
    
    elseif D==1 && F==5
        draw=[item1t;item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12; ph3 ph3 ph1 ph1 ph5 ph5; pw11 pw13 pw11 pw13 pw11 pw13; ph4 ph4 ph2 ph2 ph6 ph6];
    
    elseif D==1 && F==6
        draw=[item1t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3; pw11 pw13 pw11 pw13 pw11 pw13 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4];
    
    elseif D==1 && F==7
        draw=[item1t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4];
    
    elseif D==1 && F==8
        draw=[item1t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2];
    
    elseif D==1 && F==9
        draw=[item1t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14 pw16; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15 pw17; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2];
    
    elseif D==1 && F==10
        draw=[item1t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14 pw16 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15 pw17 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6];
    
    elseif D==2 && F==0
        draw=[item1t;item1t];
        v=[pw10 pw12; ph3 ph3; pw11 pw13; ph4 ph4];
        
    elseif D==2 && F==1
        draw=[item1t;item1t;item2t];
        v=[pw10 pw12 pw10; ph3 ph3 ph1; pw11 pw13 pw11; ph4 ph4 ph2];
    
    elseif D==2 && F==2
        draw=[item1t;item1t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12; ph3 ph3 ph1 ph1; pw11 pw13 pw11 pw13; ph4 ph4 ph2 ph2];
    
    elseif D==2 && F==3
        draw=[item1t;item1t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10; ph3 ph3 ph1 ph1 ph5; pw11 pw13 pw11 pw13 pw11; ph4 ph4 ph2 ph2 ph6];
    
    elseif D==2 && F==4
        draw=[item1t;item1t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12; ph3 ph3 ph1 ph1 ph5 ph5; pw11 pw13 pw11 pw13 pw11 pw13; ph4 ph4 ph2 ph2 ph6 ph6];
    
    elseif D==2 && F==5
        draw=[item1t;item1t;item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3; pw11 pw13 pw11 pw13 pw11 pw13 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4];
    
    elseif D==2 && F==6
        draw=[item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4];
    
    elseif D==2 && F==7
        draw=[item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2];
    
    elseif D==2 && F==8
        draw=[item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14 pw16; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15 pw17; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2];
    
    elseif D==2 && F==9
        draw=[item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14 pw16 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15 pw17 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6];
    
    elseif D==3 && F==0
        draw=[item1t;item1t;item1t];
        v=[pw10 pw12 pw10; ph3 ph3 ph1; pw11 pw13 pw11; ph4 ph4 ph2];
        
    elseif D==3 && F==1
        draw=[item1t;item1t;item1t;item2t];
        v=[pw10 pw12 pw10 pw12; ph3 ph3 ph1 ph1; pw11 pw13 pw11 pw13; ph4 ph4 ph2 ph2];
    
    elseif D==3 && F==2
        draw=[item1t;item1t;item1t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10; ph3 ph3 ph1 ph1 ph5; pw11 pw13 pw11 pw13 pw11; ph4 ph4 ph2 ph2 ph6];
    
    elseif D==3 && F==3
        draw=[item1t;item1t;item1t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12; ph3 ph3 ph1 ph1 ph5 ph5; pw11 pw13 pw11 pw13 pw11 pw13; ph4 ph4 ph2 ph2 ph6 ph6];
    
    elseif D==3 && F==4
        draw=[item1t;item1t;item1t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3; pw11 pw13 pw11 pw13 pw11 pw13 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4];
    
    elseif D==3 && F==5
        draw=[item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4];
    
    elseif D==3 && F==6
        draw=[item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2];
    
    elseif D==3 && F==7
        draw=[item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14 pw16; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15 pw17; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2];
    
    elseif D==3 && F==8
        draw=[item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14 pw16 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15 pw17 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6];
    
    elseif D==4 && F==0
        draw=[item1t;item1t;item1t;item1t];
        v=[pw10 pw12 pw10 pw12; ph3 ph3 ph1 ph1; pw11 pw13 pw11 pw13; ph4 ph4 ph2 ph2];
        
    elseif D==4 && F==1
        draw=[item1t;item1t;item1t;item1t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10; ph3 ph3 ph1 ph1 ph5; pw11 pw13 pw11 pw13 pw11; ph4 ph4 ph2 ph2 ph6];
    
    elseif D==4 && F==2
        draw=[item1t;item1t;item1t;item1t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12; ph3 ph3 ph1 ph1 ph5 ph5; pw11 pw13 pw11 pw13 pw11 pw13; ph4 ph4 ph2 ph2 ph6 ph6];
    
    elseif D==4 && F==3
        draw=[item1t;item1t;item1t;item1t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3; pw11 pw13 pw11 pw13 pw11 pw13 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4];
    
    elseif D==4 && F==4
        draw=[item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4];
    
    elseif D==4 && F==5
        draw=[item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2];
    
    elseif D==4 && F==6
        draw=[item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14 pw16; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15 pw17; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2];
    
    elseif D==4 && F==7
        draw=[item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14 pw16 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15 pw17 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6];
    
    elseif D==5 && F==0
        draw=[item1t;item1t;item1t;item1t;item1t];
        v=[pw10 pw12 pw10 pw12 pw10; ph3 ph3 ph1 ph1 ph5; pw11 pw13 pw11 pw13 pw11; ph4 ph4 ph2 ph2 ph6];
        
    elseif D==5 && F==1
        draw=[item1t;item1t;item1t;item1t;item1t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12; ph3 ph3 ph1 ph1 ph5 ph5; pw11 pw13 pw11 pw13 pw11 pw13; ph4 ph4 ph2 ph2 ph6 ph6];
    
    elseif D==5 && F==2
        draw=[item1t;item1t;item1t;item1t;item1t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3; pw11 pw13 pw11 pw13 pw11 pw13 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4];
    
    elseif D==5 && F==3
        draw=[item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4];
    
    elseif D==5 && F==4
        draw=[item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2];
    
    elseif D==5 && F==5
        draw=[item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14 pw16; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15 pw17; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2];
    
    elseif D==5 && F==6
        draw=[item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14 pw16 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15 pw17 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6];
    
    elseif D==6 && F==0
        draw=[item1t;item1t;item1t;item1t;item1t;item1t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12; ph3 ph3 ph1 ph1 ph5 ph5; pw11 pw13 pw11 pw13 pw11 pw13; ph4 ph4 ph2 ph2 ph6 ph6];
        
    elseif D==6 && F==1
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3; pw11 pw13 pw11 pw13 pw11 pw13 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4];
    
    elseif D==6 && F==2
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4];
    
    elseif D==6 && F==3
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2];
    
    elseif D==6 && F==4
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14 pw16; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15 pw17; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2];
    
    elseif D==6 && F==5
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14 pw16 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15 pw17 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6];
    
    elseif D==7 && F==0
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3; pw11 pw13 pw11 pw13 pw11 pw13 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4];
        
    elseif D==7 && F==1
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4];
    
    elseif D==7 && F==2
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2];
    
    elseif D==7 && F==3
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14 pw16; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15 pw17; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2];
    
    elseif D==7 && F==4
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14 pw16 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15 pw17 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6];
    
    elseif D==8 && F==0 
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4];
        
    elseif D==8 && F==1
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2];
    
    elseif D==8 && F==2
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14 pw16; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15 pw17; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2];
    
    elseif D==8 && F==3
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14 pw16 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15 pw17 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6];
    
    elseif D==9 && F==0
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2];
        
    elseif D==9 && F==1
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14 pw16; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15 pw17; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2];
    
    elseif D==9 && F==2
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14 pw16 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15 pw17 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6];
    
    elseif D==10 && F==0
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14 pw16; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15 pw17; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2];
        
    elseif D==10 && F==1
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item2t];
        v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14 pw16 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15 pw17 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6];
    
    elseif D==11 && F==0
       draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t];
       v=[pw10 pw12 pw10 pw12 pw10 pw12 pw14 pw16 pw14 pw16 pw14; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5; pw11 pw13 pw11 pw13 pw11 pw13 pw15 pw17 pw15 pw17 pw15; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6];
    end
    
    Screen('DrawTextures',w,draw,[],v)
    Screen('Flip',w);
    KbWait
    Screen('CloseAll');
end

