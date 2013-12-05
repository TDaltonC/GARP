
clear
jiuce = imread('juice.jpg');
DisplayImage(jiuce) 
i=2;
WaitSecs(0.2);
[behavioural.secs(i,1), keyCode, deltaSecs] = KbWait;
behavioural.key(i) = KbName(keyCode);
Screen('CloseAll')