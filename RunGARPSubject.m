function [ output_args ] = RunGARPSubject( subjID )

%cd ('GARP') % Sets the current directory to GARP

%% Settings

% Default for subjID is 1. This only kicks in iff no subject ID is given.
if exist('subjID','var') == 0;
    subjID = 1;
end

%Load all of the task lists
load('scaledChoiceTasks.mat'); % Each row has two vlaues, the first number is for the amount of item1 on left, the second number is the amount of item1 on right  
load('limitGARPTasks.mat'); % Each row has two vlaues, the first number is for the amount of item1, the second number is the amount of item2
load('juanset.mat'); % This is a 3D araay each (1:2,1:2,x) contains one set of numbers to use for a single GARP presentation

    
scaledChoiceTasks = scaledChoiceTasks; % Each row has two vlaues, the first number is for the amount of item1 on left, the second number is the amount of item1 on right  
limitGARPTasks = limitGARPTasks; % Each row has two vlaues, the first number is for the amount of item1, the second number is the amount of item2
twoItemGARPTasks = juanset; % This is a 3D araay each (1:2,1:2,x) contains one set of numbers to use for a single GARP presentation



%% **Design the task orders**
trialOrder = repeatedhistory(4,5,2,1,false); % This sets the order of the tasks
% trialOrder = ones(length(trialOrder),1);
long = length(trialOrder); %The total number of trials that will be performed
short = long/4;            %The number of each type of trial that will be performed
oneItemOrder = repeatedhistory(2,5,4,1,false); % This sets the order of the task types. This one isn't done like the others because there is only two types of trial (so they are couterbalenced). If they weren't counter ballences they would be very little variability in the order of the presentations.

scaledChoiceOrder = []; % The fixxed order that the scaled trials will be presented in. If there are more tials that need to be shown then we have, then a second list (random order) is made and concatinated on to the end of the old one.
i = 1;
while ceil(short/(length(scaledChoiceTasks))) >= i;
    scaledChoiceOrder = cat(2,scaledChoiceOrder,randperm(length(scaledChoiceTasks)));
    i = i + 1;
end


limitGARPOrder = []; % The fixxed order that the GARP limit trials will be presented in. If there are more tials that need to be shown then we have, then a second list (random order) is made and concatinated on to the end of the old one.
i = 1;
while ceil(short/(length(limitGARPTasks))) >= i;
    limitGARPOrder = cat(2,limitGARPOrder,randperm(length(limitGARPTasks)));
    i = i + 1;
end



twoItemGARPOrder = []; %The fixxed order that the 2item GARP trials will be presented in. If there are more tials that need to be shown then we have, then a second list (random order) is made and concatinated on to the end of the old one. 
i = 1;
while ceil(short/(length(twoItemGARPTasks))) >= i;
    twoItemGARPOrder = cat(2,twoItemGARPOrder,randperm(length(twoItemGARPTasks)));
    i = i + 1;
end

%% Picking the items
item1 = imread('juice.jpg');
item2 = imread('chips.jpg');

%% Set up the screen

screenNumber = max(Screen('Screens'));
[width height] = Screen('WindowSize', screenNumber);
w = Screen(screenNumber, 'OpenWindow',[],[],[],[]);

%% Saving the settingsf

settings.recordfolder = 'records';
settings.subjID = subjID;
settings.trialOrder = trialOrder;

settings.oneItemOrder = oneItemOrder;
settings.scaledChoiceTasks = scaledChoiceTasks;
settings.scaledChoiceOrder = scaledChoiceOrder;
settings.limitGARPTasks = limitGARPTasks;
settings.limitGARPOrder = limitGARPOrder;
settings.twoItemGARPTasks =twoItemGARPTasks;
settings.twoItemGARPOrder = twoItemGARPOrder;

settings.item1 = item1;
settings.item2 = item2;

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
if (ismac)
            RestrictKeysForKbCheck([9, 13, 41]) %These are the key codes for f, j, and ESCSAPE respectively
            escKey = KbName('ESCAPE');
        else
            RestrictKeysForKbCheck(['f', 'j', 'Esc'])
            escKey = KbName('Esc');
end
 

% Display "READY"
% wait for the go signal (5's) from the MRI


%% during the experiment
% Be mindfull that only the "behavioral." data structure will be saved.

% Set all of the indexs equal to 1
i = 1;
oneItemIndex = 1;
scaledChoiceIndex = 1;
limitGARPIndex = 1;
twoItemGARPIndex =1;

t = ceil(GetSecs); %Set the time keeper for the experiment
if mod(t,2) == 1;
    t = t+1;
end

WaitSecs('UntilTime', t)

while i <= long;
    if trialOrder(i) == 1; %is for the one v. one choicef
        if oneItemOrder(oneItemIndex) == 1;
            twoItemGARP(item1,item1,item2,item2,1,0,1,0,w);
        else
            twoItemGARP(item2,item2,item1,item1,1,0,1,0,w);
        end
        oneItemIndex = oneItemIndex + 1;
    end
    
    if trialOrder(i) == 2; %is for the one item (same item both sides) choice
        twoItemGARP(item1, item1, ...
                     item1, item1, ...
                     scaledChoiceTasks(scaledChoiceOrder(scaledChoiceIndex),1), 0, ...
                     scaledChoiceTasks(scaledChoiceOrder(scaledChoiceIndex),2), 0,w);
        scaledChoiceIndex = scaledChoiceIndex  + 1 ;
    end
    
    
    if trialOrder(i) == 3; %is for the one item (per side) (different items) GARP
        twoItemGARP(item1, item1, ...
                    item2, item2,...
                    limitGARPTasks(limitGARPOrder(limitGARPIndex),1), 0, ...
                    limitGARPTasks(limitGARPOrder(limitGARPIndex),2), 0,w);
        limitGARPIndex = limitGARPIndex  + 1 ;        
    end
    
    
    if trialOrder(i) == 4; %is for the two item (per side) GARP
        twoItemGARP(item1, ...
                    item2, ...
                    item1, ...
                    item2, ...
                    twoItemGARPTasks(1,1,twoItemGARPOrder(twoItemGARPIndex)), ...
                    twoItemGARPTasks(1,2,twoItemGARPOrder(twoItemGARPIndex)), ...
                    twoItemGARPTasks(2,1,twoItemGARPOrder(twoItemGARPIndex)), ...
                    twoItemGARPTasks(2,2,twoItemGARPOrder(twoItemGARPIndex)),w);
        twoItemGARPIndex = twoItemGARPIndex  + 1;        
    end
    
    if trialOrder(i) == 5; %is fofr the three item (per side) GARP
        
    end
    
    
% flip    
% wait till the time is right  ------ Then flip

if i > 1; % So don't wait on the first lap through
% first wiat .2 secons so that they have time to stop pressing the button.
% Then wait until the next cycle of the experiment (2 second interval)
    WaitSecs(0.1);
    waitTime = ceil(GetSecs);
    if mod(waitTime,2) == 1;
        waitTime = waitTime+1;
    end
else
    waitTime = GetSecs;
end
Screen('Flip',w,waitTime);
   
% Key response

[behavioral.secs(i,1), keyCode, behavioral.deltaSecs] = KbWait([], 0, (waitTime + 4));

%drawFixation
drawFixation(w);

%If a key is pressed, record that key press in the bahvioral record. 
if sum(keyCode) == 1;
    behavioral.key(i,1) = KbName(keyCode);
end

i = i + 1 ;



end
%% at the end
% up at the end of setings we created a file to hold all of our important data
% Now we will save all of the behavioural data in the same -.mat file

save (recordname, 'behavioral', '-append')
Screen('CloseAll')
end

