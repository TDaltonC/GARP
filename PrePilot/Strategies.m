cd('/Users/Niree/Documents/GitHub/GARP/prePilot/preProcessedRev/');
subjects = dir;
for folder = 1:length(subjects)
    if subjects(folder).name(1) == '.';
        continue
    end
    cd(subjects(folder).name);
    load('preProcessed.mat');

%% FOR LIMIT (ONE ITEM) TASKS
set = preProcessed.limitGARP.revtasks;
choice = preProcessed.limitGARP.choices;

%%%% Strategy1: Maximizing Absolutely
strategy1 = zeros(length(set),1);
for i = 1:length(set);
    if set(1,1,i) + set(1,2,i) > set(2,1,i) + set(2,2,i);
        strategy1(i) = 1;
    elseif set(1,1,i) + set(1,2,i) < set(2,1,i) + set(2,2,i);
        strategy1(i) = 2;
    elseif set(1,1,i) + set(1,2,i) == set(2,1,i) + set(2,2,i);
        strategy1(i) = 0; %0 means that either response (1 or 2) will be in compliance with the strategy
    end
end

strategy.limitGARP.strategy1 = strategy1;
save('strategy.mat','strategy');

%%%% Strategy2: Maximizing Item 1 or Equivalently, Minimizing Item 2
strategy2 = zeros(length(set),1);
for i = 1:length(set);
    if set(1,1,i) > set(2,1,i);
        strategy2(i) = 1;
    elseif set(1,1,i) < set(2,1,i);
        strategy2(i) = 2;
    elseif set(1,1,i) == set(2,1,i);
        strategy2(i) = 0;
    end
end

strategy.limitGARP.strategy2 = strategy2;
save('strategy.mat','strategy');

%%%% Strategy3: Maximizing Item 2 or Equivalently, Minimizing Item 1
strategy3 = zeros(length(set),1);
for i = 1:length(set);
    if set(1,2,i) > set(2,2,i);
        strategy3(i) = 1;
    elseif set(1,2,i) < set(2,2,i);
        strategy3(i) = 2;
    elseif set(1,2,i) == set(2,2,i);
        strategy3(i) = 0;
    end
end

strategy.limitGARP.strategy3 = strategy3;
save('strategy.mat','strategy');

%%%% Strategy 4: Minimizing Absolutely
strategy4 = zeros(length(set),1);
for i = 1:length(set);
    if set(1,1,i) + set(1,2,i) > set(2,1,i) + set(2,2,i);
        strategy4(i) = 2;
    elseif set(1,1,i) + set(1,2,i) < set(2,1,i) + set(2,2,i);
        strategy4(i) = 1;
    elseif set(1,1,i) + set(1,2,i) == set(2,1,i) + set(2,2,i);
        strategy4(i) = 0; %0 means that either response (1 or 2) will be in compliance with the strategy
    end
end

    
strategy.limitGARP.strategy4 = strategy4;
save('strategy.mat','strategy');

%%%% Strategy5: Equalizing ... note: it is impossible to differentiate between strategy4...
% strategy5 for the limit case
strategy5 = zeros(length(set),1);
for i = 1:length(set);
    if abs(set(1,1,i) - set(1,2,i)) > abs(set(2,1,i) - set(2,2,i));
        strategy5(i) = 2;
    elseif abs(set(1,1,i) - set(1,2,i)) < abs(set(2,1,i) - set(2,2,i));
        strategy5(i) = 1;
    elseif abs(set(1,1,i) - set(1,2,i)) == abs(set(2,1,i) - set(2,2,i));
        strategy5(i) = 0;
    end
end

strategy.limitGARP.strategy5 = strategy5;
save('strategy.mat','strategy');

%% FOR TWO ITEM TASKS
set = preProcessed.twoItemGARP.tasks;
choice = preProcessed.twoItemGARP.choices;

%%%% Strategy1: Maximizing Absolutely
strategy1 = zeros(length(set),1);
for i = 1:length(set);
    if set(1,1,i) + set(1,2,i) > set(2,1,i) + set(2,2,i);
        strategy1(i) = 1;
    elseif set(1,1,i) + set(1,2,i) < set(2,1,i) + set(2,2,i);
        strategy1(i) = 2;
    elseif set(1,1,i) + set(1,2,i) == set(2,1,i) + set(2,2,i);
        strategy1(i) = 0; %0 means that either response (1 or 2) will be in compliance with the strategy
    end
end

strategy.twoItemGARP.strategy1 = strategy1;
save('strategy.mat','strategy');

%%%% Strategy2: Maximizing Item 1 or Equivalently, Minimizing Item 2
strategy2 = zeros(length(set),1);
for i = 1:length(set);
    if set(1,1,i) > set(2,1,i);
        strategy2(i) = 1;
    elseif set(1,1,i) < set(2,1,i);
        strategy2(i) = 2;
    elseif set(1,1,i) == set(2,1,i);
        strategy2(i) = 0;
    end
end

strategy.twoItemGARP.strategy2 = strategy2;
save('strategy.mat','strategy');

%%%% Strategy3: Maximizing Item 2 or Equivalently, Minimizing Item 1
strategy3 = zeros(length(set),1);
for i = 1:length(set);
    if set(1,2,i) > set(2,2,i);
        strategy3(i) = 1;
    elseif set(1,2,i) < set(2,2,i);
        strategy3(i) = 2;
    elseif set(1,2,i) == set(2,2,i);
        strategy3(i) = 0;
    end
end

strategy.twoItemGARP.strategy3 = strategy3;
save('strategy.mat','strategy');

%%%% Strategy4: Minimizing Absolutely
strategy4 = zeros(length(set),1);
for i = 1:length(set);
    if set(1,1,i) + set(1,2,i) > set(2,1,i) + set(2,2,i);
        strategy4(i) = 2;
    elseif set(1,1,i) + set(1,2,i) < set(2,1,i) + set(2,2,i);
        strategy4(i) = 1;
    elseif set(1,1,i) + set(1,2,i) == set(2,1,i) + set(2,2,i);
        strategy4(i) = 0; %0 means that either response (1 or 2) will be in compliance with the strategy
    end
end

    
strategy.twoItemGARP.strategy4 = strategy4;
save('strategy.mat','strategy');

%%%% Strategy5: Equalizing
strategy5 = zeros(length(set),1);
for i = 1:length(set);
    if abs(set(1,1,i) - set(1,2,i)) > abs(set(2,1,i) - set(2,2,i));
        strategy5(i) = 2;
    elseif abs(set(1,1,i) - set(1,2,i)) < abs(set(2,1,i) - set(2,2,i));
        strategy5(i) = 1;
    elseif abs(set(1,1,i) - set(1,2,i)) == abs(set(2,1,i) - set(2,2,i));
        strategy5(i) = 0;
    end
end

strategy.twoItemGARP.strategy5 = strategy5;
save('strategy.mat','strategy');

%% FOR THREE ITEM 1213 TASKS
set = preProcessed.threeItemGARP1213.revtasks;
choice = preProcessed.threeItemGARP1213.choices;

%%%% Strategy1: Maximizing Absolutely
for i = 1:length(set);
    if set(1,1,i) + set(1,2,i) + set(1,3,i) > set(2,1,i) + set(2,2,i) + set(2,3,i);
        strategy1(i) = 1;
    elseif set(1,1,i) + set(1,2,i) + set(1,3,i) < set(2,1,i) + set(2,2,i) + set(2,3,i);
        strategy1(i) = 2;
    elseif set(1,1,i) + set(1,2,i) + set(1,3,i) == set(2,1,i) + set(2,2,i) + set(2,3,i);  
        strategy1(i) = 0;
    end
end

strategy.threeItemGARP1213.strategy1 = strategy1;
save('strategy.mat','strategy');

%%%% Strategy2: Maximizing Item 1 
for i = 1:length(set);
    if set(1,1,i) > set(2,1,i);
        strategy2(i) = 1;
    elseif set(1,1,i) < set(2,1,i);
        strategy2(i) = 2;
    elseif set(1,1,i) == set(2,1,i);
        strategy2(i) = 0;
    end
end

strategy.threeItemGARP1213.strategy2 = strategy2;
save('strategy.mat','strategy');

%%%% Strategy3: Maximizing Item 2 
for i = 1:length(set);
    if set(1,2,i) > set(2,2,i);
        strategy3(i) = 1;
    elseif set(1,2,i) < set(2,2,i);
        strategy3(i) = 2;
    elseif set(1,2,i) == set(2,2,i);
        strategy3(i) = 0;
    end
end

strategy.threeItemGARP1213.strategy3 = strategy3;
save('strategy.mat','strategy');

%%%% Strategy4: Minimizing Absolutely
for i = 1:length(set);
    if set(1,1,i) + set(1,2,i) + set(1,3,i) > set(2,1,i) + set(2,2,i) + set(2,3,i);
        strategy4(i) = 2;
    elseif set(1,1,i) + set(1,2,i) + set(1,3,i) < set(2,1,i) + set(2,2,i) + set(2,3,i);
        strategy4(i) = 1;
    elseif set(1,1,i) + set(1,2,i) + set(1,3,i) == set(2,1,i) + set(2,2,i) + set(2,3,i);  
        strategy4(i) = 0;
    end
end

strategy.threeItemGARP1213.strategy4 = strategy4;
save('strategy.mat','strategy');

%%%% Strategy6: Maximizing Item 3
for i = 1:length(set);
    if set(1,3,i) > set(2,3,i);
        strategy6(i) = 1;
    elseif set(1,3,i) < set(2,3,i);
        strategy6(i) = 2;
    elseif set(1,3,i) == set(2,3,i);
        strategy6(i) = 0;
    end
end

strategy.threeItemGARP1213.strategy6 = strategy6;
save('strategy.mat','strategy');

%%%% Strategy7: Maximizing Item 1 + Item 2
for i = 1:length(set);
    if set(1,1,i) + set(1,2,i) > set(2,1,i) + set(2,2,i);
        strategy7(i) = 1;
    elseif set(1,1,i) + set(1,2,i) > set(2,1,i) + set(2,2,i);
        strategy7(i) = 2;
    elseif set(1,1,i) + set(1,2,i) == set(2,1,i) + set(2,2,i);
        strategy7(i) = 0;
    end
end

strategy.threeItemGARP1213.strategy7 = strategy7;
save('strategy.mat','strategy');

%%%% Strategy8: Maximizing Item 1 + Item 3
for i = 1:length(set);
    if set(1,1,i) + set(1,3,i) > set(2,1,i) + set(2,3,i);
        strategy8(i) = 1;
    elseif set(1,1,i) + set(1,3,i) > set(2,1,i) + set(2,3,i);
        strategy8(i) = 2;
    elseif set(1,1,i) + set(1,3,i) == set(2,1,i) + set(2,3,i);
        strategy8(i) = 0;
    end
end

strategy.threeItemGARP1213.strategy8 = strategy8;
save('strategy.mat','strategy');

%%%% Strategy9: Maximizing Item 2 + Item 3
for i = 1:length(set);
    if set(1,2,i) + set(1,3,i) > set(2,2,i) + set(2,3,i);
        strategy9(i) = 1;
    elseif set(1,2,i) + set(1,3,i) > set(2,2,i) + set(2,3,i);
        strategy9(i) = 2;
    elseif set(1,2,i) + set(1,3,i) == set(2,2,i) + set(2,3,i);
        strategy9(i) = 0;
    end
end

strategy.threeItemGARP1213.strategy9 = strategy9;
save('strategy.mat','strategy');


%% FOR THREE ITEM 1223 TASKS
set = preProcessed.threeItemGARP1223.revtasks;
choice = preProcessed.threeItemGARP1223.choices;

%%%% Strategy1: Maximizing Absolutely
for i = 1:length(set);
    if set(1,1,i) + set(1,2,i) + set(1,3,i) > set(2,1,i) + set(2,2,i) + set(2,3,i);
        strategy1(i) = 1;
    elseif set(1,1,i) + set(1,2,i) + set(1,3,i) < set(2,1,i) + set(2,2,i) + set(2,3,i);
        strategy1(i) = 2;
    elseif set(1,1,i) + set(1,2,i) + set(1,3,i) == set(2,1,i) + set(2,2,i) + set(2,3,i);  
        strategy1(i) = 0;
    end
end

strategy.threeItemGARP1223.strategy1 = strategy1;
save('strategy.mat','strategy');

%%%% Strategy2: Maximizing Item 1 
for i = 1:length(set);
    if set(1,1,i) > set(2,1,i);
        strategy2(i) = 1;
    elseif set(1,1,i) < set(2,1,i);
        strategy2(i) = 2;
    elseif set(1,1,i) == set(2,1,i);
        strategy2(i) = 0;
    end
end

strategy.threeItemGARP1223.strategy2 = strategy2;
save('strategy.mat','strategy');

%%%% Strategy3: Maximizing Item 2 
for i = 1:length(set);
    if set(1,2,i) > set(2,2,i);
        strategy3(i) = 1;
    elseif set(1,2,i) < set(2,2,i);
        strategy3(i) = 2;
    elseif set(1,2,i) == set(2,2,i);
        strategy3(i) = 0;
    end
end

strategy.threeItemGARP1223.strategy3 = strategy3;
save('strategy.mat','strategy');

%%%% Strategy4: Minimizing Absolutely
for i = 1:length(set);
    if set(1,1,i) + set(1,2,i) + set(1,3,i) > set(2,1,i) + set(2,2,i) + set(2,3,i);
        strategy4(i) = 2;
    elseif set(1,1,i) + set(1,2,i) + set(1,3,i) < set(2,1,i) + set(2,2,i) + set(2,3,i);
        strategy4(i) = 1;
    elseif set(1,1,i) + set(1,2,i) + set(1,3,i) == set(2,1,i) + set(2,2,i) + set(2,3,i);  
        strategy4(i) = 0;
    end
end

strategy.threeItemGARP1223.strategy4 = strategy4;
save('strategy.mat','strategy');

%%%% Strategy6: Maximizing Item 3
for i = 1:length(set);
    if set(1,3,i) > set(2,3,i);
        strategy6(i) = 1;
    elseif set(1,3,i) < set(2,3,i);
        strategy6(i) = 2;
    elseif set(1,3,i) == set(2,3,i);
        strategy6(i) = 0;
    end
end

strategy.threeItemGARP1223.strategy6 = strategy6;
save('strategy.mat','strategy');

%%%% Strategy7: Maximizing Item 1 + Item 2
for i = 1:length(set);
    if set(1,1,i) + set(1,2,i) > set(2,1,i) + set(2,2,i);
        strategy7(i) = 1;
    elseif set(1,1,i) + set(1,2,i) > set(2,1,i) + set(2,2,i);
        strategy7(i) = 2;
    elseif set(1,1,i) + set(1,2,i) == set(2,1,i) + set(2,2,i);
        strategy7(i) = 0;
    end
end

strategy.threeItemGARP1223.strategy7 = strategy7;
save('strategy.mat','strategy');

%%%% Strategy8: Maximizing Item 1 + Item 3
for i = 1:length(set);
    if set(1,1,i) + set(1,3,i) > set(2,1,i) + set(2,3,i);
        strategy8(i) = 1;
    elseif set(1,1,i) + set(1,3,i) > set(2,1,i) + set(2,3,i);
        strategy8(i) = 2;
    elseif set(1,1,i) + set(1,3,i) == set(2,1,i) + set(2,3,i);
        strategy8(i) = 0;
    end
end

strategy.threeItemGARP1223.strategy8 = strategy8;
save('strategy.mat','strategy');

%%%% Strategy9: Maximizing Item 2 + Item 3
for i = 1:length(set);
    if set(1,2,i) + set(1,3,i) > set(2,2,i) + set(2,3,i);
        strategy9(i) = 1;
    elseif set(1,2,i) + set(1,3,i) > set(2,2,i) + set(2,3,i);
        strategy9(i) = 2;
    elseif set(1,2,i) + set(1,3,i) == set(2,2,i) + set(2,3,i);
        strategy9(i) = 0;
    end
end

strategy.threeItemGARP1223.strategy9 = strategy9;
save('strategy.mat','strategy');

%% FOR THREE ITEM 1323 TASKS
set = preProcessed.threeItemGARP1323.revtasks;
choice = preProcessed.threeItemGARP1323.choices;

%%%% Strategy1: Maximizing Absolutely
for i = 1:length(set);
    if set(1,1,i) + set(1,2,i) + set(1,3,i) > set(2,1,i) + set(2,2,i) + set(2,3,i);
        strategy1(i) = 1;
    elseif set(1,1,i) + set(1,2,i) + set(1,3,i) < set(2,1,i) + set(2,2,i) + set(2,3,i);
        strategy1(i) = 2;
    elseif set(1,1,i) + set(1,2,i) + set(1,3,i) == set(2,1,i) + set(2,2,i) + set(2,3,i);  
        strategy1(i) = 0;
    end
end

strategy.threeItemGARP1323.strategy1 = strategy1;
save('strategy.mat','strategy');

%%%% Strategy2: Maximizing Item 1 
for i = 1:length(set);
    if set(1,1,i) > set(2,1,i);
        strategy2(i) = 1;
    elseif set(1,1,i) < set(2,1,i);
        strategy2(i) = 2;
    elseif set(1,1,i) == set(2,1,i);
        strategy2(i) = 0;
    end
end

strategy.threeItemGARP1323.strategy2 = strategy2;
save('strategy.mat','strategy');

%%%% Strategy3: Maximizing Item 2 
for i = 1:length(set);
    if set(1,2,i) > set(2,2,i);
        strategy3(i) = 1;
    elseif set(1,2,i) < set(2,2,i);
        strategy3(i) = 2;
    elseif set(1,2,i) == set(2,2,i);
        strategy3(i) = 0;
    end
end

strategy.threeItemGARP1323.strategy3 = strategy3;
save('strategy.mat','strategy');

%%%% Strategy4: Minimizing Absolutely
for i = 1:length(set);
    if set(1,1,i) + set(1,2,i) + set(1,3,i) > set(2,1,i) + set(2,2,i) + set(2,3,i);
        strategy4(i) = 2;
    elseif set(1,1,i) + set(1,2,i) + set(1,3,i) < set(2,1,i) + set(2,2,i) + set(2,3,i);
        strategy4(i) = 1;
    elseif set(1,1,i) + set(1,2,i) + set(1,3,i) == set(2,1,i) + set(2,2,i) + set(2,3,i);  
        strategy4(i) = 0;
    end
end

strategy.threeItemGARP1323.strategy4 = strategy4;
save('strategy.mat','strategy');

%%%% Strategy6: Maximizing Item 3
for i = 1:length(set);
    if set(1,3,i) > set(2,3,i);
        strategy6(i) = 1;
    elseif set(1,3,i) < set(2,3,i);
        strategy6(i) = 2;
    elseif set(1,3,i) == set(2,3,i);
        strategy6(i) = 0;
    end
end

strategy.threeItemGARP1323.strategy6 = strategy6;
save('strategy.mat','strategy');

%%%% Strategy7: Maximizing Item 1 + Item 2
for i = 1:length(set);
    if set(1,1,i) + set(1,2,i) > set(2,1,i) + set(2,2,i);
        strategy7(i) = 1;
    elseif set(1,1,i) + set(1,2,i) > set(2,1,i) + set(2,2,i);
        strategy7(i) = 2;
    elseif set(1,1,i) + set(1,2,i) == set(2,1,i) + set(2,2,i);
        strategy7(i) = 0;
    end
end

strategy.threeItemGARP1323.strategy7 = strategy7;
save('strategy.mat','strategy');

%%%% Strategy8: Maximizing Item 1 + Item 3
for i = 1:length(set);
    if set(1,1,i) + set(1,3,i) > set(2,1,i) + set(2,3,i);
        strategy8(i) = 1;
    elseif set(1,1,i) + set(1,3,i) > set(2,1,i) + set(2,3,i);
        strategy8(i) = 2;
    elseif set(1,1,i) + set(1,3,i) == set(2,1,i) + set(2,3,i);
        strategy8(i) = 0;
    end
end

strategy.threeItemGARP1323.strategy8 = strategy8;
save('strategy.mat','strategy');

%%%% Strategy9: Maximizing Item 2 + Item 3
for i = 1:length(set);
    if set(1,2,i) + set(1,3,i) > set(2,2,i) + set(2,3,i);
        strategy9(i) = 1;
    elseif set(1,2,i) + set(1,3,i) > set(2,2,i) + set(2,3,i);
        strategy9(i) = 2;
    elseif set(1,2,i) + set(1,3,i) == set(2,2,i) + set(2,3,i);
        strategy9(i) = 0;
    end
end

strategy.threeItemGARP1323.strategy9 = strategy9;
save('strategy.mat','strategy');

%%
cd('../');
clearvars -except 'subjects', 'folder';


end