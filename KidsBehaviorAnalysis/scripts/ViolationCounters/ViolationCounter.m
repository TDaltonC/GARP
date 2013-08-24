
% cd('/Users/Dalton/Documents/MATLAB/GARP/GARP/PrePilot/preProcessedRev');
% cd('C:/Users/Niree/Documents/GitHub/GARP/PrePilot/preProcessedRev');
% cd('C:/Users/Niree/Documents/GitHub/GARP/YAOAExperiment/preProcessedRev');
cd('/Users/Dalton/Documents/MATLAB/GARP/GARP/KidsBehaviorAnalysis/PreProcessed/');
subjects = dir;

for folder = 1:length(subjects)
    if subjects(folder).name(1) == '.';
        continue
    end
    if subjects(folder).name(1) == 'C';
        continue
    end
    if subjects(folder).name(1) == 'v';
        continue
    end
    cd(subjects(folder).name);
    load('preProcessed.mat');

set = preProcessed.catch.tasks;
choice = preProcessed.catch.choices;

cross = zeros (length(set));
violation = zeros (length(set));
violationbychoice = zeros(length(set),1);
i = 1;
j = 1;
for i = 1 : length(set);
    for j = 1 : length(set);
        if set(i,1) > set(j,1) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
           set(i,2) < set(j,2); % And line 'j' is on top of line 'i' on the right side
                cross(i,j) = 1;
                if choice(i) == 2 && ...
                   choice(j) == 1;
                   violation(i,j) = 1;
                end
        end
        
        if set(i,1) < set(j,1) && ...  % Do they cross so that line 'j' is on top of line 'i' on the left side
           set(i,2) > set(j,2); % And line 'i' is on top of line 'j' on the right side
                cross(i,j) = 1;
                if choice(i) == 1 && ...
                   choice(j) == 2;
                   violation(i,j) = 1;
                end
        end
    end
    violationbychoice(i,1) = nnz(violation(i,:));
end
violations.catch = violation;
violationperchoice.catch = violationbychoice;
violationcounts.catch = nnz(violations.catch)/2;
save('violationMatrices.mat','violations');
save('violationPerChoice.mat','violationperchoice');
save('violationCounts.mat','violationcounts');
%%
set = preProcessed.twoItemGARP.tasks;
choice = preProcessed.twoItemGARP.choices;

Price = zeros(length(set), 2);
for i = 1:length(set);
    Price(i,1) = (set(2,2,i)-set(1,2,i))/(set(1,1,i)-set(2,1,i));
    Price(i,2) = 1;
end

cross = zeros (length(set));
violation = zeros (length(set));
violationbychoice = zeros(length(set),1);
i = 1;
j = 1;
for i = 1 : length(set);
    for j = 1 : length(set);
        if set(1,1,i) >= set(1,1,j) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
           set(1,2,i) >= set(1,2,j) && ...  % 
           set(2,1,i) <= set(2,1,j) && ...  % And have line 'j' above line 'i' on the right
           set(2,2,i) <= set(2,2,j);
            if (set(1,1,i) ~= set(1,1,j) ||...   %Then is first basket in 'i' not equal to the first basket in 'j'
                set(1,2,i) ~= set(1,2,j));
               if (set(2,1,i) ~= set(2,1,j) ||...%Then is second basket in 'i' not equal to the second basket in 'j'
                   set(2,2,i) ~= set(2,2,j));
                cross(i,j) = 1;
                if choice(i) == 2 && ...
                   choice(j) == 1;
                   violation(i,j) = 1;
                   %AEIMatrix(i,j) = max(dot(Price(i,:),set(1,:,j))/dot(Price(i,:),(set(2,:,i)))-eps, dot(Price(j,:),set(2,:,i))/dot(Price(j,:),set(1,:,j))-eps);
                end
               end
            end
        end
        
        if set(1,1,i) <= set(1,1,j) && ...   % Vice Versa
           set(1,2,i) <= set(1,2,j) && ...
           set(2,1,i) >= set(2,1,j) && ...
           set(2,2,i) >= set(2,2,j);
            if (set(1,1,i) ~= set(1,1,j) ||...
                set(1,2,i) ~= set(1,2,j));
               if (set(2,1,i) ~= set(2,1,j) ||...
                   set(2,2,i) ~= set(2,2,j));
                cross(i,j) = 1;
                if choice(i) == 1 && ...
                   choice(j) == 2;
                    violation(i,j) = 1;
                   % AEIMatrix(i,j) = max(dot(Price(i,:),set(1,:,j))/dot(Price(i,:),(set(2,:,i)))-eps, dot(Price(j,:),set(2,:,i))/dot(Price(j,:),set(1,:,j))-eps);
                end
               end
            end
        end
    end
    violationbychoice(i,1) = nnz(violation(i,:));
end
violations.twoItemGARP = violation;
violationperchoice.twoItemGARP = violationbychoice;
violationcounts.twoItemGARP = nnz(violations.twoItemGARP)/2;
save('violationMatrices.mat','violations');
save('violationPerChoice.mat','violationperchoice');
save('violationCounts.mat','violationcounts');
%%
set = preProcessed.threeItemGARP3435.revtasks;
choice = preProcessed.threeItemGARP3435.choices;

cross = zeros (length(set));
violation = zeros (length(set));
violationbychoice = zeros(length(set),1);
i = 1;
j = 1;
for i = 1 : length(set);
    for j = 1 : length(set);
        if set(1,1,i) >= set(1,1,j) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
           set(1,2,i) >= set(1,2,j) && ...  % 
           set(2,1,i) <= set(2,1,j) && ...  % And have line 'j' above line 'i' on the right
           set(2,3,i) <= set(2,3,j);
            if (set(1,1,i) ~= set(1,1,j) ||...   %Then is first basket in 'i' not equal to the first basket in 'j'
                set(1,2,i) ~= set(1,2,j));
               if (set(2,1,i) ~= set(2,1,j) ||...%Then is second basket in 'i' not equal to the second basket in 'j'
                   set(2,3,i) ~= set(2,3,j));
                cross(i,j) = 1;
                if choice(i) == 2 && ...
                   choice(j) == 1;
                    violation(i,j) = 1;
                end
               end
            end
        end
        if set(1,1,i) <= set(1,1,j) && ...   % Vice Versa
           set(1,2,i) <= set(1,2,j) && ...
           set(2,1,i) >= set(2,1,j) && ...
           set(2,3,i) >= set(2,3,j);
            if (set(1,1,i) ~= set(1,1,j) ||...
                set(1,2,i) ~= set(1,2,j));
               if (set(2,1,i) ~= set(2,1,j) ||...
                   set(2,3,i) ~= set(2,3,j));
                cross(i,j) = 1;
                if choice(i) == 1 && ...
                   choice(j) == 2;
                    violation(i,j) = 1;
                end
               end
            end
        end
    end
    violationbychoice(i,1) = nnz(violation(i,:));
end
violations.threeItemGARP3435 = violation;
violationperchoice.threeItemGARP3435 = violationbychoice;
violationcounts.threeItemGARP3435 = nnz(violations.threeItemGARP3435)/2;
save('violationMatrices.mat','violations');
save('violationPerChoice.mat','violationperchoice');
save('violationCounts.mat','violationcounts');
%%
set = preProcessed.threeItemGARP3445.revtasks;
choice = preProcessed.threeItemGARP3445.choices;

cross = zeros (length(set));
violation = zeros (length(set));
violationbychoice = zeros(length(set),1);
i = 1;
j = 1;
for i = 1 : length(set);
    for j = 1 : length(set);
        if set(1,1,i) >= set(1,1,j) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
           set(1,2,i) >= set(1,2,j) && ...  % 
           set(2,2,i) <= set(2,2,j) && ...  % And have line 'j' above line 'i' on the right
           set(2,3,i) <= set(2,3,j);
            if (set(1,1,i) ~= set(1,1,j) ||...   %Then is first basket in 'i' not equal to the first basket in 'j'
                set(1,2,i) ~= set(1,2,j));
               if (set(2,2,i) ~= set(2,2,j) ||...%Then is second basket in 'i' not equal to the second basket in 'j'
                   set(2,3,i) ~= set(2,3,j));
                cross(i,j) = 1;
                if choice(i) == 2 && ...
                   choice(j) == 1;
                    violation(i,j) = 1;
                end
               end
            end
        end
        if set(1,1,i) <= set(1,1,j) && ...   % Vice Versa
           set(1,2,i) <= set(1,2,j) && ...
           set(2,2,i) >= set(2,2,j) && ...
           set(2,3,i) >= set(2,3,j);
            if (set(1,1,i) ~= set(1,1,j) ||...
                set(1,2,i) ~= set(1,2,j));
               if (set(2,2,i) ~= set(2,2,j) ||...
                   set(2,3,i) ~= set(2,3,j));
                cross(i,j) = 1;
                if choice(i) == 1 && ...
                   choice(j) == 2;
                    violation(i,j) = 1;
                end
               end
            end
        end
    end
    violationbychoice(i,1) = nnz(violation(i,:));
end
violations.threeItemGARP3445 = violation;
violationperchoice.threeItemGARP3445 = violationbychoice;
violationcounts.threeItemGARP3445 = nnz(violations.threeItemGARP3445)/2;
save('violationMatrices.mat','violations');
save('violationPerChoice.mat','violationperchoice');
save('violationCounts.mat','violationcounts');
%%
set = preProcessed.threeItemGARP3545.revtasks;
choice = preProcessed.threeItemGARP3545.choices;

cross = zeros (length(set));
violation = zeros (length(set));
violationbychoice = zeros(length(set),1);
i = 1;
j = 1;
for i = 1 : length(set);
    for j = 1 : length(set);
        if set(1,1,i) >= set(1,1,j) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
           set(1,3,i) >= set(1,3,j) && ...  % 
           set(2,2,i) <= set(2,2,j) && ...  % And have line 'j' above line 'i' on the right
           set(2,3,i) <= set(2,3,j);
            if (set(1,1,i) ~= set(1,1,j) ||...   %Then is first basket in 'i' not equal to the first basket in 'j'
                set(1,3,i) ~= set(1,3,j));
               if (set(2,2,i) ~= set(2,2,j) ||...%Then is second basket in 'i' not equal to the second basket in 'j'
                   set(2,3,i) ~= set(2,3,j));
                cross(i,j) = 1;
                if choice(i) == 2 && ...
                   choice(j) == 1;
                    violation(i,j) = 1;
                end
               end
            end
        end
        if set(1,1,i) <= set(1,1,j) && ...   % Vice Versa
           set(1,3,i) <= set(1,3,j) && ...
           set(2,2,i) >= set(2,2,j) && ...
           set(2,3,i) >= set(2,3,j);
            if (set(1,1,i) ~= set(1,1,j) ||...
                set(1,3,i) ~= set(1,3,j));
               if (set(2,2,i) ~= set(2,2,j) ||...
                   set(2,3,i) ~= set(2,3,j));
                cross(i,j) = 1;
                if choice(i) == 1 && ...
                   choice(j) == 2;
                    violation(i,j) = 1;
                end
               end
            end
        end
    end
    violationbychoice(i,1) = nnz(violation(i,:));
end
violations.threeItemGARP3545 = violation;
violationperchoice.threeItemGARP3545 = violationbychoice;
violationcounts.threeItemGARP3545 = nnz(violations.threeItemGARP3545)/2;
save('violationMatrices.mat','violations');
save('violationPerChoice.mat','violationperchoice');
save('violationCounts.mat','violationcounts');
%%
%Cyclical Violation Counter
set1 = preProcessed.threeItemGARP3435.revtasks;
choice1 = preProcessed.threeItemGARP3435.choices;
set2 = preProcessed.threeItemGARP3445.revtasks;
choice2 = preProcessed.threeItemGARP3445.choices;
set3 = preProcessed.threeItemGARP3545.revtasks;
choice3 = preProcessed.threeItemGARP3545.choices;

cross = zeros (length(set1),length(set1),length(set1));
violation = zeros(length(set1),length(set1),length(set1));
i = 1;
j = 1;
k = 1;
for i = 1 : length(set1);
    for j = 1 : length(set2);
        for k = 1: length(set3);
            if set1(2,1,i) >= set3(1,1,k) && ... %This is condition + from Brocas' notes
                    set1(2,3,i) >= set3(1,3,k) && ...
                    set3(2,2,k) >= set2(2,2,j) && ...
                    set3(2,3,k) >= set2(2,3,j) && ...
                    set2(1,1,j) >= set1(1,1,i) && ...
                    set2(1,2,j) >= set1(1,2,i);
                if (set1(1,1,i) ~= set2(1,1,j) ||... %Then is first bundle in set1 different than the first bundle in set2
                        set1(1,2,i) ~= set2(1,2,j));
                    if (set1(2,1,i) ~= set3(1,1,k) ||... %Then is second bundle in set1 different than the first bundle in set3
                            set1(2,3,i) ~= set3(1,3,k)); 
                        if (set2(2,2,j) ~= set3(2,2,k) ||... %Then is second bundle in set2 different than the second bundle in set3
                                set2(2,3,j) ~= set3(2,3,k));
                            cross(i,j,k) = 1; %Then, there is a possible contradiction
                            if choice1(i) == 1 && ... 
                                    choice2(j) == 2 && ...
                                    choice3(k) == 1;
                                violation(i,j,k) = 1;
                            end
                        end
                    end
                end
            end
        end
        if set1(2,1,i) <= set3(1,1,k) && ... %This is condition ++ from Brocas' notes
                set1(2,3,i) <= set3(1,3,k) && ...
                set3(2,2,k) <= set2(2,2,j) && ...
                set3(2,3,k) <= set2(2,3,j) && ...
                set2(1,1,j) <= set1(1,1,i) && ...
                set2(1,2,j) <= set1(1,2,i);
            if (set1(1,1,i) ~= set2(1,1,j) ||... %Then is first bundle in set1 different than the first bundle in set2
                    set1(1,2,i) ~= set2(1,2,j));
                if (set1(2,1,i) ~= set3(1,1,k) ||... %Then is second bundle in set1 different than the first bundle in set3
                        set1(2,3,i) ~= set3(1,3,k));
                    if (set2(2,2,j) ~= set3(2,2,k) ||... %Then is second bundle in set2 different than the second bundle in set3
                            set2(2,3,j) ~= set3(2,3,k));
                        cross(i,j,k) = 1; %Then, there is a possible contradiction
                        if choice1(i) == 2 && ...
                                choice2(j) == 1 && ...
                                choice3(k) == 2;
                            violation(i,j,k) = 1;
                        end
                    end
                end
            end
        end
    end
    violationbychoice(i,1) = nnz(violation(i,:,:));
end

violations.threeItemCyclical = violation;
violationperchoice.threeItemCyclical = violationbychoice;
violationcounts.threeItemCyclical = nnz(violations.threeItemCyclical);  %Do we divide by 3 here? or by 2? or something else!?
save('violationMatrices.mat','violations');
save('violationPerChoice.mat','violationperchoice');
save('violationCounts.mat','violationcounts');
%%
cd('../');
clearvars -except 'subjects', 'folder';
end
