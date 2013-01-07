function one_item_choice(subjectID,BlkNum,fileName)
%% Set up for Dornsiphe Scanner
RespKey={'1','2','3','4'};  % These are the keys used by the button Box
                            % 1 & 2 ---> left middle and left index
                            % 3 & 4 ---> Right middle and right index
width=1024; height=768; hz=60;
LAG=8;% lag before main experiment 
TRIAL_DURATION=8;
%% Defining the Basics
White=[255 255 255]; % This color is for text
Yellow=[255 255 0];  % This color is for letting the subject know what txt they chose
    % set some condition-independent variables
makeScreenShot  = 0;    % if 1, then screenshots of stimuli will be made
bgdac           =  80;  % background grayvalue (RGB)
fgdac           = 220;  % foreground grayvalue (RGB)
    settings.stimecc         = 5;    % stimulus eccentricity (deg)
    settings.ITT             = 300;  % inter stimulus time (ms)
    settings.BT              = 5000; % break time(ms)
    settings.cue_time   = 300;  % cue presentation time (ms)
    settings.stimtime = 300;      % stimulus presentation time (ms)

%% Selecting the Images -- Eventually this will select the images based on the subjects preferences
item1 = imread('juice.jpg')
item2 = imread('juice.jpg')

