function [ output_args ] = RunGARPSubject( subjID, item1c, item2c, item3c, item4c, item5c, item6c, item7c, item8c, item9c)

%% Defaults
% Default for subjID is 1. This only kicks in iff no subject ID is given.
if exist('subjID','var') == 0;
    subjID = 1;
end
if exist('input','var') == 0;
    input = 't';
end
if input == 't'; % on a tablet we need to disable the screen synch test becuase . . .  who knows
    Screen('preference', 'SkipSyncTests',1);
end

%% Set-Up
items = [item1c, item2c, item3c, item4c, item5c, item6c, item7c, item8c, item9c];
itemOrder = randperm(length(items));
itemsInOrder = items(itemOrder);

for i = 1:length(items);
    v = genvarname(strcat('item', num2str(i)));
    eval([v '= imread(strcat(''Image'', num2str(itemsInOrder(i)), ''.JPG''));']);
end
images = [item1, item2, item3, item4, item5, item6, item7, item8, item9];


load('rankingTask.mat');
trials = rankingTask;
long = length (items);
trialOrder = trials(randperm(long));
%Some times the "LEFT" basket should show up on the right so that the
%suject doesn't get used to seeing the "best" basket on one side of the
%other. flipLR determins when this flipping happens
flipLR = [zeros(1,ceil(long/2)), ones(1,floor(long/2))];
flipLR = flipLR(randperm(long));

% Task settings
settings.recordfolder = 'records';
settings.subjID       = subjID;
settings.itemsInOrder = itemsInOrder;
settings.flipLR       = flipLR;

% Display settings
settings.screenNumber = screenNumber;
settings.width = width;
settings.height = height;

% if the records folder doesn't exist, create it.
mkdir(settings.recordfolder);
% creat the file name for this run of this subject
recordname = [settings.recordfolder '/' num2str(subjID) '_' datestr(now,'yyyymmddTHHMMSS') '.mat'];
% Save the settings (the results are saved later)
save (recordname, 'settings')
% Restrict the keys that can be used for the Kb commands [ALL KEYS ARE
% ENABLED AFTER A cear all command]

%% BEGIN!
for i = 1:long;
    itemLeft = trialOrder(i,1);
    itemRight= trialOrder(i,1);
    if flipLR(i) == 0;
        renderGARP(itemLeft, itemLeft, itemRight, itemRight, ...
            1, 0, ...
            0, 0,w);
    elseif flipLR(i) == 1;
        renderGARP(itemRight, itemRight, itemLeft, itemLeft, ...
            1, 0, ...
            0, 0,w);
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
Screen('CloseAll');
end