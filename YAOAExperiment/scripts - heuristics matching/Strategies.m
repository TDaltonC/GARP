% cd('/Users/Niree/Documents/GitHub/GARP/prePilot/preProcessedRev/');
cd('/Users/Niree/Documents/GitHub/GARP/YAOAExperiment/preProcessedRev/');
subjects = dir;
for folder = 1:length(subjects)
    if subjects(folder).name(1) == '.';
        continue
    end
    cd(subjects(folder).name);
    load('preProcessed.mat');

%% FOR LIMIT (ONE ITEM) TASKS
set = preProcessed.catch.revtasks;
choice = preProcessed.catch.choices;

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

strategy.catch.strategy1 = strategy1;
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

strategy.catch.mystrategy1 = mystrategy1;
save('strategy.mat','strategy');
strategy1deviation = nnz(strategy.catch.mystrategy1);

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

strategy.catch.strategy2 = strategy2;
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

strategy.catch.mystrategy2 = mystrategy2;
save('strategy.mat','strategy');
strategy2deviation = nnz(strategy.catch.mystrategy2);

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

strategy.catch.strategy3 = strategy3;
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

strategy.catch.mystrategy3 = mystrategy3;
save('strategy.mat','strategy');
strategy3deviation = nnz(strategy.catch.mystrategy3);

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

strategy.catch.strategy4 = strategy4;
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

strategy.catch.mystrategy4 = mystrategy4;
save('strategy.mat','strategy');
strategy4deviation = nnz(strategy.catch.mystrategy4);

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

strategy.catch.strategy5 = strategy5;
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

strategy.catch.mystrategy5 = mystrategy5;
save('strategy.mat','strategy');
strategy5deviation = nnz(strategy.catch.mystrategy5);

mindeviation = min([strategy1deviation, strategy2deviation, strategy3deviation, strategy4deviation, strategy5deviation]);
if mindeviation == strategy1deviation;
    heuristic = 1;
    deviation = strategy1deviation;
elseif mindeviation == strategy2deviation;
    heuristic = 2;
    deviation = strategy2deviation;
elseif mindeviation == strategy3deviation;
    heuristic = 3;
    deviation = strategy3deviation;
elseif mindeviation == strategy4deviation;
    heuristic = 4;
    deviation = strategy4deviation;
elseif mindeviation == strategy5deviation;
    heuristic = 5;
    deviation = strategy5deviation;
end

strategy.catch.heuristic = heuristic;
strategy.catch.deviation = deviation;
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
    heuristic = 1;
    deviation = strategy1deviation;
elseif mindeviation == strategy2deviation;
    heuristic = 2;
    deviation = strategy2deviation;
elseif mindeviation == strategy3deviation;
    heuristic = 3;
    deviation = strategy3deviation;
elseif mindeviation == strategy4deviation;
    heuristic = 4;
    deviation = strategy4deviation;
elseif mindeviation == strategy5deviation;
    heuristic = 5;
    deviation = strategy5deviation;
end

strategy.twoItemGARP.heuristic = heuristic;
strategy.twoItemGARP.deviation = deviation;
save('strategy.mat','strategy');

%% FOR THREE ITEM 3435 TASKS
set = preProcessed.threeItemGARP3435.revtasks;
choice = preProcessed.threeItemGARP3435.choices;

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

strategy.threeItemGARP3435.strategy1 = strategy1;
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

strategy.threeItemGARP3435.mystrategy1 = mystrategy1;
save('strategy.mat','strategy');
strategy1deviation = nnz(strategy.threeItemGARP3435.mystrategy1);

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

strategy.threeItemGARP3435.strategy2 = strategy2;
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

strategy.threeItemGARP3435.mystrategy2 = mystrategy2;
save('strategy.mat','strategy');
strategy2deviation = nnz(strategy.threeItemGARP3435.mystrategy2);

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

strategy.threeItemGARP3435.strategy3 = strategy3;
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

strategy.threeItemGARP3435.mystrategy3 = mystrategy3;
save('strategy.mat','strategy');
strategy3deviation = nnz(strategy.threeItemGARP3435.mystrategy3);

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

strategy.threeItemGARP3435.strategy4 = strategy4;
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

strategy.threeItemGARP3435.mystrategy4 = mystrategy4;
save('strategy.mat','strategy');
strategy4deviation = nnz(strategy.threeItemGARP3435.mystrategy4);

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

strategy.threeItemGARP3435.strategy5 = strategy5;
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

strategy.threeItemGARP3435.mystrategy5 = mystrategy5;
save('strategy.mat','strategy');
strategy5deviation = nnz(strategy.threeItemGARP3435.mystrategy5);

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

strategy.threeItemGARP3435.strategy6 = strategy6;
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

strategy.threeItemGARP3435.mystrategy6 = mystrategy6;
save('strategy.mat','strategy');
strategy6deviation = nnz(strategy.threeItemGARP3435.mystrategy6);

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

strategy.threeItemGARP3435.strategy7 = strategy7;
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

strategy.threeItemGARP3435.mystrategy7 = mystrategy7;
save('strategy.mat','strategy');
strategy7deviation = nnz(strategy.threeItemGARP3435.mystrategy7);

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

strategy.threeItemGARP3435.strategy8 = strategy8;
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

strategy.threeItemGARP3435.mystrategy8 = mystrategy8;
save('strategy.mat','strategy');
strategy8deviation = nnz(strategy.threeItemGARP3435.mystrategy8);

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

strategy.threeItemGARP3435.strategy9 = strategy9;
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

strategy.threeItemGARP3435.mystrategy9 = mystrategy9;
save('strategy.mat','strategy');
strategy9deviation = nnz(strategy.threeItemGARP3435.mystrategy9);

mindeviation = min([strategy1deviation, strategy2deviation, strategy3deviation, strategy4deviation, strategy5deviation]);
if mindeviation == strategy1deviation;
    heuristic = 1;
    deviation = strategy1deviation;
elseif mindeviation == strategy2deviation;
    heuristic = 2;
    deviation = strategy2deviation;
elseif mindeviation == strategy3deviation;
    heuristic = 3;
    deviation = strategy3deviation;
elseif mindeviation == strategy4deviation;
    heuristic = 4;
    deviation = strategy4deviation;
elseif mindeviation == strategy5deviation;
    heuristic = 5;
    deviation = strategy5deviation;
elseif mindeviation == strategy6deviation;
    heuristic = 6;
    deviation = strategy6deviation;
elseif mindeviation == strategy7deviation;
    heuristic = 7;
    deviation = strategy7deviation;
elseif mindeviation == strategy8deviation;
    heuristic = 8;
    deviation = strategy8deviation;
elseif mindeviation == strategy9deviation;
    heuristic = 9;
    deviation = strategy9deviation;
end

strategy.threeItemGARP3435.heuristic = heuristic;
strategy.threeItemGARP3435.deviation = deviation;
save('strategy.mat','strategy');

%% FOR THREE ITEM 3445 TASKS
set = preProcessed.threeItemGARP3445.revtasks;
choice = preProcessed.threeItemGARP3445.choices;

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

strategy.threeItemGARP3445.strategy1 = strategy1;
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

strategy.threeItemGARP3445.mystrategy1 = mystrategy1;
save('strategy.mat','strategy');
strategy1deviation = nnz(strategy.threeItemGARP3445.mystrategy1);

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

strategy.threeItemGARP3445.strategy2 = strategy2;
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

strategy.threeItemGARP3445.mystrategy2 = mystrategy2;
save('strategy.mat','strategy');
strategy2deviation = nnz(strategy.threeItemGARP3445.mystrategy2);

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

strategy.threeItemGARP3445.strategy3 = strategy3;
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

strategy.threeItemGARP3445.mystrategy3 = mystrategy3;
save('strategy.mat','strategy');
strategy3deviation = nnz(strategy.threeItemGARP3445.mystrategy3);

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

strategy.threeItemGARP3445.strategy4 = strategy4;
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

strategy.threeItemGARP3445.mystrategy4 = mystrategy4;
save('strategy.mat','strategy');
strategy4deviation = nnz(strategy.threeItemGARP3445.mystrategy4);

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

strategy.threeItemGARP3445.strategy5 = strategy5;
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

strategy.threeItemGARP3445.mystrategy5 = mystrategy5;
save('strategy.mat','strategy');
strategy5deviation = nnz(strategy.threeItemGARP3445.mystrategy5);

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

strategy.threeItemGARP3445.strategy6 = strategy6;
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

strategy.threeItemGARP3445.mystrategy6 = mystrategy6;
save('strategy.mat','strategy');
strategy6deviation = nnz(strategy.threeItemGARP3445.mystrategy6);

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

strategy.threeItemGARP3445.strategy7 = strategy7;
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

strategy.threeItemGARP3445.mystrategy7 = mystrategy7;
save('strategy.mat','strategy');
strategy7deviation = nnz(strategy.threeItemGARP3445.mystrategy7);

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

strategy.threeItemGARP3445.strategy8 = strategy8;
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

strategy.threeItemGARP3445.mystrategy8 = mystrategy8;
save('strategy.mat','strategy');
strategy8deviation = nnz(strategy.threeItemGARP3445.mystrategy8);

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

strategy.threeItemGARP3445.strategy9 = strategy9;
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

strategy.threeItemGARP3445.mystrategy9 = mystrategy9;
save('strategy.mat','strategy');
strategy9deviation = nnz(strategy.threeItemGARP3445.mystrategy9);

mindeviation = min([strategy1deviation, strategy2deviation, strategy3deviation, strategy4deviation, strategy5deviation]);
if mindeviation == strategy1deviation;
    heuristic = 1;
    deviation = strategy1deviation;
elseif mindeviation == strategy2deviation;
    heuristic = 2;
    deviation = strategy2deviation;
elseif mindeviation == strategy3deviation;
    heuristic = 3;
    deviation = strategy3deviation;
elseif mindeviation == strategy4deviation;
    heuristic = 4;
    deviation = strategy4deviation;
elseif mindeviation == strategy5deviation;
    heuristic = 5;
    deviation = strategy5deviation;
elseif mindeviation == strategy6deviation;
    heuristic = 6;
    deviation = strategy6deviation;
elseif mindeviation == strategy7deviation;
    heuristic = 7;
    deviation = strategy7deviation;
elseif mindeviation == strategy8deviation;
    heuristic = 8;
    deviation = strategy8deviation;
elseif mindeviation == strategy9deviation;
    heuristic = 9;
    deviation = strategy9deviation;
end

strategy.threeItemGARP3445.heuristic = heuristic;
strategy.threeItemGARP3445.deviation = deviation;
save('strategy.mat','strategy');

%% FOR THREE ITEM 3545 TASKS
set = preProcessed.threeItemGARP3545.revtasks;
choice = preProcessed.threeItemGARP3545.choices;

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

strategy.threeItemGARP3545.strategy1 = strategy1;
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

strategy.threeItemGARP3545.mystrategy1 = mystrategy1;
save('strategy.mat','strategy');
strategy1deviation = nnz(strategy.threeItemGARP3545.mystrategy1);

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

strategy.threeItemGARP3545.strategy2 = strategy2;
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

strategy.threeItemGARP3545.mystrategy2 = mystrategy2;
save('strategy.mat','strategy');
strategy2deviation = nnz(strategy.threeItemGARP3545.mystrategy2);

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

strategy.threeItemGARP3545.strategy3 = strategy3;
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

strategy.threeItemGARP3545.mystrategy3 = mystrategy3;
save('strategy.mat','strategy');
strategy3deviation = nnz(strategy.threeItemGARP3545.mystrategy3);

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

strategy.threeItemGARP3545.strategy4 = strategy4;
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

strategy.threeItemGARP3545.mystrategy4 = mystrategy4;
save('strategy.mat','strategy');
strategy4deviation = nnz(strategy.threeItemGARP3545.mystrategy4);

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

strategy.threeItemGARP3545.strategy5 = strategy5;
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

strategy.threeItemGARP3545.mystrategy5 = mystrategy5;
save('strategy.mat','strategy');
strategy5deviation = nnz(strategy.threeItemGARP3545.mystrategy5);

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

strategy.threeItemGARP3545.strategy6 = strategy6;
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

strategy.threeItemGARP3545.mystrategy6 = mystrategy6;
save('strategy.mat','strategy');
strategy6deviation = nnz(strategy.threeItemGARP3545.mystrategy6);

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

strategy.threeItemGARP3545.strategy7 = strategy7;
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

strategy.threeItemGARP3545.mystrategy7 = mystrategy7;
save('strategy.mat','strategy');
strategy7deviation = nnz(strategy.threeItemGARP3545.mystrategy7);

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

strategy.threeItemGARP3545.strategy8 = strategy8;
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

strategy.threeItemGARP3545.mystrategy8 = mystrategy8;
save('strategy.mat','strategy');
strategy8deviation = nnz(strategy.threeItemGARP3545.mystrategy8);

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

strategy.threeItemGARP3545.strategy9 = strategy9;
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

strategy.threeItemGARP3545.mystrategy9 = mystrategy9;
save('strategy.mat','strategy');
strategy9deviation = nnz(strategy.threeItemGARP3545.mystrategy9);

mindeviation = min([strategy1deviation, strategy2deviation, strategy3deviation, strategy4deviation, strategy5deviation]);
if mindeviation == strategy1deviation;
    heuristic = 1;
    deviation = strategy1deviation;
elseif mindeviation == strategy2deviation;
    heuristic = 2;
    deviation = strategy2deviation;
elseif mindeviation == strategy3deviation;
    heuristic = 3;
    deviation = strategy3deviation;
elseif mindeviation == strategy4deviation;
    heuristic = 4;
    deviation = strategy4deviation;
elseif mindeviation == strategy5deviation;
    heuristic = 5;
    deviation = strategy5deviation;
elseif mindeviation == strategy6deviation;
    heuristic = 6;
    deviation = strategy6deviation;
elseif mindeviation == strategy7deviation;
    heuristic = 7;
    deviation = strategy7deviation;
elseif mindeviation == strategy8deviation;
    heuristic = 8;
    deviation = strategy8deviation;
elseif mindeviation == strategy9deviation;
    heuristic = 9;
    deviation = strategy9deviation;
end

strategy.threeItemGARP3545.heuristic = heuristic;
strategy.threeItemGARP3545.deviation = deviation;
save('strategy.mat','strategy');

%%
cd('../');



end