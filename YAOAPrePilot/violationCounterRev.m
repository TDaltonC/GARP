% cd('/Users/Dalton/Documents/MATLAB/GARP/GARP/PrePilot/preProcessedRev');
cd('C:/Users/Niree/Documents/GitHub/GARP/YAOAPrePilot/preProcessedRev');
subjects = dir;

for folder = 1:length(subjects)
    if ismember((subjects(folder).name(1)),{'.','C','v','S','r'})
        continue
    end
    cd(subjects(folder).name);
    load('preProcessed.mat');
    
    trialArray = {'limitGARP', 'twoItemGARP', 'threeItemGARP1213', 'threeItemGARP1223', 'threeItemGARP1323', 'threeItemCyclical'};
    
    for ta = 1:length(trialArray);
        if ismember((trialArray{ta}),[1 2 3 4 5]);
            if ismember((trialArray{ta}),[1 2])
                set = preProcessed.(trialArray{ta}).tasks;
            elseif ismember((trialArray{ta}),[3 4 5])
                set = preProcessed.(trialArray{ta}).revtasks;
            end
            choice = preProcessed.(trialArray{ta}).choices;
            cross = zeros (length(set));
            violation = zeros (length(set));
            violationbychoice = zeros(length(set),1);
            if trialArray{ta} == 1;
                for i = 1 : length(set);
                    for j = 1 : length(set);
                        if set(i,1) > set(j,1) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
                                set(i,2) < set(j,2); % And line 'j' is on top of line 'i' on the right side
                            cross(i,j) = 1;
                            if choice(i) == 2 && ...
                                    choice(j) == 1;
                                if i ~= j;
                                    violation(i,j) = 1;
                                elseif i == j;
                                    violation(i,j) = 2;
                                end
                            end
                        end
                        
                        if set(i,1) < set(j,1) && ...  % Do they cross so that line 'j' is on top of line 'i' on the left side
                                set(i,2) > set(j,2); % And line 'i' is on top of line 'j' on the right side
                            cross(i,j) = 1;
                            if choice(i) == 1 && ...
                                    choice(j) == 2;
                                if i ~= j;
                                    violation(i,j) = 1;
                                elseif i == j;
                                    violation(i,j) = 2;
                                end
                            end
                        end
                    end
                    violationbychoice(i,1) = nnz(violation(i,:));
                end
            elseif trialArray{ta} == 2;
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
                                        if i ~= j
                                            violation(i,j) = 1;
                                        elseif i == j
                                            violation(i,j) = 2;
                                        end
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
                                        if i ~= j;
                                            violation(i,j) = 1;
                                        elseif i == j;
                                            violation(i,j) = 2;
                                        end
                                        % AEIMatrix(i,j) = max(dot(Price(i,:),set(1,:,j))/dot(Price(i,:),(set(2,:,i)))-eps, dot(Price(j,:),set(2,:,i))/dot(Price(j,:),set(1,:,j))-eps);
                                    end
                                end
                            end
                        end
                    end
                    violationbychoice(i,1) = nnz(violation(i,:));
                end
            elseif trialArray{ta} == 3;
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
                                        if i ~= j
                                            violation(i,j) = 1;
                                        elseif i == j;
                                            violation(i,j) = 2;
                                        end
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
                                        if i ~= j
                                            violation(i,j) = 1;
                                        elseif i == j
                                            violation(i,j) = 2;
                                        end
                                    end
                                end
                            end
                        end
                    end
                    violationbychoice(i,1) = nnz(violation(i,:));
                end
            elseif trialArray{ta} == 4;
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
                                        if i ~= j
                                            violation(i,j) = 1;
                                        elseif i == j
                                            violation(i,j) = 2;
                                        end
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
                                        if i ~= j
                                            violation(i,j) = 1;
                                        elseif i == j
                                            violation(i,j) = 2;
                                        end
                                    end
                                end
                            end
                        end
                    end
                    violationbychoice(i,1) = nnz(violation(i,:));
                end
            elseif trialArray{ta} == 5;
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
                                        if i ~= j
                                            violation(i,j) = 1;
                                        elseif i == j
                                            violation(i,j) = 2;
                                        end
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
                                        if i ~= j
                                            violation(i,j) = 1;
                                        elseif i == j
                                            violation(i,j) = 2;
                                        end
                                    end
                                end
                            end
                        end
                    end
                    violationbychoice(i,1) = nnz(violation(i,:));
                end
            end
            violations.(trialArray{ta}) = violation;
            violationcounts.(trialArray{ta}) = nnz(violations.(trialArray{ta}))/2;
            
            firstMax = max(violationbychoice);
            severity.(trialArray{ta})(1,1) = firstMax/(violationcounts.(trialArray{ta})); %calculates how many violations remain when the choice that makes the most number of violations is removed
            A = violationbychoice;
            if (max(A) ~= 0) && (max(A) ~= violationcounts.(trialArray{ta}))
                secondMax = max(A(A~=max(A)));
                if secondMax == 1;
                    secondMax = 0;
                end
            elseif (max(A) == 0) || (max(A) == violationcounts.(trialArray{ta}))
                secondMax = 0;
            end
            severity.(trialArray{ta})(1,2) = (firstMax + secondMax)/violationcounts.(trialArray{ta});
            
            violationperchoice.(trialArray{ta}) = violationbychoice;
            
            save('violationSeverity.mat','severity');
            save('violationMatrices.mat','violations');
            save('violationPerChoice.mat','violationperchoice');
            save('violationCounts.mat','violationcounts');
        elseif (trialArray{ta}) == 6
            set1 = preProcessed.threeItemGARP1213.revtasks;
            choice1 = preProcessed.threeItemGARP1213.choices;
            set2 = preProcessed.threeItemGARP1223.revtasks;
            choice2 = preProcessed.threeItemGARP1223.choices;
            set3 = preProcessed.threeItemGARP1323.revtasks;
            choice3 = preProcessed.threeItemGARP1323.choices;
            
            cross = zeros (length(set1),length(set1),length(set1));
            violation = zeros(length(set1),length(set1),length(set1));
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
            
            violations.(trialArray{ta}) = violation;
            violationperchoice.(trialArray{ta}) = violationbychoice;
            violationcounts.(trialArray{ta}) = nnz(violations.(trialArray{ta}));  %Do we divide by 3 here? or by 2? or something else!?
            save('violationMatrices.mat','violations');
            save('violationPerChoice.mat','violationperchoice');
            save('violationCounts.mat','violationcounts');
        end
    end
    
    
    cd('../');
    clearvars -except 'subjects', 'folder';
    
end
