function [ output_args ] = RunGARPSubject( subjID, item1c, item2c, item3c, item4c, item5c, w, input )

% input tells you if the subject will be using a keyboard('k'), a mouse ('m'), or a windows 8 tablet('t') 

%% Settings
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
%rng(subjID);
%Load all of the task lists
load('catchTasks.mat');
load('juanset.mat'); % This is a 3D array each (1:2,1:2,x) contains one set of numbers to use for a single GARP presentation

    
catchTasks = catchTasks;
twoItemGARPTasks = juanset; % This is a 3D araay each (1:2,1:2,x) contains one set of numbers to use for a single GARP presentation
threeItemGARPTasks1213 = juanset; % This is a 3D array each (1:2,1:2,x) contains one set of numbers to use for a single GARP presentation
threeItemGARPTasks1223 = juanset; % This is a 3D array each (1:2,1:2,x) contains one set of numbers to use for a single GARP presentation
threeItemGARPTasks1323 = juanset; % This is a 3D array each (1:2,1:2,x) contains one set of numbers to use for a single GARP presentation



%% **Design the task orders**
trials = [1*ones(1,length(catchTasks)), 2*ones(1,length(twoItemGARPTasks)), 3*ones(1,length(threeItemGARPTasks1213)), 4*ones(1,length(threeItemGARPTasks1223)), 5*ones(1,length(threeItemGARPTasks1323))]; % This sets the order of the tasks
long = length(trials); %The total number of trials that will be performed
trialOrder = trials(randperm(long));
blockLength = 38;

catchOrder = []; % The fixxed order that the catch trials will be presented in. If there are more tials that need to be shown then we have, then a second list (random order) is made and concatinated on to the end of the old one.
i=1;
while ceil(long/length(catchTasks))>=i;
    catchOrder = cat(2,catchOrder,randperm(length(catchTasks)));
    i = i + 1;
end




twoItemGARPOrder = []; %The fixxed order that the 2item GARP trials will be presented in. If there are more tials that need to be shown then we have, then a second list (random order) is made and concatinated on to the end of the old one. 
i = 1;
while ceil(long/(length(twoItemGARPTasks))) >= i;
    twoItemGARPOrder = cat(2,twoItemGARPOrder,randperm(length(twoItemGARPTasks)));
    i = i + 1;
end

threeItemGARPOrder1213 = []; %The fixxed order that the 3item GARP trials (1,2x1,3) will be presented in. If there are more tials that need to be shown then we have, then a second list (random order) is made and concatinated on to the end of the old one. 
i = 1;
while ceil(long/(length(threeItemGARPTasks1213))) >= i;
    threeItemGARPOrder1213 = cat(2,threeItemGARPOrder1213,randperm(length(threeItemGARPTasks1213)));
    i = i + 1;
end

threeItemGARPOrder1223 = []; %The fixxed order that the 3item GARP trials (1,2x2,3) will be presented in. If there are more tials that need to be shown then we have, then a second list (random order) is made and concatinated on to the end of the old one. 
i = 1;
while ceil(long/(length(threeItemGARPTasks1223))) >= i;
    threeItemGARPOrder1223 = cat(2,threeItemGARPOrder1223,randperm(length(threeItemGARPTasks1223)));
    i = i + 1;
end

threeItemGARPOrder1323 = []; %The fixxed order that the 3item GARP trials (1,3x2,3) will be presented in. If there are more tials that need to be shown then we have, then a second list (random order) is made and concatinated on to the end of the old one. 
i = 1;
while ceil(long/(length(threeItemGARPTasks1323))) >= i;
    threeItemGARPOrder1323 = cat(2,threeItemGARPOrder1323,randperm(length(threeItemGARPTasks1323)));
    i = i + 1;
end

%Some times the "LEFT" basket should show up on the right so that the
%suject doesn't get used to seeing the "best" basket on one side of the
%other. flipLR determins when this flipping happens
flipLR = [zeros(1,ceil(long/2)), ones(1,floor(long/2))]; 
flipLR = flipLR(randperm(long));



%% Picking the items
if exist('item1c','var') == 0; item1c = 1; end
if exist('item2c','var') == 0; item2c = 2; end
if exist('item3c','var') == 0; item3c = 3; end
if exist('item4c','var') == 0; item4c = 4; end
if exist('item5c','var') == 0; item5c = 5; end

items = [item1c item2c item3c item4c item5c];
itemOrder = randperm(5); 
for i = 1:5;
   j = itemOrder(i);
   v = genvarname(strcat('item', num2str(i)));
   eval([v '= imread(strcat(''Image'', num2str(items(j)), ''.JPG''));']);
end

catchItems = [item1c item1c item2c item2c item3c item3c item4c item4c item5c item5c];
catchItems = catchItems(randperm(10));

%% Set up the screen

screenNumber = max(Screen('Screens'));
[width height] = Screen('WindowSize', screenNumber);
if exist('w','var') == 0;
    w = Screen('OpenWindow', screenNumber,[],[],[],[]);
end
%% Saving the settings

settings.recordfolder = 'records';
settings.subjID = subjID;
settings.trialOrder = trialOrder;
settings.flipLR = flipLR; %if '0', don't flip. If '1' flip the left basker for the right basket
settings.catchTasks     = catchTasks;
settings.catchOrder     = catchOrder;
settings.catchItems     = catchItems;
settings.twoItemGARPTasks =twoItemGARPTasks;
settings.twoItemGARPOrder =twoItemGARPOrder;
settings.threeItemGARPTasks1213 =threeItemGARPTasks1213;
settings.threeItemGARPOrder1213 =threeItemGARPOrder1213;
settings.threeItemGARPTasks1223 =threeItemGARPTasks1223;
settings.threeItemGARPOrder1223 =threeItemGARPOrder1223;
settings.threeItemGARPTasks1323 =threeItemGARPTasks1323;
settings.threeItemGARPOrder1323 =threeItemGARPOrder1323;




settings.item1 = item1;
settings.item2 = item2;
settings.item3 = item3;
settings.item4 = item4;
settings.item5 = item5;

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
            RestrictKeysForKbCheck([9, 13, 41]) %These are the Mac key codes for f, j, and ESCSAPE respectively
            escKey = KbName('ESCAPE');
        else
            RestrictKeysForKbCheck([70, 74, 81]) %THese are the PC keys for f, j and q
            escKey = KbName('Esc');
end
 

% Display "READY"
drawStart(w);
Screen('Flip',w);
WaitSecs(10);
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

%% during the experiment
% Be mindfull that only the "behavioral." data structure will be saved.

% reward trial
rewardTrial = randi(blockLength);

% Set all of the indexs equal to 1
i = 1;
catchIndex = 1;
twoItemGARPIndex =1;
threeItemGARPIndex1213 = 1;
threeItemGARPIndex1223 = 1;
threeItemGARPIndex1323 = 1;
block = 1;


while i <= long;
    
    
    switch(trialOrder(i));
        case 1 %is for the one item (per side) (different items) GARP
            item = imread(strcat('Image', num2str(catchItems(catchIndex)), '.JPG'));
            if flipLR(i) == 0;
                renderGARP(item, item, item, item, ...
                    catchTasks(catchOrder(catchIndex),1), 0, ...
                    catchTasks(catchOrder(catchIndex),2), 0,w);
            elseif flipLR(i) == 1;
                renderGARP(item, item, item, item, ...
                    catchTasks(catchOrder(catchIndex),2), 0, ...
                    catchTasks(catchOrder(catchIndex),1), 0,w);
            end
            catchIndex = catchIndex  + 1 ;
            
            
        case 2 %is for the two item (per side) GARP
            if flipLR(i) == 0;
                renderGARP(item1, ...
                    item2, ...
                    item1, ...
                    item2, ...
                    twoItemGARPTasks(1,1,twoItemGARPOrder(twoItemGARPIndex)), ...
                    twoItemGARPTasks(1,2,twoItemGARPOrder(twoItemGARPIndex)), ...
                    twoItemGARPTasks(2,1,twoItemGARPOrder(twoItemGARPIndex)), ...
                    twoItemGARPTasks(2,2,twoItemGARPOrder(twoItemGARPIndex)),w);
            elseif flipLR(i) == 1; %% flip the presnetation
                renderGARP(item1, ...
                    item2, ...
                    item1, ...
                    item2, ...
                    twoItemGARPTasks(2,1,twoItemGARPOrder(twoItemGARPIndex)), ...
                    twoItemGARPTasks(2,2,twoItemGARPOrder(twoItemGARPIndex)), ...
                    twoItemGARPTasks(1,1,twoItemGARPOrder(twoItemGARPIndex)), ...
                    twoItemGARPTasks(1,2,twoItemGARPOrder(twoItemGARPIndex)),w);
            end
            twoItemGARPIndex = twoItemGARPIndex  + 1;
            
        case 3 %is for the three item GARP 1-2 x 1-3
            if flipLR(i) == 0
                renderGARP(item3, ...
                    item4, ...
                    item3, ...
                    item5, ...
                    threeItemGARPTasks1213(1,1,threeItemGARPOrder1213(threeItemGARPIndex1213)), ...
                    threeItemGARPTasks1213(1,2,threeItemGARPOrder1213(threeItemGARPIndex1213)), ...
                    threeItemGARPTasks1213(2,1,threeItemGARPOrder1213(threeItemGARPIndex1213)), ...
                    threeItemGARPTasks1213(2,2,threeItemGARPOrder1213(threeItemGARPIndex1213)),w);
            elseif flipLR(i) == 1
                renderGARP(item3, ...
                    item5, ...
                    item3, ...
                    item4, ...
                    threeItemGARPTasks1213(2,1,threeItemGARPOrder1213(threeItemGARPIndex1213)), ...
                    threeItemGARPTasks1213(2,2,threeItemGARPOrder1213(threeItemGARPIndex1213)), ...
                    threeItemGARPTasks1213(1,1,threeItemGARPOrder1213(threeItemGARPIndex1213)), ...
                    threeItemGARPTasks1213(1,2,threeItemGARPOrder1213(threeItemGARPIndex1213)),w);
            end
            threeItemGARPIndex1213 = threeItemGARPIndex1213  + 1;
            
        case 4 %is for the three item GARP 1-2 x 2-3
            if flipLR(i) == 0
                renderGARP(item3, ...
                    item4, ...
                    item4, ...
                    item5, ...
                    threeItemGARPTasks1223(1,1,threeItemGARPOrder1223(threeItemGARPIndex1223)), ...
                    threeItemGARPTasks1223(1,2,threeItemGARPOrder1223(threeItemGARPIndex1223)), ...
                    threeItemGARPTasks1223(2,1,threeItemGARPOrder1223(threeItemGARPIndex1223)), ...
                    threeItemGARPTasks1223(2,2,threeItemGARPOrder1223(threeItemGARPIndex1223)),w);
            elseif flipLR(i) == 1
                renderGARP(item4, ...
                    item5, ...
                    item3, ...
                    item4, ...
                    threeItemGARPTasks1223(2,1,threeItemGARPOrder1223(threeItemGARPIndex1223)), ...
                    threeItemGARPTasks1223(2,2,threeItemGARPOrder1223(threeItemGARPIndex1223)), ...
                    threeItemGARPTasks1223(1,1,threeItemGARPOrder1223(threeItemGARPIndex1223)), ...
                    threeItemGARPTasks1223(1,2,threeItemGARPOrder1223(threeItemGARPIndex1223)),w);
            end
            threeItemGARPIndex1223 = threeItemGARPIndex1223  + 1;
            
        case 5 %is for the three item GARP 1-3 x 2-3
            if flipLR(i) == 0
                renderGARP(item3, ...
                    item5, ...
                    item4, ...
                    item5, ...
                    threeItemGARPTasks1323(1,1,threeItemGARPOrder1323(threeItemGARPIndex1323)), ...
                    threeItemGARPTasks1323(1,2,threeItemGARPOrder1323(threeItemGARPIndex1323)), ...
                    threeItemGARPTasks1323(2,1,threeItemGARPOrder1323(threeItemGARPIndex1323)), ...
                    threeItemGARPTasks1323(2,2,threeItemGARPOrder1323(threeItemGARPIndex1323)),w);
            elseif flipLR(i) == 1
                renderGARP(item4, ...
                    item5, ...
                    item3, ...
                    item5, ...
                    threeItemGARPTasks1323(2,1,threeItemGARPOrder1323(threeItemGARPIndex1323)), ...
                    threeItemGARPTasks1323(2,2,threeItemGARPOrder1323(threeItemGARPIndex1323)), ...
                    threeItemGARPTasks1323(1,1,threeItemGARPOrder1323(threeItemGARPIndex1323)), ...
                    threeItemGARPTasks1323(1,2,threeItemGARPOrder1323(threeItemGARPIndex1323)),w);
            end
            threeItemGARPIndex1323 = threeItemGARPIndex1323  + 1;
    end

   
    
% flip    
% wait till the time is right  ------ Then flip

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
    

%% All of this is just of outputting the reward
if block == 1 && i == rewardTrial;
    
    if trialOrder(i) == 1; %is for the one item (per side) (different items) GARP
        left.Item  = catchItems(catchIndex);
        left.Amount = catchTasks(catchOrder(catchIndex),1);
        
        right.Item = catchItems(catchIndex);
        right.Amount = catchTasks(catchOrder(catchIndex),2);
    end
    
    
    if trialOrder(i) == 2; %is for the two item (per side) GARP
        left.Item = [item1c,item2c];
        left.Amount= [twoItemGARPTasks(1,1,twoItemGARPOrder(twoItemGARPIndex)), ...
            twoItemGARPTasks(1,2,twoItemGARPOrder(twoItemGARPIndex))];
        right.Item =[item1c,item2c];
        right.Amount =[twoItemGARPTasks(2,1,twoItemGARPOrder(twoItemGARPIndex)), ...
            twoItemGARPTasks(2,2,twoItemGARPOrder(twoItemGARPIndex))];
    end
    
    if trialOrder(i) == 3; %is for the three item GARP 1-2 x 1-3
        left.Item = [item3c,item4c];
        left.Amount = [threeItemGARPTasks1213(1,1,threeItemGARPOrder1213(threeItemGARPIndex1213)), ...
            threeItemGARPTasks1213(1,2,threeItemGARPOrder1213(threeItemGARPIndex1213))];
        right.Item= [item3c,item5c];
        right.Amount =[threeItemGARPTasks1213(2,1,threeItemGARPOrder1213(threeItemGARPIndex1213)), ...
            threeItemGARPTasks1213(2,2,threeItemGARPOrder1213(threeItemGARPIndex1213))];
    end
    
    if trialOrder(i) == 4; %is for the three item GARP 1-2 x 2-3
        left.Item = [item3c,item4c];
        left.Amount = [threeItemGARPTasks1223(1,1,threeItemGARPOrder1223(threeItemGARPIndex1223)), ...
            threeItemGARPTasks1223(1,2,threeItemGARPOrder1223(threeItemGARPIndex1223))];
        right.Item =[item4c,item5c];
        right.Amount =[threeItemGARPTasks1223(2,1,threeItemGARPOrder1223(threeItemGARPIndex1223)), ...
            threeItemGARPTasks1223(2,2,threeItemGARPOrder1223(threeItemGARPIndex1223))];
    end
    
    if trialOrder(i) == 5; %is for the three item GARP 1-3 x 2-3
        left.Item = [item3c,item5c];
        left.Amount = [threeItemGARPTasks1323(1,1,threeItemGARPOrder1323(threeItemGARPIndex1323)), ...
            threeItemGARPTasks1323(1,2,threeItemGARPOrder1323(threeItemGARPIndex1323))];
        right.Item =[item4c,item5c];
        right.Amount =[threeItemGARPTasks1323(2,1,threeItemGARPOrder1323(threeItemGARPIndex1323)), ...
            threeItemGARPTasks1323(2,2,threeItemGARPOrder1323(threeItemGARPIndex1323))];
    end
    
    
    if behavioral.key(i) == 'f';
        if flipLR(i) == 0; %%if the display was flipped, this conditional flips the reward
            reward.Item   = left.Item;
            reward.Amount = left.Amount;
        elseif flipLR(i) == 1;
            reward.Item   = right.Item;
            reward.Amount = right.Amount;
        end
    elseif behavioral.key(i) == 'j';
        if flipLR(i) == 0;
            reward.Item   = right.Item;
            reward.Amount = right.Amount;
        elseif flipLR(i) == 1;
            reward.Item   = left.Item;
            reward.Amount = left.Amount;
        end
    end
    rewardrecordname = [settings.recordfolder '/' 'reward_' num2str(subjID) '_' datestr(now,'yyyymmddTHHMMSS') '.mat'];
    save (rewardrecordname, 'reward');
end
%%



if mod(i,blockLength) == 0; %This throws up the "break" screen between trials.
    drawBreak(w);
    Screen('Flip',w);
    WaitSecs(20);
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
    block = block +1;
end

i = i + 1 ;

end
%% at the end
% up at the end of setings we created a file to hold all of our important data
% Now we will save all of the behavioural data in the same -.mat file

save (recordname, 'behavioral', '-append')
cd('D:/YAOABehaviorVersion_v2/SSTM/SSTM');
drawStop(w);
Screen('Flip',w);
WaitSecs(20);
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
SSTM(subjID);
Screen('CloseAll');
end

