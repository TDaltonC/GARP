function [ output_args ] = RunGARPSubject( subjID, item1c, item2c, item3c, input )

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

%Load all of the task lists
load('catchTasks.mat');
load('limitGARPTasks.mat'); % Each row has two vlaues, the first number is for the amount of item1, the second number is the amount of item2
load('juanset.mat'); % This is a 3D araay each (1:2,1:2,x) contains one set of numbers to use for a single GARP presentation

    
catchTasks = catchTasks;
limitGARPTasks = limitGARPTasks; % Each row has two vlaues, the first number is for the amount of item1, the second number is the amount of item2
twoItemGARPTasks = juanset; % This is a 3D araay each (1:2,1:2,x) contains one set of numbers to use for a single GARP presentation
threeItemGARPTasks1213 = juanset; % This is a 3D araay each (1:2,1:2,x) contains one set of numbers to use for a single GARP presentation
threeItemGARPTasks1223 = juanset; % This is a 3D araay each (1:2,1:2,x) contains one set of numbers to use for a single GARP presentation
threeItemGARPTasks1323 = juanset; % This is a 3D araay each (1:2,1:2,x) contains one set of numbers to use for a single GARP presentation



%% **Design the task orders**
trialOrder = repeatedhistory(5,7,1,1,false); % This sets the order of the tasks
% trialOrder = ones(length(trialOrder),1);
long = length(trialOrder); %The total number of trials that will be performed
blockLength = 44;

catchOrder = []; % The fixxed order that the catch trials will be presented in. If there are more tials that need to be shown then we have, then a second list (random order) is made and concatinated on to the end of the old one.
i=1;
while ceil(long/length(catchTasks))>=i;
    catchOrder = cat(2,catchOrder,randperm(length(catchTasks)));
    i = i + 1;
end

limitGARPOrder = []; % The fixxed order that the GARP limit trials will be presented in. If there are more tials that need to be shown then we have, then a second list (random order) is made and concatinated on to the end of the old one.
i = 1;
while ceil(long/(length(limitGARPTasks))) >= i;
    limitGARPOrder = cat(2,limitGARPOrder,randperm(length(limitGARPTasks)));
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

if item1c == 1; item1 = imread('ajuice.jpg');     end
if item1c == 2; item1 = imread('cheese.jpg');     end
if item1c == 3; item1 = imread('cheezit.jpg');    end
if item1c == 4; item1 = imread('cjuice.jpg');     end
if item1c == 5; item1 = imread('dorito.jpg');     end
if item1c == 6; item1 = imread('mm.jpg');         end
if item1c == 7; item1 = imread('icedtea.jpg');    end
if item1c == 8; item1 = imread('lemonheads.jpg'); end
if item1c == 9; item1 = imread('milk.jpg');       end
if item1c == 10;item1 = imread('oreo.jpg');       end
if item1c == 11;item1 = imread('ojuice.jpg');     end
if item1c == 12;item1 = imread('peanuts.jpg');    end
if item1c == 13;item1 = imread('pistach.jpg');    end
if item1c == 14;item1 = imread('pretzel.jpg');    end
if item1c == 15;item1 = imread('chips.jpg');      end
if item1c == 16;item1 = imread('vjuice.jpg');     end

if item2c == 1; item2 = imread('ajuice.jpg');     end
if item2c == 2; item2 = imread('cheese.jpg');     end
if item2c == 3; item2 = imread('cheezit.jpg');    end
if item2c == 4; item2 = imread('cjuice.jpg');     end
if item2c == 5; item2 = imread('dorito.jpg');     end
if item2c == 6; item2 = imread('mm.jpg');         end
if item2c == 7; item2 = imread('icedtea.jpg');    end
if item2c == 8; item2 = imread('lemonheads.jpg'); end
if item2c == 9; item2 = imread('milk.jpg');       end
if item2c == 10;item2 = imread('oreo.jpg');       end
if item2c == 11;item2 = imread('ojuice.jpg');     end
if item2c == 12;item2 = imread('peanuts.jpg');    end
if item2c == 13;item2 = imread('pistach.jpg');    end
if item2c == 14;item2 = imread('pretzel.jpg');    end
if item2c == 15;item2 = imread('chips.jpg');      end
if item2c == 16;item2 = imread('vjuice.jpg');     end

if item3c == 1; item3 = imread('ajuice.jpg');     end
if item3c == 2; item3 = imread('cheese.jpg');     end
if item3c == 3; item3 = imread('cheezit.jpg');    end
if item3c == 4; item3 = imread('cjuice.jpg');     end
if item3c == 5; item3 = imread('dorito.jpg');     end
if item3c == 6; item3 = imread('mm.jpg');         end
if item3c == 7; item3 = imread('icedtea.jpg');    end
if item3c == 8; item3 = imread('lemonheads.jpg'); end
if item3c == 9; item3 = imread('milk.jpg');       end
if item3c == 10;item3 = imread('oreo.jpg');       end
if item3c == 11;item3 = imread('ojuice.jpg');     end
if item3c == 12;item3 = imread('peanuts.jpg');    end
if item3c == 13;item3 = imread('pistach.jpg');    end
if item3c == 14;item3 = imread('pretzel.jpg');    end
if item3c == 15;item3 = imread('chips.jpg');      end
if item3c == 16;item3 = imread('vjuice.jpg');     end

%% Set up the screen

screenNumber = max(Screen('Screens'));
[width height] = Screen('WindowSize', screenNumber);
w = Screen('OpenWindow', screenNumber,[],[],[],[]);

%% Saving the settings

settings.recordfolder = 'records';
settings.subjID = subjID;
settings.trialOrder = trialOrder;
settings.flipLR = flipLR; %if '0', don't flip. If '1' flip the left basker for the right basket

settings.catchTasks     = catchTasks;
settings.catchOrder     = catchOrder;
settings.limitGARPTasks = limitGARPTasks;
settings.limitGARPOrder = limitGARPOrder;
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
limitGARPIndex = 1;
twoItemGARPIndex =1;
threeItemGARPIndex1213 = 1;
threeItemGARPIndex1223 = 1;
threeItemGARPIndex1323 = 1;
block = 1;


while i <= long;
    
    
    switch(trialOrder(i));
        case 1 %is for the one item (per side) (different items) GARP
            if limitGARPOrder <= 25;
                if flipLR(i) == 0;
                    renderGARP(item1, item1, ...
                        item2, item2,...
                        limitGARPTasks(limitGARPOrder(limitGARPIndex),1), 0, ...
                        limitGARPTasks(limitGARPOrder(limitGARPIndex),2), 0,w);
                elseif flipLR(i) == 1;
                    renderGARP(item2, item2, ...
                        item1, item1,...
                        limitGARPTasks(limitGARPOrder(limitGARPIndex),2), 0, ...
                        limitGARPTasks(limitGARPOrder(limitGARPIndex),1), 0,w);
                end
                limitGARPIndex = limitGARPIndex  + 1 ;
            elseif limitGARPOrder > 25; %% we'll have the same item on both sides (different amounts)
                if flipLR(i) == 0;
                    renderGARP(item1, item1, item1, item1, ...
                        catchTasks(catchOrder(catchIndex),1), 0, ...
                        catchTasks(catchOrder(catchIndex),2), 0,w);
                elseif flipLR(i) == 1;
                    renderGARP(item1, item1, item1, item1, ...
                        catchTasks(catchOrder(catchIndex),1), 0, ...
                        catchTasks(catchOrder(catchIndex),2), 0,w);
                end
                catchIndex = catchIndex  + 1 ;
            end
            
            
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
            renderGARP(item1, ...
                item2, ...
                item1, ...
                item3, ...
                threeItemGARPTasks1213(1,1,threeItemGARPOrder1213(threeItemGARPIndex1213)), ...
                threeItemGARPTasks1213(1,2,threeItemGARPOrder1213(threeItemGARPIndex1213)), ...
                threeItemGARPTasks1213(2,1,threeItemGARPOrder1213(threeItemGARPIndex1213)), ...
                threeItemGARPTasks1213(2,2,threeItemGARPOrder1213(threeItemGARPIndex1213)),w);
            elseif flipLR(i) == 1
            renderGARP(item1, ...
                item3, ...
                item1, ...
                item2, ...
                threeItemGARPTasks1213(2,1,threeItemGARPOrder1213(threeItemGARPIndex1213)), ...
                threeItemGARPTasks1213(2,2,threeItemGARPOrder1213(threeItemGARPIndex1213)), ...
                threeItemGARPTasks1213(1,1,threeItemGARPOrder1213(threeItemGARPIndex1213)), ...
                threeItemGARPTasks1213(1,2,threeItemGARPOrder1213(threeItemGARPIndex1213)),w);
            end
            threeItemGARPIndex1213 = threeItemGARPIndex1213  + 1;  
            
        case 4 %is for the three item GARP 1-2 x 2-3
            if flipLR(i) == 0
            renderGARP(item1, ...
                item2, ...
                item2, ...
                item3, ...
                threeItemGARPTasks1223(1,1,threeItemGARPOrder1223(threeItemGARPIndex1223)), ...
                threeItemGARPTasks1223(1,2,threeItemGARPOrder1223(threeItemGARPIndex1223)), ...
                threeItemGARPTasks1223(2,1,threeItemGARPOrder1223(threeItemGARPIndex1223)), ...
                threeItemGARPTasks1223(2,2,threeItemGARPOrder1223(threeItemGARPIndex1223)),w);
            elseif flipLR(i) == 1
            renderGARP(item2, ...
                item3, ...
                item1, ...
                item2, ...
                threeItemGARPTasks1223(2,1,threeItemGARPOrder1223(threeItemGARPIndex1223)), ...
                threeItemGARPTasks1223(2,2,threeItemGARPOrder1223(threeItemGARPIndex1223)), ...
                threeItemGARPTasks1223(1,1,threeItemGARPOrder1223(threeItemGARPIndex1223)), ...
                threeItemGARPTasks1223(1,2,threeItemGARPOrder1223(threeItemGARPIndex1223)),w);
            end
            threeItemGARPIndex1223 = threeItemGARPIndex1223  + 1;      
            
        case 5 %is for the three item GARP 1-3 x 2-3
            if flipLR(i) == 0 
            renderGARP(item1, ...
                item3, ...
                item2, ...
                item3, ...
                threeItemGARPTasks1323(1,1,threeItemGARPOrder1323(threeItemGARPIndex1323)), ...
                threeItemGARPTasks1323(1,2,threeItemGARPOrder1323(threeItemGARPIndex1323)), ...
                threeItemGARPTasks1323(2,1,threeItemGARPOrder1323(threeItemGARPIndex1323)), ...
                threeItemGARPTasks1323(2,2,threeItemGARPOrder1323(threeItemGARPIndex1323)),w);
            elseif flipLR(i) == 1
            renderGARP(item2, ...
                item3, ...
                item1, ...
                item3, ...
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
    
    %If a key is pressed, record that key press in the bahvioral record.
    if sum(keyCode) == 1;
        behavioral.key(i,1) = KbName(keyCode);
    end
elseif input == 'm'; % 'm' is for mouse
    [clicks,x,y,whichButton] = GetClicks(w,0);
    
    %drawFixation
    drawFixation(w);
    
    %Record where the click happend and which side it was on
    if x <= width/2;
        behavioral.key(i,1) = 'f'; 
    elseif x > width/2
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
    

%% All of this is just of outputting the reward
if block == 1 && i == rewardTrial;
    
    if trialOrder(i) == 1; %is for the one item (per side) (different items) GARP
        left.Item  = item1c;
        left.Amount = limitGARPTasks(limitGARPOrder(limitGARPIndex),1);
        
        right.Item = item2c;
        right.Amount = limitGARPTasks(limitGARPOrder(limitGARPIndex),2);
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
        left.Item = [item1c,item2c];
        left.Amount = [threeItemGARPTasks1213(1,1,threeItemGARPOrder1213(threeItemGARPIndex1213)), ...
            threeItemGARPTasks1213(1,2,threeItemGARPOrder1213(threeItemGARPIndex1213))];
        right.Item= [item1c,item3c];
        right.Amount =[threeItemGARPTasks1213(2,1,threeItemGARPOrder1213(threeItemGARPIndex1213)), ...
            threeItemGARPTasks1213(2,2,threeItemGARPOrder1213(threeItemGARPIndex1213))];
    end
    
    if trialOrder(i) == 4; %is for the three item GARP 1-2 x 2-3
        left.Item = [item1c,item2c];
        left.Amount = [threeItemGARPTasks1223(1,1,threeItemGARPOrder1223(threeItemGARPIndex1223)), ...
            threeItemGARPTasks1223(1,2,threeItemGARPOrder1223(threeItemGARPIndex1223))];
        right.Item =[item2c,item3c];
        right.Amount =[threeItemGARPTasks1223(2,1,threeItemGARPOrder1223(threeItemGARPIndex1223)), ...
            threeItemGARPTasks1223(2,2,threeItemGARPOrder1223(threeItemGARPIndex1223))];
    end
    
    if trialOrder(i) == 5; %is for the three item GARP 1-3 x 2-3
        left.Item = [item1c,item3c];
        left.Amount = [threeItemGARPTasks1323(1,1,threeItemGARPOrder1323(threeItemGARPIndex1323)), ...
            threeItemGARPTasks1323(1,2,threeItemGARPOrder1323(threeItemGARPIndex1323))];
        right.Item =[item2c,item3c];
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
Screen('CloseAll')
end

