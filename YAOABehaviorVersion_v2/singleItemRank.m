function [ output_args ] = RunGARPSubject( subjID, item1c, item2c, item3c, item4c, item5c, item6c, item7c, item8c, item9c, item10c)

%% Defaults
% Default for subjID is 1. This only kicks in iff no subject ID is given.
if exist('subjID','var') == 0; subjID = 1;end

if exist('item1c','var') == 0; item1c = 11; end
if exist('item2c','var') == 0; item2c = 12; end
if exist('item3c','var') == 0; item3c = 13; end
if exist('item4c','var') == 0; item4c = 14; end
if exist('item5c','var') == 0; item5c = 15; end
if exist('item6c','var') == 0; item6c = 16; end
if exist('item7c','var') == 0; item7c = 17; end
if exist('item8c','var') == 0; item8c = 18; end
if exist('item9c','var') == 0; item9c = 19; end
if exist('item10c','var')== 0; item10c = 20; end

if exist('input','var') == 0;input = 't';end
% on a tablet we need to disable the screen synch test becuase . . .  who knows
if input == 't'; Screen('preference', 'SkipSyncTests',1);end


%% Set-Up the experiment
items = [item1c, item2c, item3c, item4c, item5c, item6c, item7c, item8c, item9c, item10c];
itemOrder = randperm(length(items));
itemsInOrder = items(itemOrder);

for i = 1:length(items);
    v = genvarname(strcat('item', num2str(i)));
    eval([v '= imread(strcat(''Image'', num2str(itemsInOrder(i)), ''.JPG''));']);
end
% images = [item1; item2; item3; item4; item5; item6; item7; item8; item9; item10];


load('rankingTask.mat');
trials = rankingTask;
long = length (trials);
trialOrder = randperm(long);
% trialOrder = trials(order, order);
%Some times the "LEFT" basket should show up on the right so that the
%suject doesn't get used to seeing the "best" basket on one side of the
%other. flipLR determins when this flipping happens
flipLR = [zeros(1,ceil(long/2)), ones(1,floor(long/2))];
flipLR = flipLR(randperm(long));

%% Set up the screen

screenNumber = max(Screen('Screens'));
[width height] = Screen('WindowSize', screenNumber);
w = Screen('OpenWindow', screenNumber,[],[],[],[]);

%% SAVE SETTINGS
% Task settings
settings.recordfolder = 'records';
settings.subjID       = subjID;
settings.itemsInOrder = itemsInOrder;
settings.flipLR       = flipLR;
settings.trialOrder   = trialOrder;

% Display settings
settings.screenNumber = screenNumber;
settings.width = width;
settings.height = height;

% if the records folder doesn't exist, create it.
mkdir(settings.recordfolder);
% creat the file name for this run of this subject
recordname = [settings.recordfolder '/' num2str(subjID) '_RankTask_' datestr(now,'yyyymmddTHHMMSS') '.mat'];
% Save the settings (the results are saved later)
save (recordname, 'settings');
% Restrict the keys that can be used for the Kb commands [ALL KEYS ARE
% ENABLED AFTER A cear all command]

% Display "READY"
drawStart(w);
Screen('Flip',w);
if input == 'k';
    KbWait([], 3);
elseif input == 'm';
    GetClicks(w,0);
elseif input == 't';
    SetMouse(width/2, height/2 ,w);
    while true;
        [x,y] = GetMouse(w);
        if x ~= width/2 && y ~= height/2;
            break;
        end
    end
end

%% BEGIN!
for i = 1:long;
    itemLeft = itemsInOrder(trials(trialOrder(i),1));
    itemRight= itemsInOrder(trials(trialOrder(i),2));
    
    v = genvarname(strcat('image', 'Left'));
    eval([v '= imread(strcat(''Image'', num2str(itemLeft), ''.JPG''));']);
    
    v = genvarname(strcat('image', 'Right'));
    eval([v '= imread(strcat(''Image'', num2str(itemRight), ''.JPG''));']);
    
    if flipLR(i) == 0;
        renderRank(imageLeft, imageLeft, imageRight, imageRight, ...
            1, 0, ...
            1, 0,w);
    elseif flipLR(i) == 1;
        renderRank(imageRight, imageRight, imageLeft, imageLeft, ...
            1, 0, ...
            1, 0,w);
    end
    if i > 1; % So don't wait on the first lap through
        % first wiat .2 secons so that they have time to stop pressing the button.
        WaitSecs(0.25);
    end
    Screen('Flip',w);
    
    if input  == 'k';% 'k' for for Keyboard
        [behavioral.secs(i,1), keyCode, behavioral.deltaSecs] = KbWait([], 3);
        
        %drawFixation
        drawFixation(w);
        
        %If a key is pressed, record that key press in the behavioral record.
        if sum(keyCode) == 1;
            behavioral.key(i,1) = KbName(keyCode);
        end
    elseif input == 'm'; % 'm' is for mouse
        [clicks,x,y,whichButton] = GetClicks(w,0);
        
        %drawFixation
        drawFixation(w);
        
        %Record where the click happened and which side it was on
        if x <= width/2;
            behavioral.key(i,1) = 'f';
        elseif x > width/2;
            behavioral.key(i,1) = 'j';
        end
    elseif input == 't'; % 't' is for tablet
        SetMouse(width/2, height/2 ,w);
        while true;
            [x,y] = GetMouse(w);
            if x ~= width/2 && y ~= height/2;
                break;
            end
        end
        behavioral.secs(i,1) = now;
        %drawFixation
        drawFixation(w);
        
        if x <= width/2;
            behavioral.key(i,1) = 'f';
        elseif x > width/2
            behavioral.key(i,1) = 'j';
        end
        
    end
end

%% Saving
save (recordname, 'behavioral', '-append');
RunGARPSubject( subjID, item1c, item2c, item3c, item4c, item5c,w);
Screen('CloseAll');
% choiceRanking;
end