function test_screen
% This code is used for designing and previewing screen views.
% It's just a playground and shouldn't be called to do any real work.



%% Setup the screen
    % Screen info
    screenNumber = max(Screen('Screens'));       % use external Screen if exists
    [w h] = Screen('WindowSize', screenNumber);  % Fetch Screen resolution
    screen_resolution = [w h];                 % Define Screen resolution
    screen_center = screen_resolution/2;       % Screen center
    left_center = [w/4 h/2];                   % Center of left half of screen
    right_center = [3*w/4 h/2];                % Center of right half of screen

    %% Select the Images
item1 = imread('juice.jpg'); 
item2 = imread('chips.jpg');

%%  Render one image in the middle of the screen
    window = Screen(screenNumber, 'OpenWindow');
    item1t = Screen('MakeTexture',window,item1);   
    Screen('DrawTexture', window, item1t)
    Screen('Flip',window);  
    item2t = Screen('MakeTexture',window,item2);  
    Screen('DrawTexture', window, item2t)
    KbWait;   
    Screen('Flip',window); 
 
%% Press Any Key to Close
    KbWait; 
    Screen('CloseAll'); 