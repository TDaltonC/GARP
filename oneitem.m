% This code is used for designing and previewing screen views.
% It's just a playground and shouldn't be called to do any real work.



%% Setup the screen
    % Screen info
    screenNumber = max(Screen('Screens'));       % use external Screen if exists
    [width height] = Screen('WindowSize', screenNumber);  % Fetch Screen resolution
    left_center_width = [width/4];                   % Center of left half of screen
    left_center_height = [height/2];
    right_center_width = [3*width/4];                % Center of right half of screen
    right_center_height = [height/2];

    %% Select the Images
item1 = imread('juice.jpg'); 
item2 = imread('chips.jpg');

%%  Render one image in the middle of the screen
    %one item per screen
    w = Screen(screenNumber, 'OpenWindow',[],[],[],[]);
    item1t = Screen('MakeTexture',w,item1); 
    Screen('DrawTexture',w,item1t,[],[0 0 600 600]);
    Screen('Flip',w);  
    pause
    item2t = Screen('MakeTexture',w,item2);  
    Screen('DrawTexture',w,item2t)
    Screen('Flip',w);
    pause
    item1t = Screen('MakeTexture',w,item1);   
    Screen('DrawTexture',w,item1t);
    Screen('Flip',w);
    pause
    item2t = Screen('MakeTexture',w,item2);  
    Screen('DrawTexture',w,item2t)
    Screen('Flip',w);
    pause 
    item1t = Screen('MakeTexture',w,item1);
    Screen('DrawTexture',w,item1t,[],[]);
    Screen('Flip',w);
    pause
    %item locations 1 and 2 - right half
    item2t = Screen('MakeTexture',w,item2);
    item1t = Screen('MakeTexture',w,item1);
    Screen('DrawTextures',w,[item2t;item1t],[],[6*width/10 8*width/10; 3*height/7 3*height/7; 7*width/10 9*width/10; 4*height/7 4*height/7]);
    Screen('Flip',w);
    pause 
    %item locations 1 and 2 - left half
    item2t = Screen('MakeTexture',w,item2);
    item1t = Screen('MakeTexture',w,item1);
    Screen('DrawTextures',w,[item2t;item1t],[],[width/10 3*width/10; 3*height/7 3*height/7; width/5 4*width/10; 4*height/7 4*height/7]);
    Screen('Flip',w);
    pause 
    %item locations 1, 2, 3 and 4 - right half
    item2t = Screen('MakeTexture',w,item2);
    item1t = Screen('MakeTexture',w,item1);
    Screen('DrawTextures',w,[item2t;item1t;item2t;item1t],[],[6*width/10 8*width/10 6*width/10 8*width/10; 3*height/7 3*height/7 5*height/7 5*height/7; 7*width/10 9*width/10 7*width/10 9*width/10; 4*height/7 4*height/7 6*height/7 6*height/7]);
    Screen('Flip',w);
    pause 
    %item locations 1, 2, 3, and 4 - left half
    item2t = Screen('MakeTexture',w,item2);
    item1t = Screen('MakeTexture',w,item1);
    Screen('DrawTextures',w,[item2t;item1t;item2t;item1t],[],[width/10 3*width/10 width/10 3*width/10; 3*height/7 3*height/7 5*height/7 5*height/7; width/5 4*width/10 width/5 4*width/10; 4*height/7 4*height/7 6*height/7 6*height/7]);
    Screen('Flip',w);
    pause 
    %item locations 1, 2, 3, 4, 5, and 6 - right half
    item2t = Screen('MakeTexture',w,item2);
    item1t = Screen('MakeTexture',w,item1);
    Screen('DrawTextures',w,[item2t;item1t;item2t;item1t;item2t;item1t],[],[6*width/10 8*width/10 6*width/10 8*width/10 6*width/10 8*width/10; 3*height/7 3*height/7 5*height/7 5*height/7 height/7 height/7; 7*width/10 9*width/10 7*width/10 9*width/10 7*width/10 9*width/10; 4*height/7 4*height/7 6*height/7 6*height/7 2*height/7 2*height/7]);
    Screen('Flip',w);
    pause 
    %item locations 1, 2, 3, 4, 5, and 6 - left half
    item2t = Screen('MakeTexture',w,item2);
    item1t = Screen('MakeTexture',w,item1);
    Screen('DrawTextures',w,[item2t;item1t;item2t;item1t;item2t;item1t],[],[width/10 3*width/10 width/10 3*width/10 width/10 3*width/10; 3*height/7 3*height/7 5*height/7 5*height/7 height/7 height/7; width/5 4*width/10 width/5 4*width/10 width/5 4*width/10; 4*height/7 4*height/7 6*height/7 6*height/7 2*height/7 2*height/7]);
    Screen('Flip',w);
    pause 
    %items 1, 2, 3, 4, 5, and 6 - both halfs
    item2t = Screen('MakeTexture',w,item2);
    item1t = Screen('MakeTexture',w,item1);
    Screen('DrawTextures',w,[item2t;item1t;item2t;item1t;item2t;item1t;item2t;item1t;item2t;item1t;item2t;item1t],[],[width/10 3*width/10 width/10 3*width/10 width/10 3*width/10 6*width/10 8*width/10 6*width/10 8*width/10 6*width/10 8*width/10; 3*height/7 3*height/7 5*height/7 5*height/7 height/7 height/7 3*height/7 3*height/7 5*height/7 5*height/7 height/7 height/7; width/5 4*width/10 width/5 4*width/10 width/5 4*width/10 7*width/10 9*width/10 7*width/10 9*width/10 7*width/10 9*width/10; 4*height/7 4*height/7 6*height/7 6*height/7 2*height/7 2*height/7 4*height/7 4*height/7 6*height/7 6*height/7 2*height/7 2*height/7]);
    Screen('Flip',w);
    pause 
    %Disregard this last piece of code - only there so we would be able to see the immediately
    %preceding one
    item1t = Screen('MakeTexture',w,item1);
    Screen('DrawTexture',w,item1t,[],[]);
    Screen('Flip',w);
    KbWait; 
    Screen('CloseAll'); 
    
    
    %For recording responses with a max wait time - regardless of
    %key press - before flip
kc_f = KbName('f');
kc_j = KbName('j');

waitTime  = 3;        % Wait for 3 seconds

startTime = GetSecs();
while 1

    [keyIsDown secs keycodes] = KbCheck();

    % Check that pressed keycodes and the desired codes overlap
    % If so, then exit loop
    if keycodes(kc_f)
        disp('You pressed f');
        break
    elseif keycodes(kc_j)
        disp('You pressed j');
        break
    elseif GetSecs()-startTime > waitTime
        break
    end
end

if ~any(keycodes)
    disp('You pressed nothing');
end


%% Press Any Key to Close
    KbWait; 
    Screen('CloseAll'); 