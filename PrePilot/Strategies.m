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

mystrategy1 = zeros(length(set),1);
for i = 1:length(set);
    if strategy1(i) == 1 && choice(i,1) == 1;
        mystrategy1(i) = 0;
    elseif strategy1(i) == 1 && choice(i,1) == 2;
        mystrategy1(i) = 1;
    elseif strategy1(i) == 2 && choice(i,1) == 1;
        mystrategy1(i) = 1;
    elseif strategy1(i) == 2 && choice(i,1) == 2;
        mystrategy1(i) = 0;
    elseif strategy1(i) == 0 && choice(i,1) == 1;
        mystrategy1(i) = 0;
    elseif strategy1(i) == 0 && choice(i,1) == 2;
        mystrategy1(i) = 0;
    end
end

strategy.limitGARP.mystrategy1 = mystrategy1;
save('strategy.mat','strategy');
strategy1deviation = nnz(strategy.limitGARP.mystrategy1);

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

mystrategy2 = zeros(length(set),1);
for i = 1:length(set);
    if strategy2(i) == 1 && choice(i,1) == 1;
        mystrategy2(i) = 0;
    elseif strategy2(i) == 1 && choice(i,1) == 2;
        mystrategy2(i) = 1;
    elseif strategy2(i) == 2 && choice(i,1) == 1;
        mystrategy2(i) = 1;
    elseif strategy2(i) == 2 && choice(i,1) == 2;
        mystrategy2(i) = 0;
    elseif strategy2(i) == 0 && choice(i,1) == 1;
        mystrategy2(i) = 0;
    elseif strategy2(i) == 0 && choice(i,1) == 2;
        mystrategy2(i) = 0;
    end
end

strategy.limitGARP.mystrategy2 = mystrategy2;
save('strategy.mat','strategy');
strategy2deviation = nnz(strategy.limitGARP.mystrategy2);

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

mystrategy3 = zeros(length(set),1);
for i = 1:length(set);
    if strategy3(i) == 1 && choice(i,1) == 1;
        mystrategy3(i) = 0;
    elseif strategy3(i) == 1 && choice(i,1) == 2;
        mystrategy3(i) = 1;
    elseif strategy3(i) == 2 && choice(i,1) == 1;
        mystrategy3(i) = 1;
    elseif strategy3(i) == 2 && choice(i,1) == 2;
        mystrategy3(i) = 0;
    elseif strategy3(i) == 0 && choice(i,1) == 1;
        mystrategy3(i) = 0;
    elseif strategy3(i) == 0 && choice(i,1) == 2;
        mystrategy3(i) = 0;
    end
end

strategy.limitGARP.mystrategy3 = mystrategy3;
save('strategy.mat','strategy');
strategy3deviation = nnz(strategy.limitGARP.mystrategy3);

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

mystrategy4 = zeros(length(set),1);
for i = 1:length(set);
    if strategy4(i) == 1 && choice(i,1) == 1;
        mystrategy4(i) = 0;
    elseif strategy4(i) == 1 && choice(i,1) == 2;
        mystrategy4(i) = 1;
    elseif strategy4(i) == 2 && choice(i,1) == 1;
        mystrategy4(i) = 1;
    elseif strategy4(i) == 2 && choice(i,1) == 2;
        mystrategy4(i) = 0;
    elseif strategy4(i) == 0 && choice(i,1) == 1;
        mystrategy4(i) = 0;
    elseif strategy4(i) == 0 && choice(i,1) == 2;
        mystrategy4(i) = 0;
    end
end

strategy.limitGARP.mystrategy4 = mystrategy4;
save('strategy.mat','strategy');
strategy4deviation = nnz(strategy.limitGARP.mystrategy4);

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

mystrategy5 = zeros(length(set),1);
for i = 1:length(set);
    if strategy5(i) == 1 && choice(i,1) == 1;
        mystrategy5(i) = 0;
    elseif strategy5(i) == 1 && choice(i,1) == 2;
        mystrategy5(i) = 1;
    elseif strategy5(i) == 2 && choice(i,1) == 1;
        mystrategy5(i) = 1;
    elseif strategy5(i) == 2 && choice(i,1) == 2;
        mystrategy5(i) = 0;
    elseif strategy5(i) == 0 && choice(i,1) == 1;
        mystrategy5(i) = 0;
    elseif strategy5(i) == 0 && choice(i,1) == 2;
        mystrategy5(i) = 0;
    end
end

strategy.limitGARP.mystrategy5 = mystrategy5;
save('strategy.mat','strategy');
strategy5deviation = nnz(strategy.limitGARP.mystrategy5);

mindeviation = min([strategy1deviation, strategy2deviation, strategy3deviation, strategy4deviation, strategy5deviation]);
if mindeviation == strategy1deviation;
    heuristic = 'strategy1';
    deviation = strategy1deviation;
elseif mindeviation == strategy2deviation;
    heuristic = 'strategy2';
    deviation = strategy2deviation;
elseif mindeviation == strategy3deviation;
    heuristic = 'strategy3';
    deviation = strategy3deviation;
elseif mindeviation == strategy4deviation;
    heuristic = 'strategy4';
    deviation = strategy4deviation;
elseif mindeviation == strategy5deviation;
    heuristic = 'strategy5';
    deviation = strategy5deviation;
end

strategy.limitGARP.heuristic = heuristic;
strategy.limitGARP.deviation = deviation;
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

mystrategy1 = zeros(length(set),1);
for i = 1:length(set);
    if strategy1(i) == 1 && choice(i,1) == 1;
        mystrategy1(i) = 0;
    elseif strategy1(i) == 1 && choice(i,1) == 2;
        mystrategy1(i) = 1;
    elseif strategy1(i) == 2 && choice(i,1) == 1;
        mystrategy1(i) = 1;
    elseif strategy1(i) == 2 && choice(i,1) == 2;
        mystrategy1(i) = 0;
    elseif strategy1(i) == 0 && choice(i,1) == 1;
        mystrategy1(i) = 0;
    elseif strategy1(i) == 0 && choice(i,1) == 2;
        mystrategy1(i) = 0;
    end
end

strategy.twoItemGARP.mystrategy1 = mystrategy1;
save('strategy.mat','strategy');
strategy1deviation = nnz(strategy.twoItemGARP.mystrategy1);

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

mystrategy2 = zeros(length(set),1);
for i = 1:length(set);
    if strategy2(i) == 1 && choice(i,1) == 1;
        mystrategy2(i) = 0;
    elseif strategy2(i) == 1 && choice(i,1) == 2;
        mystrategy2(i) = 1;
    elseif strategy2(i) == 2 && choice(i,1) == 1;
        mystrategy2(i) = 1;
    elseif strategy2(i) == 2 && choice(i,1) == 2;
        mystrategy2(i) = 0;
    elseif strategy2(i) == 0 && choice(i,1) == 1;
        mystrategy2(i) = 0;
    elseif strategy2(i) == 0 && choice(i,1) == 2;
        mystrategy2(i) = 0;
    end
end

strategy.twoItemGARP.mystrategy2 = mystrategy2;
save('strategy.mat','strategy');
strategy2deviation = nnz(strategy.twoItemGARP.mystrategy2);

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

mystrategy3 = zeros(length(set),1);
for i = 1:length(set);
    if strategy3(i) == 1 && choice(i,1) == 1;
        mystrategy3(i) = 0;
    elseif strategy3(i) == 1 && choice(i,1) == 2;
        mystrategy3(i) = 1;
    elseif strategy3(i) == 2 && choice(i,1) == 1;
        mystrategy3(i) = 1;
    elseif strategy3(i) == 2 && choice(i,1) == 2;
        mystrategy3(i) = 0;
    elseif strategy3(i) == 0 && choice(i,1) == 1;
        mystrategy3(i) = 0;
    elseif strategy3(i) == 0 && choice(i,1) == 2;
        mystrategy3(i) = 0;
    end
end

strategy.twoItemGARP.mystrategy3 = mystrategy3;
save('strategy.mat','strategy');
strategy3deviation = nnz(strategy.twoItemGARP.mystrategy3);

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

mystrategy4 = zeros(length(set),1);
for i = 1:length(set);
    if strategy4(i) == 1 && choice(i,1) == 1;
        mystrategy4(i) = 0;
    elseif strategy4(i) == 1 && choice(i,1) == 2;
        mystrategy4(i) = 1;
    elseif strategy4(i) == 2 && choice(i,1) == 1;
        mystrategy4(i) = 1;
    elseif strategy4(i) == 2 && choice(i,1) == 2;
        mystrategy4(i) = 0;
    elseif strategy4(i) == 0 && choice(i,1) == 1;
        mystrategy4(i) = 0;
    elseif strategy4(i) == 0 && choice(i,1) == 2;
        mystrategy4(i) = 0;
    end
end

strategy.twoItemGARP.mystrategy4 = mystrategy4;
save('strategy.mat','strategy');
strategy4deviation = nnz(strategy.twoItemGARP.mystrategy4);

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

mystrategy5 = zeros(length(set),1);
for i = 1:length(set);
    if strategy5(i) == 1 && choice(i,1) == 1;
        mystrategy5(i) = 0;
    elseif strategy5(i) == 1 && choice(i,1) == 2;
        mystrategy5(i) = 1;
    elseif strategy5(i) == 2 && choice(i,1) == 1;
        mystrategy5(i) = 1;
    elseif strategy5(i) == 2 && choice(i,1) == 2;
        mystrategy5(i) = 0;
    elseif strategy5(i) == 0 && choice(i,1) == 1;
        mystrategy5(i) = 0;
    elseif strategy5(i) == 0 && choice(i,1) == 2;
        mystrategy5(i) = 0;
    end
end

strategy.twoItemGARP.mystrategy5 = mystrategy5;
save('strategy.mat','strategy');
strategy5deviation = nnz(strategy.twoItemGARP.mystrategy5);

mindeviation = min([strategy1deviation, strategy2deviation, strategy3deviation, strategy4deviation, strategy5deviation]);
if mindeviation == strategy1deviation;
    heuristic = 'strategy1';
    deviation = strategy1deviation;
elseif mindeviation == strategy2deviation;
    heuristic = 'strategy2';
    deviation = strategy2deviation;
elseif mindeviation == strategy3deviation;
    heuristic = 'strategy3';
    deviation = strategy3deviation;
elseif mindeviation == strategy4deviation;
    heuristic = 'strategy4';
    deviation = strategy4deviation;
elseif mindeviation == strategy5deviation;
    heuristic = 'strategy5';
    deviation = strategy5deviation;
end

strategy.twoItemGARP.heuristic = heuristic;
strategy.twoItemGARP.deviation = deviation;
save('strategy.mat','strategy');

%% FOR THREE ITEM 1213 TASKS
set = preProcessed.threeItemGARP1213.revtasks;
choice = preProcessed.threeItemGARP1213.choices;

%%%% Strategy1: Maximizing Absolutely
strategy1 = zeros(length(set),1);
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

mystrategy1 = zeros(length(set),1);
for i = 1:length(set);
    if strategy1(i) == 1 && choice(i,1) == 1;
        mystrategy1(i) = 0;
    elseif strategy1(i) == 1 && choice(i,1) == 2;
        mystrategy1(i) = 1;
    elseif strategy1(i) == 2 && choice(i,1) == 1;
        mystrategy1(i) = 1;
    elseif strategy1(i) == 2 && choice(i,1) == 2;
        mystrategy1(i) = 0;
    elseif strategy1(i) == 0 && choice(i,1) == 1;
        mystrategy1(i) = 0;
    elseif strategy1(i) == 0 && choice(i,1) == 2;
        mystrategy1(i) = 0;
    end
end

strategy.threeItemGARP1213.mystrategy1 = mystrategy1;
save('strategy.mat','strategy');
strategy1deviation = nnz(strategy.threeItemGARP1213.mystrategy1);

%%%% Strategy2: Maximizing Item 1 
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

strategy.threeItemGARP1213.strategy2 = strategy2;
save('strategy.mat','strategy');

mystrategy2 = zeros(length(set),1);
for i = 1:length(set);
    if strategy2(i) == 1 && choice(i,1) == 1;
        mystrategy2(i) = 0;
    elseif strategy2(i) == 1 && choice(i,1) == 2;
        mystrategy2(i) = 1;
    elseif strategy2(i) == 2 && choice(i,1) == 1;
        mystrategy2(i) = 1;
    elseif strategy2(i) == 2 && choice(i,1) == 2;
        mystrategy2(i) = 0;
    elseif strategy2(i) == 0 && choice(i,1) == 1;
        mystrategy2(i) = 0;
    elseif strategy2(i) == 0 && choice(i,1) == 2;
        mystrategy2(i) = 0;
    end
end

strategy.threeItemGARP1213.mystrategy2 = mystrategy2;
save('strategy.mat','strategy');
strategy2deviation = nnz(strategy.threeItemGARP1213.mystrategy2);

%%%% Strategy3: Maximizing Item 2 
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

strategy.threeItemGARP1213.strategy3 = strategy3;
save('strategy.mat','strategy');

mystrategy3 = zeros(length(set),1);
for i = 1:length(set);
    if strategy3(i) == 1 && choice(i,1) == 1;
        mystrategy3(i) = 0;
    elseif strategy3(i) == 1 && choice(i,1) == 2;
        mystrategy3(i) = 1;
    elseif strategy3(i) == 2 && choice(i,1) == 1;
        mystrategy3(i) = 1;
    elseif strategy3(i) == 2 && choice(i,1) == 2;
        mystrategy3(i) = 0;
    elseif strategy3(i) == 0 && choice(i,1) == 1;
        mystrategy3(i) = 0;
    elseif strategy3(i) == 0 && choice(i,1) == 2;
        mystrategy3(i) = 0;
    end
end

strategy.threeItemGARP1213.mystrategy3 = mystrategy3;
save('strategy.mat','strategy');
strategy3deviation = nnz(strategy.threeItemGARP1213.mystrategy3);

%%%% Strategy4: Minimizing Absolutely
strategy4 = zeros(length(set),1);
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

mystrategy4 = zeros(length(set),1);
for i = 1:length(set);
    if strategy4(i) == 1 && choice(i,1) == 1;
        mystrategy4(i) = 0;
    elseif strategy4(i) == 1 && choice(i,1) == 2;
        mystrategy4(i) = 1;
    elseif strategy4(i) == 2 && choice(i,1) == 1;
        mystrategy4(i) = 1;
    elseif strategy4(i) == 2 && choice(i,1) == 2;
        mystrategy4(i) = 0;
    elseif strategy4(i) == 0 && choice(i,1) == 1;
        mystrategy4(i) = 0;
    elseif strategy4(i) == 0 && choice(i,1) == 2;
        mystrategy4(i) = 0;
    end
end

strategy.threeItemGARP1213.mystrategy4 = mystrategy4;
save('strategy.mat','strategy');
strategy4deviation = nnz(strategy.threeItemGARP1213.mystrategy4);

%%%% Strategy5: Equalizing
strategy5 = zeros(length(set),1);
for i = 1:length(set);
    if abs(set(1,1,i) - set(1,2,i)) > abs(set(2,1,i) - set(2,3,i));
        strategy5(i) = 2;
    elseif abs(set(1,1,i) - set(1,2,i)) < abs(set(2,1,i) - set(2,3,i));
        strategy5(i) = 1;
    elseif abs(set(1,1,i) - set(1,2,i)) == abs(set(2,1,i) - set(2,3,i));
        strategy5(i) = 0;
    end 
end

strategy.threeItemGARP1213.strategy5 = strategy5;
save('strategy.mat','strategy');

mystrategy5 = zeros(length(set),1);
for i = 1:length(set);
    if strategy5(i) == 1 && choice(i,1) == 1;
        mystrategy5(i) = 0;
    elseif strategy5(i) == 1 && choice(i,1) == 2;
        mystrategy5(i) = 1;
    elseif strategy5(i) == 2 && choice(i,1) == 1;
        mystrategy5(i) = 1;
    elseif strategy5(i) == 2 && choice(i,1) == 2;
        mystrategy5(i) = 0;
    elseif strategy5(i) == 0 && choice(i,1) == 1;
        mystrategy5(i) = 0;
    elseif strategy5(i) == 0 && choice(i,1) == 2;
        mystrategy5(i) = 0;
    end
end

strategy.threeItemGARP1213.mystrategy5 = mystrategy5;
save('strategy.mat','strategy');
strategy5deviation = nnz(strategy.threeItemGARP1213.mystrategy5);

%%%% Strategy6: Maximizing Item 3
strategy6 = zeros(length(set),1);
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

mystrategy6 = zeros(length(set),1);
for i = 1:length(set);
    if strategy6(i) == 1 && choice(i,1) == 1;
        mystrategy6(i) = 0;
    elseif strategy6(i) == 1 && choice(i,1) == 2;
        mystrategy6(i) = 1;
    elseif strategy6(i) == 2 && choice(i,1) == 1;
        mystrategy6(i) = 1;
    elseif strategy6(i) == 2 && choice(i,1) == 2;
        mystrategy6(i) = 0;
    elseif strategy6(i) == 0 && choice(i,1) == 1;
        mystrategy6(i) = 0;
    elseif strategy6(i) == 0 && choice(i,1) == 2;
        mystrategy6(i) = 0;
    end
end

strategy.threeItemGARP1213.mystrategy6 = mystrategy6;
save('strategy.mat','strategy');
strategy6deviation = nnz(strategy.threeItemGARP1213.mystrategy6);

%%%% Strategy7: Maximizing Item 1 + Item 2
strategy7 = zeros(length(set),1);
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

mystrategy7 = zeros(length(set),1);
for i = 1:length(set);
    if strategy7(i) == 1 && choice(i,1) == 1;
        mystrategy7(i) = 0;
    elseif strategy7(i) == 1 && choice(i,1) == 2;
        mystrategy7(i) = 1;
    elseif strategy7(i) == 2 && choice(i,1) == 1;
        mystrategy7(i) = 1;
    elseif strategy7(i) == 2 && choice(i,1) == 2;
        mystrategy7(i) = 0;
    elseif strategy7(i) == 0 && choice(i,1) == 1;
        mystrategy7(i) = 0;
    elseif strategy7(i) == 0 && choice(i,1) == 2;
        mystrategy7(i) = 0;
    end
end

strategy.threeItemGARP1213.mystrategy7 = mystrategy7;
save('strategy.mat','strategy');
strategy7deviation = nnz(strategy.threeItemGARP1213.mystrategy7);

%%%% Strategy8: Maximizing Item 1 + Item 3
strategy8 = zeros(length(set),1);
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

mystrategy8 = zeros(length(set),1);
for i = 1:length(set);
    if strategy8(i) == 1 && choice(i,1) == 1;
        mystrategy8(i) = 0;
    elseif strategy8(i) == 1 && choice(i,1) == 2;
        mystrategy8(i) = 1;
    elseif strategy8(i) == 2 && choice(i,1) == 1;
        mystrategy8(i) = 1;
    elseif strategy8(i) == 2 && choice(i,1) == 2;
        mystrategy8(i) = 0;
    elseif strategy8(i) == 0 && choice(i,1) == 1;
        mystrategy8(i) = 0;
    elseif strategy8(i) == 0 && choice(i,1) == 2;
        mystrategy8(i) = 0;
    end
end

strategy.threeItemGARP1213.mystrategy8 = mystrategy8;
save('strategy.mat','strategy');
strategy8deviation = nnz(strategy.threeItemGARP1213.mystrategy8);

%%%% Strategy9: Maximizing Item 2 + Item 3
strategy9 = zeros(length(set),1);
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

mystrategy9 = zeros(length(set),1);
for i = 1:length(set);
    if strategy9(i) == 1 && choice(i,1) == 1;
        mystrategy9(i) = 0;
    elseif strategy9(i) == 1 && choice(i,1) == 2;
        mystrategy9(i) = 1;
    elseif strategy9(i) == 2 && choice(i,1) == 1;
        mystrategy9(i) = 1;
    elseif strategy9(i) == 2 && choice(i,1) == 2;
        mystrategy9(i) = 0;
    elseif strategy9(i) == 0 && choice(i,1) == 1;
        mystrategy9(i) = 0;
    elseif strategy9(i) == 0 && choice(i,1) == 2;
        mystrategy9(i) = 0;
    end
end

strategy.threeItemGARP1213.mystrategy9 = mystrategy9;
save('strategy.mat','strategy');
strategy9deviation = nnz(strategy.threeItemGARP1213.mystrategy9);

mindeviation = min([strategy1deviation, strategy2deviation, strategy3deviation, strategy4deviation, strategy5deviation]);
if mindeviation == strategy1deviation;
    heuristic = 'strategy1';
    deviation = strategy1deviation;
elseif mindeviation == strategy2deviation;
    heuristic = 'strategy2';
    deviation = strategy2deviation;
elseif mindeviation == strategy3deviation;
    heuristic = 'strategy3';
    deviation = strategy3deviation;
elseif mindeviation == strategy4deviation;
    heuristic = 'strategy4';
    deviation = strategy4deviation;
elseif mindeviation == strategy5deviation;
    heuristic = 'strategy5';
    deviation = strategy5deviation;
elseif mindeviation == strategy6deviation;
    heuristic = 'strategy6';
    deviation = strategy6deviation;
elseif mindeviation == strategy7deviation;
    heuristic = 'strategy7';
    deviation = strategy7deviation;
elseif mindeviation == strategy8deviation;
    heuristic = 'strategy8';
    deviation = strategy8deviation;
elseif mindeviation == strategy9deviation;
    heuristic = 'strategy9';
    deviation = strategy9deviation;
end

strategy.threeItemGARP1213.heuristic = heuristic;
strategy.threeItemGARP1213.deviation = deviation;
save('strategy.mat','strategy');

%% FOR THREE ITEM 1223 TASKS
set = preProcessed.threeItemGARP1223.revtasks;
choice = preProcessed.threeItemGARP1223.choices;

%%%% Strategy1: Maximizing Absolutely
strategy1 = zeros(length(set),1);
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

mystrategy1 = zeros(length(set),1);
for i = 1:length(set);
    if strategy1(i) == 1 && choice(i,1) == 1;
        mystrategy1(i) = 0;
    elseif strategy1(i) == 1 && choice(i,1) == 2;
        mystrategy1(i) = 1;
    elseif strategy1(i) == 2 && choice(i,1) == 1;
        mystrategy1(i) = 1;
    elseif strategy1(i) == 2 && choice(i,1) == 2;
        mystrategy1(i) = 0;
    elseif strategy1(i) == 0 && choice(i,1) == 1;
        mystrategy1(i) = 0;
    elseif strategy1(i) == 0 && choice(i,1) == 2;
        mystrategy1(i) = 0;
    end
end

strategy.threeItemGARP1223.mystrategy1 = mystrategy1;
save('strategy.mat','strategy');
strategy1deviation = nnz(strategy.threeItemGARP1223.mystrategy1);

%%%% Strategy2: Maximizing Item 1 
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

strategy.threeItemGARP1223.strategy2 = strategy2;
save('strategy.mat','strategy');

mystrategy2 = zeros(length(set),1);
for i = 1:length(set);
    if strategy2(i) == 1 && choice(i,1) == 1;
        mystrategy2(i) = 0;
    elseif strategy2(i) == 1 && choice(i,1) == 2;
        mystrategy2(i) = 1;
    elseif strategy2(i) == 2 && choice(i,1) == 1;
        mystrategy2(i) = 1;
    elseif strategy2(i) == 2 && choice(i,1) == 2;
        mystrategy2(i) = 0;
    elseif strategy2(i) == 0 && choice(i,1) == 1;
        mystrategy2(i) = 0;
    elseif strategy2(i) == 0 && choice(i,1) == 2;
        mystrategy2(i) = 0;
    end
end

strategy.threeItemGARP1223.mystrategy2 = mystrategy2;
save('strategy.mat','strategy');
strategy2deviation = nnz(strategy.threeItemGARP1223.mystrategy2);

%%%% Strategy3: Maximizing Item 2 
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

strategy.threeItemGARP1223.strategy3 = strategy3;
save('strategy.mat','strategy');

mystrategy3 = zeros(length(set),1);
for i = 1:length(set);
    if strategy3(i) == 1 && choice(i,1) == 1;
        mystrategy3(i) = 0;
    elseif strategy3(i) == 1 && choice(i,1) == 2;
        mystrategy3(i) = 1;
    elseif strategy3(i) == 2 && choice(i,1) == 1;
        mystrategy3(i) = 1;
    elseif strategy3(i) == 2 && choice(i,1) == 2;
        mystrategy3(i) = 0;
    elseif strategy3(i) == 0 && choice(i,1) == 1;
        mystrategy3(i) = 0;
    elseif strategy3(i) == 0 && choice(i,1) == 2;
        mystrategy3(i) = 0;
    end
end

strategy.threeItemGARP1223.mystrategy3 = mystrategy3;
save('strategy.mat','strategy');
strategy3deviation = nnz(strategy.threeItemGARP1223.mystrategy3);

%%%% Strategy4: Minimizing Absolutely
strategy4 = zeros(length(set),1);
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

mystrategy4 = zeros(length(set),1);
for i = 1:length(set);
    if strategy4(i) == 1 && choice(i,1) == 1;
        mystrategy4(i) = 0;
    elseif strategy4(i) == 1 && choice(i,1) == 2;
        mystrategy4(i) = 1;
    elseif strategy4(i) == 2 && choice(i,1) == 1;
        mystrategy4(i) = 1;
    elseif strategy4(i) == 2 && choice(i,1) == 2;
        mystrategy4(i) = 0;
    elseif strategy4(i) == 0 && choice(i,1) == 1;
        mystrategy4(i) = 0;
    elseif strategy4(i) == 0 && choice(i,1) == 2;
        mystrategy4(i) = 0;
    end
end

strategy.threeItemGARP1223.mystrategy4 = mystrategy4;
save('strategy.mat','strategy');
strategy4deviation = nnz(strategy.threeItemGARP1223.mystrategy4);

%%%% Strategy5: Equalizing
strategy5 = zeros(length(set),1);
for i = 1:length(set);
    if abs(set(1,1,i) - set(1,2,i)) > abs(set(2,2,i) - set(2,3,i));
        strategy5(i) = 2;
    elseif abs(set(1,1,i) - set(1,2,i)) < abs(set(2,2,i) - set(2,3,i));
        strategy5(i) = 1;
    elseif abs(set(1,1,i) - set(1,2,i)) == abs(set(2,2,i) - set(2,3,i));
        strategy5(i) = 0;
    end 
end

strategy.threeItemGARP1223.strategy5 = strategy5;
save('strategy.mat','strategy');

mystrategy5 = zeros(length(set),1);
for i = 1:length(set);
    if strategy5(i) == 1 && choice(i,1) == 1;
        mystrategy5(i) = 0;
    elseif strategy5(i) == 1 && choice(i,1) == 2;
        mystrategy5(i) = 1;
    elseif strategy5(i) == 2 && choice(i,1) == 1;
        mystrategy5(i) = 1;
    elseif strategy5(i) == 2 && choice(i,1) == 2;
        mystrategy5(i) = 0;
    elseif strategy5(i) == 0 && choice(i,1) == 1;
        mystrategy5(i) = 0;
    elseif strategy5(i) == 0 && choice(i,1) == 2;
        mystrategy5(i) = 0;
    end
end

strategy.threeItemGARP1223.mystrategy5 = mystrategy5;
save('strategy.mat','strategy');
strategy5deviation = nnz(strategy.threeItemGARP1223.mystrategy5);

%%%% Strategy6: Maximizing Item 3
strategy6 = zeros(length(set),1);
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

mystrategy6 = zeros(length(set),1);
for i = 1:length(set);
    if strategy6(i) == 1 && choice(i,1) == 1;
        mystrategy6(i) = 0;
    elseif strategy6(i) == 1 && choice(i,1) == 2;
        mystrategy6(i) = 1;
    elseif strategy6(i) == 2 && choice(i,1) == 1;
        mystrategy6(i) = 1;
    elseif strategy6(i) == 2 && choice(i,1) == 2;
        mystrategy6(i) = 0;
    elseif strategy6(i) == 0 && choice(i,1) == 1;
        mystrategy6(i) = 0;
    elseif strategy6(i) == 0 && choice(i,1) == 2;
        mystrategy6(i) = 0;
    end
end

strategy.threeItemGARP1223.mystrategy6 = mystrategy6;
save('strategy.mat','strategy');
strategy6deviation = nnz(strategy.threeItemGARP1223.mystrategy6);

%%%% Strategy7: Maximizing Item 1 + Item 2
strategy7 = zeros(length(set),1);
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

mystrategy7 = zeros(length(set),1);
for i = 1:length(set);
    if strategy7(i) == 1 && choice(i,1) == 1;
        mystrategy7(i) = 0;
    elseif strategy7(i) == 1 && choice(i,1) == 2;
        mystrategy7(i) = 1;
    elseif strategy7(i) == 2 && choice(i,1) == 1;
        mystrategy7(i) = 1;
    elseif strategy7(i) == 2 && choice(i,1) == 2;
        mystrategy7(i) = 0;
    elseif strategy7(i) == 0 && choice(i,1) == 1;
        mystrategy7(i) = 0;
    elseif strategy7(i) == 0 && choice(i,1) == 2;
        mystrategy7(i) = 0;
    end
end

strategy.threeItemGARP1223.mystrategy7 = mystrategy7;
save('strategy.mat','strategy');
strategy7deviation = nnz(strategy.threeItemGARP1223.mystrategy7);

%%%% Strategy8: Maximizing Item 1 + Item 3
strategy8 = zeros(length(set),1);
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

mystrategy8 = zeros(length(set),1);
for i = 1:length(set);
    if strategy8(i) == 1 && choice(i,1) == 1;
        mystrategy8(i) = 0;
    elseif strategy8(i) == 1 && choice(i,1) == 2;
        mystrategy8(i) = 1;
    elseif strategy8(i) == 2 && choice(i,1) == 1;
        mystrategy8(i) = 1;
    elseif strategy8(i) == 2 && choice(i,1) == 2;
        mystrategy8(i) = 0;
    elseif strategy8(i) == 0 && choice(i,1) == 1;
        mystrategy8(i) = 0;
    elseif strategy8(i) == 0 && choice(i,1) == 2;
        mystrategy8(i) = 0;
    end
end

strategy.threeItemGARP1223.mystrategy8 = mystrategy8;
save('strategy.mat','strategy');
strategy8deviation = nnz(strategy.threeItemGARP1223.mystrategy8);

%%%% Strategy9: Maximizing Item 2 + Item 3
strategy9 = zeros(length(set),1);
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

mystrategy9 = zeros(length(set),1);
for i = 1:length(set);
    if strategy9(i) == 1 && choice(i,1) == 1;
        mystrategy9(i) = 0;
    elseif strategy9(i) == 1 && choice(i,1) == 2;
        mystrategy9(i) = 1;
    elseif strategy9(i) == 2 && choice(i,1) == 1;
        mystrategy9(i) = 1;
    elseif strategy9(i) == 2 && choice(i,1) == 2;
        mystrategy9(i) = 0;
    elseif strategy9(i) == 0 && choice(i,1) == 1;
        mystrategy9(i) = 0;
    elseif strategy9(i) == 0 && choice(i,1) == 2;
        mystrategy9(i) = 0;
    end
end

strategy.threeItemGARP1223.mystrategy9 = mystrategy9;
save('strategy.mat','strategy');
strategy9deviation = nnz(strategy.threeItemGARP1223.mystrategy9);

mindeviation = min([strategy1deviation, strategy2deviation, strategy3deviation, strategy4deviation, strategy5deviation]);
if mindeviation == strategy1deviation;
    heuristic = 'strategy1';
    deviation = strategy1deviation;
elseif mindeviation == strategy2deviation;
    heuristic = 'strategy2';
    deviation = strategy2deviation;
elseif mindeviation == strategy3deviation;
    heuristic = 'strategy3';
    deviation = strategy3deviation;
elseif mindeviation == strategy4deviation;
    heuristic = 'strategy4';
    deviation = strategy4deviation;
elseif mindeviation == strategy5deviation;
    heuristic = 'strategy5';
    deviation = strategy5deviation;
elseif mindeviation == strategy6deviation;
    heuristic = 'strategy6';
    deviation = strategy6deviation;
elseif mindeviation == strategy7deviation;
    heuristic = 'strategy7';
    deviation = strategy7deviation;
elseif mindeviation == strategy8deviation;
    heuristic = 'strategy8';
    deviation = strategy8deviation;
elseif mindeviation == strategy9deviation;
    heuristic = 'strategy9';
    deviation = strategy9deviation;
end

strategy.threeItemGARP1223.heuristic = heuristic;
strategy.threeItemGARP1223.deviation = deviation;
save('strategy.mat','strategy');

%% FOR THREE ITEM 1323 TASKS
set = preProcessed.threeItemGARP1323.revtasks;
choice = preProcessed.threeItemGARP1323.choices;

%%%% Strategy1: Maximizing Absolutely
strategy1 = zeros(length(set),1);
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

mystrategy1 = zeros(length(set),1);
for i = 1:length(set);
    if strategy1(i) == 1 && choice(i,1) == 1;
        mystrategy1(i) = 0;
    elseif strategy1(i) == 1 && choice(i,1) == 2;
        mystrategy1(i) = 1;
    elseif strategy1(i) == 2 && choice(i,1) == 1;
        mystrategy1(i) = 1;
    elseif strategy1(i) == 2 && choice(i,1) == 2;
        mystrategy1(i) = 0;
    elseif strategy1(i) == 0 && choice(i,1) == 1;
        mystrategy1(i) = 0;
    elseif strategy1(i) == 0 && choice(i,1) == 2;
        mystrategy1(i) = 0;
    end
end

strategy.threeItemGARP1323.mystrategy1 = mystrategy1;
save('strategy.mat','strategy');
strategy1deviation = nnz(strategy.threeItemGARP1323.mystrategy1);

%%%% Strategy2: Maximizing Item 1 
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

strategy.threeItemGARP1323.strategy2 = strategy2;
save('strategy.mat','strategy');

mystrategy2 = zeros(length(set),1);
for i = 1:length(set);
    if strategy2(i) == 1 && choice(i,1) == 1;
        mystrategy2(i) = 0;
    elseif strategy2(i) == 1 && choice(i,1) == 2;
        mystrategy2(i) = 1;
    elseif strategy2(i) == 2 && choice(i,1) == 1;
        mystrategy2(i) = 1;
    elseif strategy2(i) == 2 && choice(i,1) == 2;
        mystrategy2(i) = 0;
    elseif strategy2(i) == 0 && choice(i,1) == 1;
        mystrategy2(i) = 0;
    elseif strategy2(i) == 0 && choice(i,1) == 2;
        mystrategy2(i) = 0;
    end
end

strategy.threeItemGARP1323.mystrategy2 = mystrategy2;
save('strategy.mat','strategy');
strategy2deviation = nnz(strategy.threeItemGARP1323.mystrategy2);

%%%% Strategy3: Maximizing Item 2 
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

strategy.threeItemGARP1323.strategy3 = strategy3;
save('strategy.mat','strategy');

mystrategy3 = zeros(length(set),1);
for i = 1:length(set);
    if strategy3(i) == 1 && choice(i,1) == 1;
        mystrategy3(i) = 0;
    elseif strategy3(i) == 1 && choice(i,1) == 2;
        mystrategy3(i) = 1;
    elseif strategy3(i) == 2 && choice(i,1) == 1;
        mystrategy3(i) = 1;
    elseif strategy3(i) == 2 && choice(i,1) == 2;
        mystrategy3(i) = 0;
    elseif strategy3(i) == 0 && choice(i,1) == 1;
        mystrategy3(i) = 0;
    elseif strategy3(i) == 0 && choice(i,1) == 2;
        mystrategy3(i) = 0;
    end
end

strategy.threeItemGARP1323.mystrategy3 = mystrategy3;
save('strategy.mat','strategy');
strategy3deviation = nnz(strategy.threeItemGARP1323.mystrategy3);

%%%% Strategy4: Minimizing Absolutely
strategy4 = zeros(length(set),1);
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

mystrategy4 = zeros(length(set),1);
for i = 1:length(set);
    if strategy4(i) == 1 && choice(i,1) == 1;
        mystrategy4(i) = 0;
    elseif strategy4(i) == 1 && choice(i,1) == 2;
        mystrategy4(i) = 1;
    elseif strategy4(i) == 2 && choice(i,1) == 1;
        mystrategy4(i) = 1;
    elseif strategy4(i) == 2 && choice(i,1) == 2;
        mystrategy4(i) = 0;
    elseif strategy4(i) == 0 && choice(i,1) == 1;
        mystrategy4(i) = 0;
    elseif strategy4(i) == 0 && choice(i,1) == 2;
        mystrategy4(i) = 0;
    end
end

strategy.threeItemGARP1323.mystrategy4 = mystrategy4;
save('strategy.mat','strategy');
strategy4deviation = nnz(strategy.threeItemGARP1323.mystrategy4);

%%%% Strategy5: Equalizing
strategy5 = zeros(length(set),1);
for i = 1:length(set);
    if abs(set(1,1,i) - set(1,3,i)) > abs(set(2,2,i) - set(2,3,i));
        strategy5(i) = 2;
    elseif abs(set(1,1,i) - set(1,3,i)) < abs(set(2,2,i) - set(2,3,i));
        strategy5(i) = 1;
    elseif abs(set(1,1,i) - set(1,3,i)) == abs(set(2,2,i) - set(2,3,i));
        strategy5(i) = 0;
    end 
end

strategy.threeItemGARP1323.strategy5 = strategy5;
save('strategy.mat','strategy');

mystrategy5 = zeros(length(set),1);
for i = 1:length(set);
    if strategy5(i) == 1 && choice(i,1) == 1;
        mystrategy5(i) = 0;
    elseif strategy5(i) == 1 && choice(i,1) == 2;
        mystrategy5(i) = 1;
    elseif strategy5(i) == 2 && choice(i,1) == 1;
        mystrategy5(i) = 1;
    elseif strategy5(i) == 2 && choice(i,1) == 2;
        mystrategy5(i) = 0;
    elseif strategy5(i) == 0 && choice(i,1) == 1;
        mystrategy5(i) = 0;
    elseif strategy5(i) == 0 && choice(i,1) == 2;
        mystrategy5(i) = 0;
    end
end

strategy.threeItemGARP1323.mystrategy5 = mystrategy5;
save('strategy.mat','strategy');
strategy5deviation = nnz(strategy.threeItemGARP1323.mystrategy5);

%%%% Strategy6: Maximizing Item 3
strategy6 = zeros(length(set),1);
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

mystrategy6 = zeros(length(set),1);
for i = 1:length(set);
    if strategy6(i) == 1 && choice(i,1) == 1;
        mystrategy6(i) = 0;
    elseif strategy6(i) == 1 && choice(i,1) == 2;
        mystrategy6(i) = 1;
    elseif strategy6(i) == 2 && choice(i,1) == 1;
        mystrategy6(i) = 1;
    elseif strategy6(i) == 2 && choice(i,1) == 2;
        mystrategy6(i) = 0;
    elseif strategy6(i) == 0 && choice(i,1) == 1;
        mystrategy6(i) = 0;
    elseif strategy6(i) == 0 && choice(i,1) == 2;
        mystrategy6(i) = 0;
    end
end

strategy.threeItemGARP1323.mystrategy6 = mystrategy6;
save('strategy.mat','strategy');
strategy6deviation = nnz(strategy.threeItemGARP1323.mystrategy6);

%%%% Strategy7: Maximizing Item 1 + Item 2
strategy7 = zeros(length(set),1);
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

mystrategy7 = zeros(length(set),1);
for i = 1:length(set);
    if strategy7(i) == 1 && choice(i,1) == 1;
        mystrategy7(i) = 0;
    elseif strategy7(i) == 1 && choice(i,1) == 2;
        mystrategy7(i) = 1;
    elseif strategy7(i) == 2 && choice(i,1) == 1;
        mystrategy7(i) = 1;
    elseif strategy7(i) == 2 && choice(i,1) == 2;
        mystrategy7(i) = 0;
    elseif strategy7(i) == 0 && choice(i,1) == 1;
        mystrategy7(i) = 0;
    elseif strategy7(i) == 0 && choice(i,1) == 2;
        mystrategy7(i) = 0;
    end
end

strategy.threeItemGARP1323.mystrategy7 = mystrategy7;
save('strategy.mat','strategy');
strategy7deviation = nnz(strategy.threeItemGARP1323.mystrategy7);

%%%% Strategy8: Maximizing Item 1 + Item 3
strategy8 = zeros(length(set),1);
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

mystrategy8 = zeros(length(set),1);
for i = 1:length(set);
    if strategy8(i) == 1 && choice(i,1) == 1;
        mystrategy8(i) = 0;
    elseif strategy8(i) == 1 && choice(i,1) == 2;
        mystrategy8(i) = 1;
    elseif strategy8(i) == 2 && choice(i,1) == 1;
        mystrategy8(i) = 1;
    elseif strategy8(i) == 2 && choice(i,1) == 2;
        mystrategy8(i) = 0;
    elseif strategy8(i) == 0 && choice(i,1) == 1;
        mystrategy8(i) = 0;
    elseif strategy8(i) == 0 && choice(i,1) == 2;
        mystrategy8(i) = 0;
    end
end

strategy.threeItemGARP1323.mystrategy8 = mystrategy8;
save('strategy.mat','strategy');
strategy8deviation = nnz(strategy.threeItemGARP1323.mystrategy8);

%%%% Strategy9: Maximizing Item 2 + Item 3
strategy9 = zeros(length(set),1);
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

mystrategy9 = zeros(length(set),1);
for i = 1:length(set);
    if strategy9(i) == 1 && choice(i,1) == 1;
        mystrategy9(i) = 0;
    elseif strategy9(i) == 1 && choice(i,1) == 2;
        mystrategy9(i) = 1;
    elseif strategy9(i) == 2 && choice(i,1) == 1;
        mystrategy9(i) = 1;
    elseif strategy9(i) == 2 && choice(i,1) == 2;
        mystrategy9(i) = 0;
    elseif strategy9(i) == 0 && choice(i,1) == 1;
        mystrategy9(i) = 0;
    elseif strategy9(i) == 0 && choice(i,1) == 2;
        mystrategy9(i) = 0;
    end
end

strategy.threeItemGARP1323.mystrategy9 = mystrategy9;
save('strategy.mat','strategy');
strategy9deviation = nnz(strategy.threeItemGARP1323.mystrategy9);

mindeviation = min([strategy1deviation, strategy2deviation, strategy3deviation, strategy4deviation, strategy5deviation]);
if mindeviation == strategy1deviation;
    heuristic = 'strategy1';
    deviation = strategy1deviation;
elseif mindeviation == strategy2deviation;
    heuristic = 'strategy2';
    deviation = strategy2deviation;
elseif mindeviation == strategy3deviation;
    heuristic = 'strategy3';
    deviation = strategy3deviation;
elseif mindeviation == strategy4deviation;
    heuristic = 'strategy4';
    deviation = strategy4deviation;
elseif mindeviation == strategy5deviation;
    heuristic = 'strategy5';
    deviation = strategy5deviation;
elseif mindeviation == strategy6deviation;
    heuristic = 'strategy6';
    deviation = strategy6deviation;
elseif mindeviation == strategy7deviation;
    heuristic = 'strategy7';
    deviation = strategy7deviation;
elseif mindeviation == strategy8deviation;
    heuristic = 'strategy8';
    deviation = strategy8deviation;
elseif mindeviation == strategy9deviation;
    heuristic = 'strategy9';
    deviation = strategy9deviation;
end

strategy.threeItemGARP1323.heuristic = heuristic;
strategy.threeItemGARP1323.deviation = deviation;
save('strategy.mat','strategy');

%%
cd('../');
clearvars -except 'subjects', 'folder';


end