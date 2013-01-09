function [output_args] = SingleGARPChoiceLeft( item1,item2,firstitemOnLeft,seconditemOnLeft)
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
    if exist('firstitemOnLeft','var') == 0; % If 'itemitemsOnLeft' doesn't exist  . . . 
        firstitemOnLeft = 10;                % Create it and set it equal to 3 (default)
    end

    if exist('seconditemOnLeft','var') == 0; 
        seconditemOnLeft = 1;
    end
    
    C = firstitemOnLeft;
    E = seconditemOnLeft;
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
    
    %**LEFT** side
    if C==0 && E==2
        draw=[item2t;item2t];
        v=[pw7 pw5; ph3 ph3; pw8 pw6; ph4 ph4];
    
    elseif C==0 && E==3 
        draw=[item2t;item2t;item2t];
        v=[pw7 pw5 pw7; ph3 ph3 ph1; pw8 pw6 pw8; ph4 ph4 ph2];
    
    elseif C==0 && E==4
        draw=[item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5; ph3 ph3 ph1 ph1; pw8 pw6 pw8 pw6; ph4 ph4 ph2 ph2];
    
    elseif C==0 && E==5
        draw=[item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7; ph3 ph3 ph1 ph1 ph5; pw8 pw6 pw8 pw6 pw8; ph4 ph4 ph2 ph2 ph6];
    
    elseif C==0 && E==6 
        draw=[item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5; ph3 ph3 ph1 ph1 ph5 ph5; pw8 pw6 pw8 pw6 pw8 pw6; ph4 ph4 ph2 ph2 ph6 ph6];
    
    elseif C==0 && E==7
        draw=[item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3; pw8 pw6 pw8 pw6 pw8 pw6 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4];
    
    elseif C==0 && E==8
        draw=[item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4];
    
    elseif C==0 && E==9
        draw=[item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2];
    
    elseif C==0 && E==10
        draw=[item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3 pw1; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4 pw2; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2];
    
    elseif C==0 && E==11
        draw=[item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3 pw1 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4 pw2 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6];
    
    elseif C==1 && E==2
        draw=[item1t;item2t;item2t];
        v=[pw7 pw5 pw7; ph3 ph3 ph1; pw8 pw6 pw8; ph4 ph4 ph2];
    
    elseif C==1 && E==3
        draw=[item1t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5; ph3 ph3 ph1 ph1; pw8 pw6 pw8 pw6; ph4 ph4 ph2 ph2];
    
    elseif C==1 && E==4
        draw=[item1t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7; ph3 ph3 ph1 ph1 ph5; pw8 pw6 pw8 pw6 pw8; ph4 ph4 ph2 ph2 ph6];
    
    elseif C==1 && E==5
        draw=[item1t;item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5; ph3 ph3 ph1 ph1 ph5 ph5; pw8 pw6 pw8 pw6 pw8 pw6; ph4 ph4 ph2 ph2 ph6 ph6];
    
    elseif C==1 && E==6
        draw=[item1t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3; pw8 pw6 pw8 pw6 pw8 pw6 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4];
    
    elseif C==1 && E==7
        draw=[item1t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4];
    
    elseif C==1 && E==8
        draw=[item1t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2];
    
    elseif C==1 && E==9
        draw=[item1t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3 pw1; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4 pw2; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2];
    
    elseif C==1 && E==10
        draw=[item1t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3 pw1 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4 pw2 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6];
    
    elseif C==2 && E==0
        draw=[item1t;item1t];
        v=[pw7 pw5; ph3 ph3; pw8 pw6; ph4 ph4];
        
    elseif C==2 && E==1
        draw=[item1t;item1t;item2t];
        v=[pw7 pw5 pw7; ph3 ph3 ph1; pw8 pw6 pw8; ph4 ph4 ph2];
    
    elseif C==2 && E==2
        draw=[item1t;item1t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5; ph3 ph3 ph1 ph1; pw8 pw6 pw8 pw6; ph4 ph4 ph2 ph2];
    
    elseif C==2 && E==3
        draw=[item1t;item1t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7; ph3 ph3 ph1 ph1 ph5; pw8 pw6 pw8 pw6 pw8; ph4 ph4 ph2 ph2 ph6];
    
    elseif C==2 && E==4
        draw=[item1t;item1t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5; ph3 ph3 ph1 ph1 ph5 ph5; pw8 pw6 pw8 pw6 pw8 pw6; ph4 ph4 ph2 ph2 ph6 ph6];
    
    elseif C==2 && E==5
        draw=[item1t;item1t;item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3; pw8 pw6 pw8 pw6 pw8 pw6 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4];
    
    elseif C==2 && E==6
        draw=[item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4];
    
    elseif C==2 && E==7
        draw=[item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2];
    
    elseif C==2 && E==8
        draw=[item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3 pw1; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4 pw2; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2];
    
    elseif C==2 && E==9
        draw=[item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3 pw1 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4 pw2 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6];
    
    elseif C==3 && E==0
        draw=[item1t;item1t;item1t];
        v=[pw7 pw5 pw7; ph3 ph3 ph1; pw8 pw6 pw8; ph4 ph4 ph2];
        
    elseif C==3 && E==1
        draw=[item1t;item1t;item1t;item2t];
        v=[pw7 pw5 pw7 pw5; ph3 ph3 ph1 ph1; pw8 pw6 pw8 pw6; ph4 ph4 ph2 ph2];
    
    elseif C==3 && E==2
        draw=[item1t;item1t;item1t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7; ph3 ph3 ph1 ph1 ph5; pw8 pw6 pw8 pw6 pw8; ph4 ph4 ph2 ph2 ph6];
    
    elseif C==3 && E==3
        draw=[item1t;item1t;item1t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5; ph3 ph3 ph1 ph1 ph5 ph5; pw8 pw6 pw8 pw6 pw8 pw6; ph4 ph4 ph2 ph2 ph6 ph6];
    
    elseif C==3 && E==4
        draw=[item1t;item1t;item1t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3; pw8 pw6 pw8 pw6 pw8 pw6 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4];
    
    elseif C==3 && E==5
        draw=[item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4];
    
    elseif C==3 && E==6
        draw=[item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2];
    
    elseif C==3 && E==7
        draw=[item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3 pw1; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4 pw2; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2];
    
    elseif C==3 && E==8
        draw=[item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3 pw1 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4 pw2 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6];
    
    elseif C==4 && E==0
        draw=[item1t;item1t;item1t;item1t];
        v=[pw7 pw5 pw7 pw5; ph3 ph3 ph1 ph1; pw8 pw6 pw8 pw6; ph4 ph4 ph2 ph2];
        
    elseif C==4 && E==1
        draw=[item1t;item1t;item1t;item1t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7; ph3 ph3 ph1 ph1 ph5; pw8 pw6 pw8 pw6 pw8; ph4 ph4 ph2 ph2 ph6];
    
    elseif C==4 && E==2
        draw=[item1t;item1t;item1t;item1t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5; ph3 ph3 ph1 ph1 ph5 ph5; pw8 pw6 pw8 pw6 pw8 pw6; ph4 ph4 ph2 ph2 ph6 ph6];
    
    elseif C==4 && E==3
        draw=[item1t;item1t;item1t;item1t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3; pw8 pw6 pw8 pw6 pw8 pw6 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4];
    
    elseif C==4 && E==4
        draw=[item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4];
    
    elseif C==4 && E==5
        draw=[item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2];
    
    elseif C==4 && E==6
        draw=[item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3 pw1; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4 pw2; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2];
    
    elseif C==4 && E==7
        draw=[item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3 pw1 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4 pw2 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6];
    
    elseif C==5 && E==0
        draw=[item1t;item1t;item1t;item1t;item1t];
        v=[pw7 pw5 pw7 pw5 pw7; ph3 ph3 ph1 ph1 ph5; pw8 pw6 pw8 pw6 pw8; ph4 ph4 ph2 ph2 ph6];
        
    elseif C==5 && E==1
        draw=[item1t;item1t;item1t;item1t;item1t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5; ph3 ph3 ph1 ph1 ph5 ph5; pw8 pw6 pw8 pw6 pw8 pw6; ph4 ph4 ph2 ph2 ph6 ph6];
    
    elseif C==5 && E==2
        draw=[item1t;item1t;item1t;item1t;item1t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3; pw8 pw6 pw8 pw6 pw8 pw6 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4];
    
    elseif C==5 && E==3
        draw=[item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4];
    
    elseif C==5 && E==4
        draw=[item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2];
    
    elseif C==5 && E==5
        draw=[item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3 pw1; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4 pw2; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2];
    
    elseif C==5 && E==6
        draw=[item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3 pw1 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4 pw2 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6];
    
    elseif C==6 && E==0
        draw=[item1t;item1t;item1t;item1t;item1t;item1t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5; ph3 ph3 ph1 ph1 ph5 ph5; pw8 pw6 pw8 pw6 pw8 pw6; ph4 ph4 ph2 ph2 ph6 ph6];
        
    elseif C==6 && E==1
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3; pw8 pw6 pw8 pw6 pw8 pw6 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4];
    
    elseif C==6 && E==2
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4];
    
    elseif C==6 && E==3
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2];
    
    elseif C==6 && E==4
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3 pw1; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4 pw2; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2];
    
    elseif C==6 && E==5
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3 pw1 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4 pw2 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6];
    
    elseif C==7 && E==0
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3; pw8 pw6 pw8 pw6 pw8 pw6 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4];
        
    elseif C==7 && E==1
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4];
    
    elseif C==7 && E==2
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2];
    
    elseif C==7 && E==3
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3 pw1; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4 pw2; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2];
    
    elseif C==7 && E==4
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3 pw1 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4 pw2 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6];
    
    elseif C==8 && E==0
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4];
        
    elseif C==8 && E==1
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2];
    
    elseif C==8 && E==2
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3 pw1; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4 pw2; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2];
    
    elseif C==8 && E==3
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3 pw1 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4 pw2 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6];
    
    elseif C==9 && E==0
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2];
        
    elseif C==9 && E==1
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3 pw1; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4 pw2; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2];
    
    elseif C==9 && E==2
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item2t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3 pw1 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4 pw2 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6];
    
    elseif C==10 && E==0
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3 pw1; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4 pw2; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2];
        
    elseif C==10 && E==1
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item2t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3 pw1 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4 pw2 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6];
    
    elseif C==11 && E==0
        draw=[item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t;item1t];
        v=[pw7 pw5 pw7 pw5 pw7 pw5 pw3 pw1 pw3 pw1 pw3; ph3 ph3 ph1 ph1 ph5 ph5 ph3 ph3 ph1 ph1 ph5; pw8 pw6 pw8 pw6 pw8 pw6 pw4 pw2 pw4 pw2 pw4; ph4 ph4 ph2 ph2 ph6 ph6 ph4 ph4 ph2 ph2 ph6];
    end
    
    
    Screen('DrawTextures',w,draw,[],v)
    Screen('Flip',w);
    KbWait
    Screen('CloseAll');
    
end


