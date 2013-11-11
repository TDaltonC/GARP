% cd('/Users/Niree/Documents/GitHub/GARP/prePilot/preProcessedRev/');
% if running for YA
cd('/Users/Niree/Documents/GitHub/GARP/YAOAExperiment/YA/preProcessedRev/');

% if running for OA
% cd('/Users/Niree/Documents/GitHub/GARP/YAOAExperiment/OA/preProcessedRev/');

subjects = dir;
for folder = 1:length(subjects)
    if ismember((subjects(folder).name(1)), {'.','C','r','S','v','V','s'});
        continue
    end
    cd(subjects(folder).name);
    load('preProcessed.mat');

% % FOR LIMIT (ONE ITEM) TASKS
% set = preProcessed.catch.revtasks;
% choice = preProcessed.catch.choices;
% 
% %%% Strategy1: Maximizing Absolutely
% strategy1 = zeros(length(set),1);
% for i = 1:length(set);
%     if set(1,1,i) + set(1,2,i) > set(2,1,i) + set(2,2,i);
%         strategy1(i) = 1;
%     elseif set(1,1,i) + set(1,2,i) < set(2,1,i) + set(2,2,i);
%         strategy1(i) = 2;
%     elseif set(1,1,i) + set(1,2,i) == set(2,1,i) + set(2,2,i);
%         strategy1(i) = 0; %0 means that either response (1 or 2) will be in compliance with the strategy
%     end
% end
% 
% strategy.catch.strategy1 = strategy1;
% save('strategy.mat','strategy');
% 
% mystrategy1 = zeros(length(set),1);
% for i = 1:length(set);
%     if strategy1(i) == 1 && choice(i,1) == 1;
%         mystrategy1(i) = 0;
%     elseif strategy1(i) == 1 && choice(i,1) == 2;
%         mystrategy1(i) = 1;
%     elseif strategy1(i) == 2 && choice(i,1) == 1;
%         mystrategy1(i) = 1;
%     elseif strategy1(i) == 2 && choice(i,1) == 2;
%         mystrategy1(i) = 0;
%     elseif strategy1(i) == 0 && choice(i,1) == 1;
%         mystrategy1(i) = 0;
%     elseif strategy1(i) == 0 && choice(i,1) == 2;
%         mystrategy1(i) = 0;
%     end
% end
% 
% strategy.catch.mystrategy1 = mystrategy1;
% save('strategy.mat','strategy');
% strategy1deviation = nnz(strategy.catch.mystrategy1);
% 
% %%% Strategy2: Maximizing Item 1 or Equivalently, Minimizing Item 2
% strategy2 = zeros(length(set),1);
% for i = 1:length(set);
%     if set(1,1,i) > set(2,1,i);
%         strategy2(i) = 1;
%     elseif set(1,1,i) < set(2,1,i);
%         strategy2(i) = 2;
%     elseif set(1,1,i) == set(2,1,i);
%         strategy2(i) = 0;
%     end
% end
% 
% strategy.catch.strategy2 = strategy2;
% save('strategy.mat','strategy');
% 
% mystrategy2 = zeros(length(set),1);
% for i = 1:length(set);
%     if strategy2(i) == 1 && choice(i,1) == 1;
%         mystrategy2(i) = 0;
%     elseif strategy2(i) == 1 && choice(i,1) == 2;
%         mystrategy2(i) = 1;
%     elseif strategy2(i) == 2 && choice(i,1) == 1;
%         mystrategy2(i) = 1;
%     elseif strategy2(i) == 2 && choice(i,1) == 2;
%         mystrategy2(i) = 0;
%     elseif strategy2(i) == 0 && choice(i,1) == 1;
%         mystrategy2(i) = 0;
%     elseif strategy2(i) == 0 && choice(i,1) == 2;
%         mystrategy2(i) = 0;
%     end
% end
% 
% strategy.catch.mystrategy2 = mystrategy2;
% save('strategy.mat','strategy');
% strategy2deviation = nnz(strategy.catch.mystrategy2);
% 
% %%% Strategy3: Maximizing Item 2 or Equivalently, Minimizing Item 1
% strategy3 = zeros(length(set),1);
% for i = 1:length(set);
%     if set(1,2,i) > set(2,2,i);
%         strategy3(i) = 1;
%     elseif set(1,2,i) < set(2,2,i);
%         strategy3(i) = 2;
%     elseif set(1,2,i) == set(2,2,i);
%         strategy3(i) = 0;
%     end
% end
% 
% strategy.catch.strategy3 = strategy3;
% save('strategy.mat','strategy');
% 
% mystrategy3 = zeros(length(set),1);
% for i = 1:length(set);
%     if strategy3(i) == 1 && choice(i,1) == 1;
%         mystrategy3(i) = 0;
%     elseif strategy3(i) == 1 && choice(i,1) == 2;
%         mystrategy3(i) = 1;
%     elseif strategy3(i) == 2 && choice(i,1) == 1;
%         mystrategy3(i) = 1;
%     elseif strategy3(i) == 2 && choice(i,1) == 2;
%         mystrategy3(i) = 0;
%     elseif strategy3(i) == 0 && choice(i,1) == 1;
%         mystrategy3(i) = 0;
%     elseif strategy3(i) == 0 && choice(i,1) == 2;
%         mystrategy3(i) = 0;
%     end
% end
% 
% strategy.catch.mystrategy3 = mystrategy3;
% save('strategy.mat','strategy');
% strategy3deviation = nnz(strategy.catch.mystrategy3);
% 
% %%% Strategy 4: Minimizing Absolutely
% strategy4 = zeros(length(set),1);
% for i = 1:length(set);
%     if set(1,1,i) + set(1,2,i) > set(2,1,i) + set(2,2,i);
%         strategy4(i) = 2;
%     elseif set(1,1,i) + set(1,2,i) < set(2,1,i) + set(2,2,i);
%         strategy4(i) = 1;
%     elseif set(1,1,i) + set(1,2,i) == set(2,1,i) + set(2,2,i);
%         strategy4(i) = 0; %0 means that either response (1 or 2) will be in compliance with the strategy
%     end
% end
% 
% strategy.catch.strategy4 = strategy4;
% save('strategy.mat','strategy');
% 
% mystrategy4 = zeros(length(set),1);
% for i = 1:length(set);
%     if strategy4(i) == 1 && choice(i,1) == 1;
%         mystrategy4(i) = 0;
%     elseif strategy4(i) == 1 && choice(i,1) == 2;
%         mystrategy4(i) = 1;
%     elseif strategy4(i) == 2 && choice(i,1) == 1;
%         mystrategy4(i) = 1;
%     elseif strategy4(i) == 2 && choice(i,1) == 2;
%         mystrategy4(i) = 0;
%     elseif strategy4(i) == 0 && choice(i,1) == 1;
%         mystrategy4(i) = 0;
%     elseif strategy4(i) == 0 && choice(i,1) == 2;
%         mystrategy4(i) = 0;
%     end
% end
% 
% strategy.catch.mystrategy4 = mystrategy4;
% save('strategy.mat','strategy');
% strategy4deviation = nnz(strategy.catch.mystrategy4);
% 
% %%% Strategy5: Equalizing ... note: it is impossible to differentiate between strategy4...
% strategy5 for the limit case
% strategy5 = zeros(length(set),1);
% for i = 1:length(set);
%     if abs(set(1,1,i) - set(1,2,i)) > abs(set(2,1,i) - set(2,2,i));
%         strategy5(i) = 2;
%     elseif abs(set(1,1,i) - set(1,2,i)) < abs(set(2,1,i) - set(2,2,i));
%         strategy5(i) = 1;
%     elseif abs(set(1,1,i) - set(1,2,i)) == abs(set(2,1,i) - set(2,2,i));
%         strategy5(i) = 0;
%     end
% end
% 
% strategy.catch.strategy5 = strategy5;
% save('strategy.mat','strategy');
% 
% mystrategy5 = zeros(length(set),1);
% for i = 1:length(set);
%     if strategy5(i) == 1 && choice(i,1) == 1;
%         mystrategy5(i) = 0;
%     elseif strategy5(i) == 1 && choice(i,1) == 2;
%         mystrategy5(i) = 1;
%     elseif strategy5(i) == 2 && choice(i,1) == 1;
%         mystrategy5(i) = 1;
%     elseif strategy5(i) == 2 && choice(i,1) == 2;
%         mystrategy5(i) = 0;
%     elseif strategy5(i) == 0 && choice(i,1) == 1;
%         mystrategy5(i) = 0;
%     elseif strategy5(i) == 0 && choice(i,1) == 2;
%         mystrategy5(i) = 0;
%     end
% end
% 
% strategy.catch.mystrategy5 = mystrategy5;
% save('strategy.mat','strategy');
% strategy5deviation = nnz(strategy.catch.mystrategy5);
% 
%mindeviation = min([strategy1deviation, strategy2deviation, ...
%     strategy3deviation, strategy4deviation, strategy5deviation, ...
%     strategy6deviation, strategy7deviation, strategy8deviation, ...
%     strategy9deviation, strategy10deviation]);
% [ heuristic, deviation ] = minDeviationMatcher( mindeviation ); 

% strategy.catch.heuristic = heuristic;
% strategy.catch.deviation = deviation;
% save('strategy.mat','strategy');
%% FOR TWO ITEM TASKS
set = preProcessed.twoItemGARP.tasks;
choice = preProcessed.twoItemGARP.choices;

%%%% Strategy1: Maximizing Absolutely
[ strategy1, mystrategy1 ] = strategy1Matcher( set, choice );
strategy.twoItemGARP.strategy1 = strategy1;
strategy.twoItemGARP.mystrategy1 = mystrategy1;
strategy1deviation = nnz(strategy.twoItemGARP.mystrategy1);
save('strategy.mat','strategy');

%%%% Strategy2: Maximizing Item 1 or Equivalently, Minimizing Item 2
[ strategy2, mystrategy2 ] = strategy2Matcher( set, choice);
strategy.twoItemGARP.strategy2 = strategy2;
strategy.twoItemGARP.mystrategy2 = mystrategy2;
strategy2deviation = nnz(strategy.twoItemGARP.mystrategy2);
save('strategy.mat','strategy');

%%%% Strategy3: Maximizing Item 2 or Equivalently, Minimizing Item 1
[ strategy3, mystrategy3 ] = strategy3Matcher( set, choice );
strategy.twoItemGARP.strategy3 = strategy3;
strategy.twoItemGARP.mystrategy3 = mystrategy3;
strategy3deviation = nnz(strategy.twoItemGARP.mystrategy3);
save('strategy.mat','strategy');

%%%% Strategy4: Minimizing Absolutely
[ strategy4, mystrategy4 ] = strategy4Matcher( set, choice );
strategy.twoItemGARP.strategy4 = strategy4;
strategy.twoItemGARP.mystrategy4 = mystrategy4;
strategy4deviation = nnz(strategy.twoItemGARP.mystrategy4);
save('strategy.mat','strategy');

%%%% Strategy5: Equalizing
[ strategy5, mystrategy5 ] = strategy5Matcher( set, choice );
strategy.twoItemGARP.strategy5 = strategy5;
strategy.twoItemGARP.mystrategy5 = mystrategy5;
strategy5deviation = nnz(strategy.twoItemGARP.mystrategy5);
save('strategy.mat','strategy');

%Note: there is no strategy 6, 7, 8, or 9 for 2Item GARP...skips to 10

%%%% Strategy10: Max-min
[ strategy10, mystrategy10 ] = strategy10Matcher( set, choice);
strategy.twoItemGARP.strategy10 = strategy10;
strategy.twoItemGARP.mystrategy10 = mystrategy10;
strategy10deviation = nnz(strategy.twoItemGARP.mystrategy10);
save('strategy.mat','strategy');

mindeviation = min([strategy1deviation, strategy2deviation, ...
    strategy3deviation, strategy4deviation, strategy5deviation, strategy10deviation]);
[ heuristic, deviation ] = minDeviationMatcher_2Item( mindeviation, strategy1deviation, strategy2deviation, strategy3deviation,...
    strategy4deviation, strategy5deviation, strategy10deviation);

strategy.twoItemGARP.strategy1deviation = strategy1deviation;
strategy.twoItemGARP.strategy2deviation = strategy2deviation;
strategy.twoItemGARP.strategy3deviation = strategy3deviation;
strategy.twoItemGARP.strategy4deviation = strategy4deviation;
strategy.twoItemGARP.strategy5deviation = strategy5deviation;
strategy.twoItemGARP.strategy10deviation = strategy10deviation;
strategy.twoItemGARP.heuristic = heuristic;
strategy.twoItemGARP.deviation = deviation;
save('strategy.mat','strategy');

%% FOR THREE ITEM 3435 TASKS
load('preProcessed.mat');
set = preProcessed.threeItemGARP3435.revtasks;
choice = preProcessed.threeItemGARP3435.choices;

%%%% Strategy1: Maximizing Absolutely
[ strategy1, mystrategy1 ] = strategy1Matcher( set, choice );
strategy.threeItemGARP3435.strategy1 = strategy1;
strategy.threeItemGARP3435.mystrategy1 = mystrategy1;
strategy1deviation = nnz(strategy.threeItemGARP3435.mystrategy1);
save('strategy.mat','strategy');

%%%% Strategy2: Maximizing Item 1 
[ strategy2, mystrategy2 ] = strategy2Matcher( set, choice );
strategy.threeItemGARP3435.strategy2 = strategy2;
strategy.threeItemGARP3435.mystrategy2 = mystrategy2;
strategy2deviation = nnz(strategy.threeItemGARP3435.mystrategy2);
save('strategy.mat','strategy');

%%%% Strategy3: Maximizing Item 2 
[ strategy3, mystrategy3 ] = strategy3Matcher( set, choice );
strategy.threeItemGARP3435.strategy3 = strategy3;
strategy.threeItemGARP3435.mystrategy3 = mystrategy3;
strategy3deviation = nnz(strategy.threeItemGARP3435.mystrategy3);
save('strategy.mat','strategy');

%%%% Strategy4: Minimizing Absolutely
[ strategy4, mystrategy4 ] = strategy4Matcher( set, choice );
strategy.threeItemGARP3435.strategy4 = strategy4;
strategy.threeItemGARP3435.mystrategy4 = mystrategy4;
strategy4deviation = nnz(strategy.threeItemGARP3435.mystrategy4);
save('strategy.mat','strategy');

%%%% Strategy5: Equalizing
[ strategy5, mystrategy5 ] = strategy5Matcher( set, choice );
strategy.threeItemGARP3435.strategy5 = strategy5;
strategy.threeItemGARP3435.mystrategy5 = mystrategy5;
strategy5deviation = nnz(strategy.threeItemGARP3435.mystrategy5);
save('strategy.mat','strategy');

%%%% Strategy6: Maximizing Item 3
[ strategy6, mystrategy6 ] = strategy6Matcher( set, choice );
strategy.threeItemGARP3435.strategy6 = strategy6;
strategy.threeItemGARP3435.mystrategy6 = mystrategy6;
strategy6deviation = nnz(strategy.threeItemGARP3435.mystrategy6);
save('strategy.mat','strategy');

%%%% Strategy7: Maximizing Item 1 + Item 2
[ strategy7, mystrategy7 ] = strategy7Matcher( set, choice );
strategy.threeItemGARP3435.strategy7 = strategy7;
strategy.threeItemGARP3435.mystrategy7 = mystrategy7;
strategy7deviation = nnz(strategy.threeItemGARP3435.mystrategy7);
save('strategy.mat','strategy');

%%%% Strategy8: Maximizing Item 1 + Item 3
[ strategy8, mystrategy8 ] = strategy8Matcher( set, choice );
strategy.threeItemGARP3435.strategy8 = strategy8;
strategy.threeItemGARP3435.mystrategy8 = mystrategy8;
strategy8deviation = nnz(strategy.threeItemGARP3435.mystrategy8);
save('strategy.mat','strategy');

%%%% Strategy9: Maximizing Item 2 + Item 3
[ strategy9, mystrategy9 ] = strategy9Matcher( set, choice );
strategy.threeItemGARP3435.strategy9 = strategy9;
strategy.threeItemGARP3435.mystrategy9 = mystrategy9;
strategy9deviation = nnz(strategy.threeItemGARP3435.mystrategy9);
save('strategy.mat','strategy');

%%%% Strategy10: Max-min
[ strategy10, mystrategy10 ] = strategy10Matcher( set, choice );
strategy.threeItemGARP3435.strategy10 = strategy10;
strategy.threeItemGARP3435.mystrategy10 = mystrategy10;
strategy10deviation = nnz(strategy.threeItemGARP3435.mystrategy10);
save('strategy.mat','strategy');

mindeviation = min([strategy1deviation, strategy2deviation, ...
    strategy3deviation, strategy4deviation, strategy5deviation, ...
    strategy6deviation, strategy7deviation, strategy8deviation, ...
    strategy9deviation, strategy10deviation]);
[ heuristic, deviation ] = minDeviationMatcher_3Item( mindeviation, strategy1deviation, strategy2deviation, strategy3deviation,...
    strategy4deviation, strategy5deviation, strategy6deviation, strategy7deviation, strategy8deviation, strategy9deviation, strategy10deviation);

strategy.threeItemGARP3435.strategy1deviation = strategy1deviation;
strategy.threeItemGARP3435.strategy2deviation = strategy2deviation;
strategy.threeItemGARP3435.strategy3deviation = strategy3deviation;
strategy.threeItemGARP3435.strategy4deviation = strategy4deviation;
strategy.threeItemGARP3435.strategy5deviation = strategy5deviation;
strategy.threeItemGARP3435.strategy6deviation = strategy6deviation;
strategy.threeItemGARP3435.strategy7deviation = strategy7deviation;
strategy.threeItemGARP3435.strategy8deviation = strategy8deviation;
strategy.threeItemGARP3435.strategy9deviation = strategy9deviation;
strategy.threeItemGARP3435.strategy10deviation = strategy10deviation;
strategy.threeItemGARP3435.heuristic = heuristic;
strategy.threeItemGARP3435.deviation = deviation;
save('strategy.mat','strategy');

%% FOR THREE ITEM 3445 TASKS
load('preProcessed.mat');
set = preProcessed.threeItemGARP3445.revtasks;
choice = preProcessed.threeItemGARP3445.choices;

%%%% Strategy1: Maximizing Absolutely
[ strategy1, mystrategy1 ] = strategy1Matcher( set, choice );
strategy.threeItemGARP3445.strategy1 = strategy1;
strategy.threeItemGARP3445.mystrategy1 = mystrategy1;
strategy1deviation = nnz(strategy.threeItemGARP3445.mystrategy1);
save('strategy.mat','strategy');

%%%% Strategy2: Maximizing Item 1 
[ strategy2, mystrategy2 ] = strategy2Matcher( set, choice );
strategy.threeItemGARP3445.strategy2 = strategy2;
strategy.threeItemGARP3445.mystrategy2 = mystrategy2;
strategy2deviation = nnz(strategy.threeItemGARP3445.mystrategy2);
save('strategy.mat','strategy');

%%%% Strategy3: Maximizing Item 2 
[ strategy3, mystrategy3 ] = strategy3Matcher( set, choice );
strategy.threeItemGARP3445.strategy3 = strategy3;
strategy.threeItemGARP3445.mystrategy3 = mystrategy3;
strategy3deviation = nnz(strategy.threeItemGARP3445.mystrategy3);
save('strategy.mat','strategy');

%%%% Strategy4: Minimizing Absolutely
[ strategy4, mystrategy4 ] = strategy4Matcher( set, choice );
strategy.threeItemGARP3445.strategy4 = strategy4;
strategy.threeItemGARP3445.mystrategy4 = mystrategy4;
strategy4deviation = nnz(strategy.threeItemGARP3445.mystrategy4);
save('strategy.mat','strategy');

%%%% Strategy5: Equalizing
[ strategy5, mystrategy5 ] = strategy5Matcher( set, choice );
strategy.threeItemGARP3445.strategy5 = strategy5;
strategy.threeItemGARP3445.mystrategy5 = mystrategy5;
strategy5deviation = nnz(strategy.threeItemGARP3445.mystrategy5);
save('strategy.mat','strategy');

%%%% Strategy6: Maximizing Item 3
[ strategy6, mystrategy6 ] = strategy6Matcher( set, choice );
strategy.threeItemGARP3445.strategy6 = strategy6;
strategy.threeItemGARP3445.mystrategy6 = mystrategy6;
strategy6deviation = nnz(strategy.threeItemGARP3445.mystrategy6);
save('strategy.mat','strategy');

%%%% Strategy7: Maximizing Item 1 + Item 2
[ strategy7, mystrategy7 ] = strategy7Matcher( set, choice );
strategy.threeItemGARP3445.strategy7 = strategy7;
strategy.threeItemGARP3445.mystrategy7 = mystrategy7;
strategy7deviation = nnz(strategy.threeItemGARP3445.mystrategy7);
save('strategy.mat','strategy');

%%%% Strategy8: Maximizing Item 1 + Item 3
[ strategy8, mystrategy8 ] = strategy8Matcher( set, choice );
strategy.threeItemGARP3445.strategy8 = strategy8;
strategy.threeItemGARP3445.mystrategy8 = mystrategy8;
strategy8deviation = nnz(strategy.threeItemGARP3445.mystrategy8);
save('strategy.mat','strategy');

%%%% Strategy9: Maximizing Item 2 + Item 3
[ strategy9, mystrategy9 ] = strategy9Matcher( set, choice );
strategy.threeItemGARP3445.strategy9 = strategy9;
strategy.threeItemGARP3445.mystrategy9 = mystrategy9;
strategy9deviation = nnz(strategy.threeItemGARP3445.mystrategy9);
save('strategy.mat','strategy');

%%%% Strategy10: Max-min
[ strategy10, mystrategy10 ] = strategy10Matcher( set, choice );
strategy.threeItemGARP3445.strategy10 = strategy10;
strategy.threeItemGARP3445.mystrategy10 = mystrategy10;
strategy10deviation = nnz(strategy.threeItemGARP3445.mystrategy10);
save('strategy.mat','strategy');

mindeviation = min([strategy1deviation, strategy2deviation, ...
    strategy3deviation, strategy4deviation, strategy5deviation, ...
    strategy6deviation, strategy7deviation, strategy8deviation, ...
    strategy9deviation, strategy10deviation]);
[ heuristic, deviation ] = minDeviationMatcher_3Item( mindeviation, strategy1deviation, strategy2deviation, strategy3deviation,...
    strategy4deviation, strategy5deviation, strategy6deviation, strategy7deviation, strategy8deviation, strategy9deviation, strategy10deviation);

strategy.threeItemGARP3445.strategy1deviation = strategy1deviation;
strategy.threeItemGARP3445.strategy2deviation = strategy2deviation;
strategy.threeItemGARP3445.strategy3deviation = strategy3deviation;
strategy.threeItemGARP3445.strategy4deviation = strategy4deviation;
strategy.threeItemGARP3445.strategy5deviation = strategy5deviation;
strategy.threeItemGARP3445.strategy6deviation = strategy6deviation;
strategy.threeItemGARP3445.strategy7deviation = strategy7deviation;
strategy.threeItemGARP3445.strategy8deviation = strategy8deviation;
strategy.threeItemGARP3445.strategy9deviation = strategy9deviation;
strategy.threeItemGARP3445.strategy10deviation = strategy10deviation;
strategy.threeItemGARP3445.heuristic = heuristic;
strategy.threeItemGARP3445.deviation = deviation;
save('strategy.mat','strategy');

%% FOR THREE ITEM 3545 TASKS
load('preProcessed.mat');
set = preProcessed.threeItemGARP3545.revtasks;
choice = preProcessed.threeItemGARP3545.choices;

%%%% Strategy1: Maximizing Absolutely
[ strategy1, mystrategy1 ] = strategy1Matcher( set, choice );
strategy.threeItemGARP3545.strategy1 = strategy1;
strategy.threeItemGARP3545.mystrategy1 = mystrategy1;
strategy1deviation = nnz(strategy.threeItemGARP3545.mystrategy1);
save('strategy.mat','strategy');

%%%% Strategy2: Maximizing Item 1 
[ strategy2, mystrategy2 ] = strategy2Matcher( set, choice );
strategy.threeItemGARP3545.strategy2 = strategy2;
strategy.threeItemGARP3545.mystrategy2 = mystrategy2;
strategy2deviation = nnz(strategy.threeItemGARP3545.mystrategy2);
save('strategy.mat','strategy');

%%%% Strategy3: Maximizing Item 2 
[ strategy3, mystrategy3 ] = strategy3Matcher( set, choice );
strategy.threeItemGARP3545.strategy3 = strategy3;
strategy.threeItemGARP3545.mystrategy3 = mystrategy3;
strategy3deviation = nnz(strategy.threeItemGARP3545.mystrategy3);
save('strategy.mat','strategy');

%%%% Strategy4: Minimizing Absolutely
[ strategy4, mystrategy4 ] = strategy4Matcher( set, choice );
strategy.threeItemGARP3545.strategy4 = strategy4;
strategy.threeItemGARP3545.mystrategy4 = mystrategy4;
strategy4deviation = nnz(strategy.threeItemGARP3545.mystrategy4);
save('strategy.mat','strategy');

%%%% Strategy5: Equalizing
[ strategy5, mystrategy5 ] = strategy5Matcher( set, choice );
strategy.threeItemGARP3545.strategy5 = strategy5;
strategy.threeItemGARP3545.mystrategy5 = mystrategy5;
strategy5deviation = nnz(strategy.threeItemGARP3545.mystrategy5);
save('strategy.mat','strategy');

%%%% Strategy6: Maximizing Item 3
[ strategy6, mystrategy6 ] = strategy6Matcher( set, choice );
strategy.threeItemGARP3545.strategy6 = strategy6;
strategy.threeItemGARP3545.mystrategy6 = mystrategy6;
strategy6deviation = nnz(strategy.threeItemGARP3545.mystrategy6);
save('strategy.mat','strategy');

%%%% Strategy7: Maximizing Item 1 + Item 2
[ strategy7, mystrategy7 ] = strategy7Matcher( set, choice );
strategy.threeItemGARP3545.strategy7 = strategy7;
strategy.threeItemGARP3545.mystrategy7 = mystrategy7;
strategy7deviation = nnz(strategy.threeItemGARP3545.mystrategy7);
save('strategy.mat','strategy');

%%%% Strategy8: Maximizing Item 1 + Item 3
[ strategy8, mystrategy8 ] = strategy8Matcher( set, choice );
strategy.threeItemGARP3545.strategy8 = strategy8;
strategy.threeItemGARP3545.mystrategy8 = mystrategy8;
strategy8deviation = nnz(strategy.threeItemGARP3545.mystrategy8);
save('strategy.mat','strategy');

%%%% Strategy9: Maximizing Item 2 + Item 3
[ strategy9, mystrategy9 ] = strategy9Matcher( set, choice );
strategy.threeItemGARP3545.strategy9 = strategy9;
strategy.threeItemGARP3545.mystrategy9 = mystrategy9;
strategy9deviation = nnz(strategy.threeItemGARP3545.mystrategy9);
save('strategy.mat','strategy');

%%%% Strategy10: Max-min
[ strategy10, mystrategy10 ] = strategy10Matcher( set, choice );
strategy.threeItemGARP3545.strategy10 = strategy10;
strategy.threeItemGARP3545.mystrategy10 = mystrategy10;
strategy10deviation = nnz(strategy.threeItemGARP3545.mystrategy10);
save('strategy.mat','strategy');

mindeviation = min([strategy1deviation, strategy2deviation, ...
    strategy3deviation, strategy4deviation, strategy5deviation, ...
    strategy6deviation, strategy7deviation, strategy8deviation, ...
    strategy9deviation, strategy10deviation]);
[ heuristic, deviation ] = minDeviationMatcher_3Item( mindeviation, strategy1deviation, strategy2deviation, strategy3deviation,...
    strategy4deviation, strategy5deviation, strategy6deviation, strategy7deviation, strategy8deviation, strategy9deviation, strategy10deviation);

strategy.threeItemGARP3545.strategy1deviation = strategy1deviation;
strategy.threeItemGARP3545.strategy2deviation = strategy2deviation;
strategy.threeItemGARP3545.strategy3deviation = strategy3deviation;
strategy.threeItemGARP3545.strategy4deviation = strategy4deviation;
strategy.threeItemGARP3545.strategy5deviation = strategy5deviation;
strategy.threeItemGARP3545.strategy6deviation = strategy6deviation;
strategy.threeItemGARP3545.strategy7deviation = strategy7deviation;
strategy.threeItemGARP3545.strategy8deviation = strategy8deviation;
strategy.threeItemGARP3545.strategy9deviation = strategy9deviation;
strategy.threeItemGARP3545.strategy10deviation = strategy10deviation;
strategy.threeItemGARP3545.heuristic = heuristic;
strategy.threeItemGARP3545.deviation = deviation;
save('strategy.mat','strategy');

clearvars -except i subjects
%%
cd('../');




end