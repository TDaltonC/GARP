cd('/Users/Niree/Documents/GitHub/GARP/YAOAprePilot/preProcessedRev/');
subjects = dir;
for folder = 1:length(subjects)
    if ismember(subjects(folder).name(1),{'.','..'})
        continue
    end
    cd(subjects(folder).name);
    load('preProcessed.mat');
    
    set = preProcessed.limitGARP.tasks;
    choice = preProcessed.limitGARP.choices;
    
    cross = zeros (length(set));
    WARPviolation = zeros (length(set));
    i = 1;
    j = 1;
    for i = 1 : length(set);
        for j = 1 : length(set);
            if set(i,1) > set(j,1) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
                    set(i,2) < set(j,2); % And line 'j' is on top of line 'i' on the right side
                cross(i,j) = 1;
                if choice(i) == 2 && ...
                        choice(j) == 1;
                    WARPviolation(i,j) = 1;
                end
            end
            
            if set(i,1) == set(j,1) && ... % Do they cross so that line 'i' is on top of line 'j' on the left side
                    set(i,2) > set(j,2); % As well as on the right side
                cross(i,j) = 1;
                if choice(i) == 1 && ...
                        choice(j) == 2;
                    WARPviolation(i,j) = 1;
                end
            end
            
            if set(i,1) == set(j,1) && ... % Do they cross so that line 'j' is on top of line 'i' on the left side
                    set(j,2) > set(i,2); % As well as on the right side
                cross(i,j) = 1;
                if choice(i) == 2 && ...
                        choice(j) == 1;
                    WARPviolation(i,j) = 1;
                end
            end
            
            if set(i,1) < set(j,1) && ...  % Do they cross so that line 'j' is on top of line 'i' on the left side
                    set(i,2) > set(j,2); % And line 'i' is on top of line 'j' on the right side
                cross(i,j) = 1;
                if choice(i) == 1 && ...
                        choice(j) == 2;
                    WARPviolation(i,j) = 1;
                end
            end
            
            if set(i,1) > set(j,1) && ... % Do they cross so that line 'i' is on top of line 'j' on the right side
                    set(i,2) == set(j,2); % As well as on the left side
                cross(i,j) = 1;
                if choice(i) == 2 && ...
                        choice(j) == 1;
                    WARPviolation(i,j) = 1;
                end
            end
            
            if set(j,1) > set(i,1) && ... % Do they cross so that line 'j' is on top of line 'i' on the right side
                    set(j,2) == set(i,2); % As well as on the left side
                cross(i,j) = 1;
                if choice(i) == 1 && ...
                        choice(j) == 2;
                    WARPviolation(i,j) = 1;
                end
            end
            
        end
        WARPviolationbychoice(i,1) = nnz(WARPviolation(i,:));
    end
    
    WARPviolations.limitGARP = WARPviolation;
    WARPviolationcounts.limitGARP = nnz(WARPviolations.limitGARP)/2;
    firstMax = max(WARPviolationbychoice);
    WARPseverity.limitGARP(1,1) = firstMax/WARPviolationcounts.limitGARP;
    A = WARPviolationbychoice;
    if (max(A) ~= 0) && (max(A) ~= WARPviolationcounts.limitGARP)
        secondMax = max(A(A~=max(A)));
        if secondMax == 1;
            secondMax = 0;
        end
    elseif (max(A) == 0) || (max(A) == WARPviolationcounts.limitGARP)
        secondMax = 0;
    end
    WARPseverity.limitGARP(1,2) = (firstMax + secondMax)/WARPviolationcounts.limitGARP;
    WARPviolationperchoice.limitGARP = WARPviolationbychoice;
    save('WARPviolationSeverity.mat', 'WARPseverity');
    save('WARPviolationMatrices.mat','WARPviolations');
    save('WARPviolationPerChoice.mat','WARPviolationperchoice');
    save('WARPviolationCounts.mat','WARPviolationcounts');
    
    
    %%
    set = preProcessed.twoItemGARP.tasks;
    choice = preProcessed.twoItemGARP.choices;
    
    Price = zeros(length(set), 2);
    for i = 1:length(set);
        Price(i,1) = (set(2,2,i)-set(1,2,i))/(set(1,1,i)-set(2,1,i));
        Price(i,2) = 1;
    end
    
    cross = zeros (length(set));
    WARPviolation = zeros (length(set));
    i = 1;
    j = 1;
    for i = 1 : length(set);
        for j = 1 : length(set);
            if set(1,1,i) >= set(1,1,j) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
                    set(1,2,i) >= set(1,2,j) && ...  %
                    set(2,1,i) <= set(2,1,j) && ...  % And have line 'j' above line line 'i' on the right
                    set(2,2,i) <= set(2,2,j);
                if (set(1,1,i) ~= set(1,1,j) ||...   %Then is first basket in 'i' not equal to the first basket in 'j'
                        set(1,2,i) ~= set(1,2,j));
                    if (set(2,1,i) ~= set(2,1,j) ||...%Then is second basket in 'i' not equal to the second basket in 'j'
                            set(2,2,i) ~= set(2,2,j));
                        cross(i,j) = 1;
                        if choice(i) == 2 && ...
                                choice(j) == 1;
                            WARPviolation(i,j) = 1;
                            %AEIMatrix(i,j) = max(dot(Price(i,:),set(1,:,j))/dot(Price(i,:),(set(2,:,i)))-eps, dot(Price(j,:),set(2,:,i))/dot(Price(j,:),set(1,:,j))-eps);
                        end
                    end
                end
            end
            if set(1,1,i) >= set(1,1,j) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
                    set(1,2,i) >= set(1,2,j) && ...  %
                    set(2,1,j) <= set(2,1,i) && ...  % As well as on the right side
                    set(2,2,j) <= set(2,2,i);
                if (set(1,1,i) == set(1,1,j) && ...   %Then is first basket in 'i' equal to the first basket in 'j'
                        set(1,2,i) == set(1,2,j));
                    if (set(2,1,i) ~= set(2,1,j) ||...%Then is second basket in 'i' not equal to the second basket in 'j'
                            set(2,2,i) ~= set(2,2,j));
                        cross(i,j) = 1;
                        if choice(i) == 1 && ...
                                choice(j) == 2;
                            WARPviolation(i,j) = 1;
                            % AEIMatrix(i,j) = max(dot(Price(i,:),set(1,:,j))/dot(Price(i,:),(set(2,:,i)))-eps, dot(Price(j,:),set(2,:,i))/dot(Price(j,:),set(1,:,j))-eps);
                        end
                    end
                end
            end
            if set(1,1,i) >= set(1,1,j) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
                    set(1,2,i) >= set(1,2,j) && ...  %
                    set(2,1,j) <= set(2,1,i) && ...  % As well as on the right side
                    set(2,2,j) <= set(2,2,i);
                if (set(1,1,i) ~= set(1,1,j) ||...   %Then is first basket in 'i' not equal to the first basket in 'j'
                        set(1,2,i) ~= set(1,2,j));
                    if (set(2,1,i) == set(2,1,j) &&...%Then is second basket in 'i' equal to the second basket in 'j'
                            set(2,2,i) == set(2,2,j));
                        cross(i,j) = 1;
                        if choice(i) == 2 && ...
                                choice(j) == 1;
                            WARPviolation(i,j) = 1;
                            %  AEIMatrix(i,j) = max(dot(Price(i,:),set(1,:,j))/dot(Price(i,:),(set(2,:,i)))-eps, dot(Price(j,:),set(2,:,i))/dot(Price(j,:),set(1,:,j))-eps);
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
                            WARPviolation(i,j) = 1;
                            % AEIMatrix(i,j) = max(dot(Price(i,:),set(1,:,j))/dot(Price(i,:),(set(2,:,i)))-eps, dot(Price(j,:),set(2,:,i))/dot(Price(j,:),set(1,:,j))-eps);
                        end
                    end
                end
            end
            if set(1,1,i) <= set(1,1,j) && ...   % Do they cross so that line 'j' is on top of line 'i' on the left side
                    set(1,2,i) <= set(1,2,j) && ...
                    set(2,1,j) >= set(2,1,i) && ...   % As well as on the right side
                    set(2,2,j) >= set(2,2,i);
                if (set(1,1,i) == set(1,1,j) &&...   % Then is first basket in 'j' equal to the first basket in 'i'
                        set(1,2,i) == set(1,2,j));
                    if (set(2,1,i) ~= set(2,1,j) ||...  % Then is second basket in 'j' not equal to the second basket in 'i'
                            set(2,2,i) ~= set(2,2,j));
                        cross(i,j) = 1;
                        if choice(i) == 2 && ...
                                choice(j) == 1;
                            WARPviolation(i,j) = 1;
                            % AEIMatrix(i,j) = max(dot(Price(i,:),set(1,:,j))/dot(Price(i,:),(set(2,:,i)))-eps, dot(Price(j,:),set(2,:,i))/dot(Price(j,:),set(1,:,j))-eps);
                        end
                    end
                end
            end
            if set(1,1,i) <= set(1,1,j) && ...   % Do they cross so that line 'j' is on top of line 'i' on the left side
                    set(1,2,i) <= set(1,2,j) && ...
                    set(2,1,j) >= set(2,1,i) && ...   % As well as on the right side
                    set(2,2,j) >= set(2,2,i);
                if (set(1,1,i) ~= set(1,1,j) ||...   % Then is first basket in 'j' not equal to the first basket in 'i'
                        set(1,2,i) ~= set(1,2,j));
                    if (set(2,1,i) == set(2,1,j) &&... % Then is second basket in 'j' equal to the second basket in 'i'
                            set(2,2,i) == set(2,2,j));
                        cross(i,j) = 1;
                        if choice(i) == 1 && ...
                                choice(j) == 2;
                            WARPviolation(i,j) = 1;
                            % AEIMatrix(i,j) = max(dot(Price(i,:),set(1,:,j))/dot(Price(i,:),(set(2,:,i)))-eps, dot(Price(j,:),set(2,:,i))/dot(Price(j,:),set(1,:,j))-eps);
                        end
                    end
                end
            end
        end
        WARPviolationbychoice(i,1) = nnz(WARPviolation(i,:));
    end
    
    WARPviolations.twoItemGARP = WARPviolation;
    WARPviolationcounts.twoItemGARP = nnz(WARPviolations.twoItemGARP)/2;
    firstMax = max(WARPviolationbychoice);
    WARPseverity.twoItemGARP(1,1) = firstMax/(WARPviolationcounts.twoItemGARP);
    A = WARPviolationbychoice;
    if (max(A) ~= 0) && (max(A) ~= WARPviolationcounts.twoItemGARP)
        secondMax = max(A(A~=max(A)));
        if secondMax == 1;
            secondMax = 0;
        end
    elseif (max(A) == 0) || (max(A) == WARPviolationcounts.twoItemGARP)
        secondMax = 0;
    end
    WARPseverity.twoItemGARP(1,2) = (firstMax + secondMax)/WARPviolationcounts.twoItemGARP;
    WARPviolationperchoice.twoItemGARP = WARPviolationbychoice;
    save('WARPviolationSeverity.mat', 'WARPseverity');
    save('WARPviolationMatrices.mat','WARPviolations');
    save('WARPviolationPerChoice.mat','WARPviolationperchoice');
    save('WARPviolationCounts.mat','WARPviolationcounts');
    
    %%
    set = preProcessed.threeItemGARP1213.revtasks;
    choice = preProcessed.threeItemGARP1213.choices;
    
    cross = zeros (length(set));
    WARPviolation = zeros (length(set));
    i = 1;
    j = 1;
    for i = 1 : length(set);
        for j = 1 : length(set);
            if set(1,1,i) >= set(1,1,j) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
                    set(1,2,i) >= set(1,2,j) && ...  %
                    set(2,1,i) <= set(2,1,j) && ...  % And have line 'j' above line line 'i' on the right
                    set(2,3,i) <= set(2,3,j);
                if (set(1,1,i) ~= set(1,1,j) ||...   %Then is first basket in 'i' not equal to the first basket in 'j'
                        set(1,2,i) ~= set(1,2,j));
                    if (set(2,1,i) ~= set(2,1,j) ||...%Then is second basket in 'i' not equal to the second basket in 'j'
                            set(2,3,i) ~= set(2,3,j));
                        cross(i,j) = 1;
                        if choice(i) == 2 && ...
                                choice(j) == 1;
                            WARPviolation(i,j) = 1;
                        end
                    end
                end
            end
            if set(1,1,i) >= set(1,1,j) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
                    set(1,2,i) >= set(1,2,j) && ...  %
                    set(2,1,i) <= set(2,1,j) && ...  % As well as on the right side
                    set(2,3,i) <= set(2,3,j);
                if (set(1,1,i) == set(1,1,j) &&...   %Then is first basket in 'i' equal to the first basket in 'j'
                        set(1,2,i) == set(1,2,j));
                    if (set(2,1,i) ~= set(2,1,j) ||...%Then is second basket in 'i' not equal to the second basket in 'j'
                            set(2,3,i) ~= set(2,3,j));
                        cross(i,j) = 1;
                        if choice(i) == 1 && ...
                                choice(j) == 2;
                            WARPviolation(i,j) = 1;
                        end
                    end
                end
            end
            if set(1,1,i) >= set(1,1,j) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
                    set(1,2,i) >= set(1,2,j) && ...  %
                    set(2,1,i) <= set(2,1,j) && ...  % As well as on the right side
                    set(2,3,i) <= set(2,3,j);
                if (set(1,1,i) ~= set(1,1,j) ||...   %Then is first basket in 'i' not equal to the first basket in 'j'
                        set(1,2,i) ~= set(1,2,j));
                    if (set(2,1,i) == set(2,1,j) &&...%Then is second basket in 'i' equal to the second basket in 'j'
                            set(2,3,i) == set(2,3,j));
                        cross(i,j) = 1;
                        if choice(i) == 2 && ...
                                choice(j) == 1;
                            WARPviolation(i,j) = 1;
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
                            WARPviolation(i,j) = 1;
                        end
                    end
                end
            end
            if set(1,1,i) <= set(1,1,j) && ...   % Vice Versa
                    set(1,2,i) <= set(1,2,j) && ...
                    set(2,1,i) >= set(2,1,j) && ...
                    set(2,3,i) >= set(2,3,j);
                if (set(1,1,i) == set(1,1,j) &&... %Then is first basket in 'i' equal to the first basket in 'j'
                        set(1,2,i) == set(1,2,j));
                    if (set(2,1,i) ~= set(2,1,j) ||... %Then is second basket in 'i' not equal to the second basket in 'j'
                            set(2,3,i) ~= set(2,3,j));
                        cross(i,j) = 1;
                        if choice(i) == 2 && ...
                                choice(j) == 1;
                            WARPviolation(i,j) = 1;
                        end
                    end
                end
            end
            if set(1,1,i) <= set(1,1,j) && ...   % Vice Versa
                    set(1,2,i) <= set(1,2,j) && ...
                    set(2,1,i) >= set(2,1,j) && ...
                    set(2,3,i) >= set(2,3,j);
                if (set(1,1,i) ~= set(1,1,j) ||... %Then is first basket in 'i' not equal to the first basket in 'j'
                        set(1,2,i) ~= set(1,2,j));
                    if (set(2,1,i) == set(2,1,j) &&... %Then is second basket in 'i' equal to the second basket in 'j'
                            set(2,3,i) == set(2,3,j));
                        cross(i,j) = 1;
                        if choice(i) == 1 && ...
                                choice(j) == 2;
                            WARPviolation(i,j) = 1;
                        end
                    end
                end
            end
        end
        WARPviolationbychoice(i,1) = nnz(WARPviolation(i,:));
    end
    
    WARPviolations.threeItemGARP1213 = WARPviolation;
    WARPviolationcounts.threeItemGARP1213 = nnz(WARPviolations.threeItemGARP1213)/2;
    firstMax = max(WARPviolationbychoice);
    WARPseverity.threeItemGARP1213(1,1) = firstMax/(WARPviolationcounts.threeItemGARP1213);
    A = WARPviolationbychoice;
    if (max(A) ~= 0) && (max(A) ~= WARPviolationcounts.threeItemGARP1213)
        secondMax = max(A(A~=max(A)));
        if secondMax == 1;
            secondMax = 0;
        end
    elseif (max(A) == 0) || (max(A) == WARPviolationcounts.threeItemGARP1213)
        secondMax = 0;
    end
    WARPseverity.threeItemGARP1213(1,2) = (firstMax + secondMax)/WARPviolationcounts.threeItemGARP1213;
    WARPviolationperchoice.threeItemGARP1213 = WARPviolationbychoice;
    save('WARPviolationSeverity.mat', 'WARPseverity');
    save('WARPviolationMatrices.mat','WARPviolations');
    save('WARPviolationPerChoice.mat','WARPviolationperchoice');
    save('WARPviolationCounts.mat','WARPviolationcounts');
    
    %%
    set = preProcessed.threeItemGARP1223.revtasks;
    choice = preProcessed.threeItemGARP1223.choices;
    
    cross = zeros (length(set));
    WARPviolation = zeros (length(set));
    i = 1;
    j = 1;
    
    for i = 1 : length(set);
        for j = 1 : length(set);
            if set(1,1,i) >= set(1,1,j) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
                    set(1,2,i) >= set(1,2,j) && ...  %
                    set(2,2,i) <= set(2,2,j) && ...  % And have line 'j' above line line 'i' on the right
                    set(2,3,i) <= set(2,3,j);
                if (set(1,1,i) ~= set(1,1,j) ||...   %Then is first basket in 'i' not equal to the first basket in 'j'
                        set(1,2,i) ~= set(1,2,j));
                    if (set(2,2,i) ~= set(2,2,j) ||...%Then is second basket in 'i' not equal to the second basket in 'j'
                            set(2,3,i) ~= set(2,3,j));
                        cross(i,j) = 1;
                        if choice(i) == 2 && ...
                                choice(j) == 1;
                            WARPviolation(i,j) = 1;
                        end
                    end
                end
            end
            if set(1,1,i) >= set(1,1,j) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
                    set(1,2,i) >= set(1,2,j) && ...  %
                    set(2,2,i) <= set(2,2,j) && ...  % And have line 'j' above line line 'i' on the right
                    set(2,3,i) <= set(2,3,j);
                if (set(1,1,i) == set(1,1,j) &&...   %Then is first basket in 'i' equal to the first basket in 'j'
                        set(1,2,i) == set(1,2,j));
                    if (set(2,2,i) ~= set(2,2,j) ||...%Then is second basket in 'i' not equal to the second basket in 'j'
                            set(2,3,i) ~= set(2,3,j));
                        cross(i,j) = 1;
                        if choice(i) == 1 && ...
                                choice(j) == 2;
                            WARPviolation(i,j) = 1;
                        end
                    end
                end
            end
            if set(1,1,i) >= set(1,1,j) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
                    set(1,2,i) >= set(1,2,j) && ...  %
                    set(2,2,i) <= set(2,2,j) && ...  % And have line 'j' above line line 'i' on the right
                    set(2,3,i) <= set(2,3,j);
                if (set(1,1,i) ~= set(1,1,j) ||...   %Then is first basket in 'i' not equal to the first basket in 'j'
                        set(1,2,i) ~= set(1,2,j));
                    if (set(2,2,i) == set(2,2,j) &&...%Then is second basket in 'i' equal to the second basket in 'j'
                            set(2,3,i) == set(2,3,j));
                        cross(i,j) = 1;
                        if choice(i) == 2 && ...
                                choice(j) == 1;
                            WARPviolation(i,j) = 1;
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
                            WARPviolation(i,j) = 1;
                        end
                    end
                end
            end
            if set(1,1,i) <= set(1,1,j) && ...   % Vice Versa
                    set(1,2,i) <= set(1,2,j) && ...
                    set(2,2,i) >= set(2,2,j) && ...
                    set(2,3,i) >= set(2,3,j);
                if (set(1,1,i) == set(1,1,j) &&... %Then is first basket in 'i' equal to the first basket in 'j'
                        set(1,2,i) == set(1,2,j));
                    if (set(2,2,i) ~= set(2,2,j) ||... %Then is second basket in 'i' not equal to the second basket in 'j'
                            set(2,3,i) ~= set(2,3,j));
                        cross(i,j) = 1;
                        if choice(i) == 2 && ...
                                choice(j) == 1;
                            WARPviolation(i,j) = 1;
                        end
                    end
                end
            end
            if set(1,1,i) <= set(1,1,j) && ...   % Vice Versa
                    set(1,2,i) <= set(1,2,j) && ...
                    set(2,2,i) >= set(2,2,j) && ...
                    set(2,3,i) >= set(2,3,j);
                if (set(1,1,i) ~= set(1,1,j) ||... %Then is first basket in 'i' not equal to the first basket in 'j'
                        set(1,2,i) ~= set(1,2,j));
                    if (set(2,2,i) == set(2,2,j) &&... %Then is second basket in 'i' equal to the second basket in 'j'
                            set(2,3,i) == set(2,3,j));
                        cross(i,j) = 1;
                        if choice(i) == 1 && ...
                                choice(j) == 2;
                            WARPviolation(i,j) = 1;
                        end
                    end
                end
            end
        end
        WARPviolationbychoice(i,1) = nnz(WARPviolation(i,:));
    end
    
    WARPviolations.threeItemGARP1223 = WARPviolation;
    WARPviolationcounts.threeItemGARP1223 = nnz(WARPviolations.threeItemGARP1223)/2;
    firstMax = max(WARPviolationbychoice);
    WARPseverity.threeItemGARP1223(1,1) = firstMax/(WARPviolationcounts.threeItemGARP1223);
    A = WARPviolationbychoice;
    if (max(A) ~= 0) && (max(A) ~= WARPviolationcounts.threeItemGARP1223)
        secondMax = max(A(A~=max(A)));
        if secondMax == 1;
            secondMax = 0;
        end
    elseif (max(A) == 0) || (max(A) == WARPviolationcounts.threeItemGARP1223)
        secondMax = 0;
    end
    WARPseverity.threeItemGARP1223(1,2) = (firstMax + secondMax)/WARPviolationcounts.threeItemGARP1223;
    WARPviolationperchoice.threeItemGARP1223 = WARPviolationbychoice;
    save('WARPviolationSeverity.mat', 'WARPseverity');
    save('WARPviolationMatrices.mat','WARPviolations');
    save('WARPviolationPerChoice.mat','WARPviolationperchoice');
    save('WARPviolationCounts.mat','WARPviolationcounts');
    
    %%
    set = preProcessed.threeItemGARP1323.revtasks;
    choice = preProcessed.threeItemGARP1323.choices;
    
    cross = zeros (length(set));
    WARPviolation = zeros (length(set));
    i = 1;
    j = 1;
    for i = 1 : length(set);
        for j = 1 : length(set);
            if set(1,1,i) >= set(1,1,j) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
                    set(1,3,i) >= set(1,3,j) && ...  %
                    set(2,2,i) <= set(2,2,j) && ...  % And have line 'j' above line line 'i' on the right
                    set(2,3,i) <= set(2,3,j);
                if (set(1,1,i) ~= set(1,1,j) ||...   %Then is first basket in 'i' not equal to the first basket in 'j'
                        set(1,3,i) ~= set(1,3,j));
                    if (set(2,2,i) ~= set(2,2,j) ||...%Then is second basket in 'i' not equal to the second basket in 'j'
                            set(2,3,i) ~= set(2,3,j));
                        cross(i,j) = 1;
                        if choice(i) == 2 && ...
                                choice(j) == 1;
                            WARPviolation(i,j) = 1;
                        end
                    end
                end
            end
            if set(1,1,i) >= set(1,1,j) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
                    set(1,3,i) >= set(1,3,j) && ...  %
                    set(2,2,i) <= set(2,2,j) && ...  % And have line 'j' above line line 'i' on the right
                    set(2,3,i) <= set(2,3,j);
                if (set(1,1,i) == set(1,1,j) &&...   %Then is first basket in 'i' equal to the first basket in 'j'
                        set(1,3,i) == set(1,3,j));
                    if (set(2,2,i) ~= set(2,2,j) ||...%Then is second basket in 'i' not equal to the second basket in 'j'
                            set(2,3,i) ~= set(2,3,j));
                        cross(i,j) = 1;
                        if choice(i) == 1 && ...
                                choice(j) == 2;
                            WARPviolation(i,j) = 1;
                        end
                    end
                end
            end
            if set(1,1,i) >= set(1,1,j) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
                    set(1,3,i) >= set(1,3,j) && ...  %
                    set(2,2,i) <= set(2,2,j) && ...  % And have line 'j' above line line 'i' on the right
                    set(2,3,i) <= set(2,3,j);
                if (set(1,1,i) ~= set(1,1,j) ||...   %Then is first basket in 'i' not equal to the first basket in 'j'
                        set(1,3,i) ~= set(1,3,j));
                    if (set(2,2,i) == set(2,2,j) &&...%Then is second basket in 'i' equal to the second basket in 'j'
                            set(2,3,i) == set(2,3,j));
                        cross(i,j) = 1;
                        if choice(i) == 2 && ...
                                choice(j) == 1;
                            WARPviolation(i,j) = 1;
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
                            WARPviolation(i,j) = 1;
                        end
                    end
                end
            end
            if set(1,1,i) <= set(1,1,j) && ...   % Vice Versa
                    set(1,3,i) <= set(1,3,j) && ...
                    set(2,2,i) >= set(2,2,j) && ...
                    set(2,3,i) >= set(2,3,j);
                if (set(1,1,i) == set(1,1,j) &&... %Then is first basket in 'i' equal to the first basket in 'j'
                        set(1,3,i) == set(1,3,j));
                    if (set(2,2,i) ~= set(2,2,j) ||... %Then is second basket in 'i' not equal to the second basket in 'j'
                            set(2,3,i) ~= set(2,3,j));
                        cross(i,j) = 1;
                        if choice(i) == 2 && ...
                                choice(j) == 1;
                            WARPviolation(i,j) = 1;
                        end
                    end
                end
            end
            if set(1,1,i) <= set(1,1,j) && ...   % Vice Versa
                    set(1,3,i) <= set(1,3,j) && ...
                    set(2,2,i) >= set(2,2,j) && ...
                    set(2,3,i) >= set(2,3,j);
                if (set(1,1,i) ~= set(1,1,j) ||... %Then is first basket in 'i' not equal to the first basket in 'j'
                        set(1,3,i) ~= set(1,3,j));
                    if (set(2,2,i) == set(2,2,j) &&... %Then is second basket in 'i' not equal to the second basket in 'j'
                            set(2,3,i) == set(2,3,j));
                        cross(i,j) = 1;
                        if choice(i) == 1 && ...
                                choice(j) == 2;
                            WARPviolation(i,j) = 1;
                        end
                    end
                end
            end
        end
        WARPviolationbychoice(i,1) = nnz(WARPviolation(i,:));
    end
    
    WARPviolations.threeItemGARP1323 = WARPviolation;
    WARPviolationcounts.threeItemGARP1323 = nnz(WARPviolations.threeItemGARP1323)/2;
    firstMax = max(WARPviolationbychoice);
    WARPseverity.threeItemGARP1323(1,1) = firstMax/(WARPviolationcounts.threeItemGARP1323);
    A = WARPviolationbychoice;
    if (max(A) ~= 0) && (max(A) ~= WARPviolationcounts.threeItemGARP1323)
        secondMax = max(A(A~=max(A)));
        if secondMax == 1;
            secondMax = 0;
        end
    elseif (max(A) == 0) || (max(A) == WARPviolationcounts.threeItemGARP1323)
        secondMax = 0;
    end
    WARPseverity.threeItemGARP1323(1,2) = (firstMax + secondMax)/WARPviolationcounts.threeItemGARP1323;
    WARPviolationperchoice.threeItemGARP1323 = WARPviolationbychoice;
    save('WARPviolationSeverity.mat', 'WARPseverity');
    save('WARPviolationMatrices.mat','WARPviolations');
    save('WARPviolationPerChoice.mat','WARPviolationperchoice');
    save('WARPviolationCounts.mat','WARPviolationcounts');


cd('../')

end
