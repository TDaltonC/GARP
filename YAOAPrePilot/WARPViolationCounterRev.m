cd('/Users/Niree/Documents/GitHub/GARP/YAOAprePilot/preProcessedRev/');
subjects = dir;

for folder = 1:length(subjects)
    if ismember((subjects(folder).name(1)),{'.','C','v','S','r'})
        continue
    end
   
    cd(subjects(folder).name);
    load('preProcessed.mat');
    
    trialArray = {'limitGARP', 'twoItemGARP', 'threeItemGARP1213', 'threeItemGARP1223', 'threeItemGARP1323'};
    
    for ta = 1:length(trialArray)
        if ismember((trialArray{ta}),[1 2 3 4 5]);
            if ismember((trialArray{ta}),[1 2])
                set = preProcessed.(trialArray{ta}).tasks;
                continue
            elseif ismember((trialArray{ta}),[3 4 5])
                set = preProcessed.(trialArray{ta}).revtasks;
                continue
            end
            choice = preProcessed.(trialArray{ta}).choices;
            cross = zeros(length(set));
            WARPviolation = zeros (length(set));
            WARPviolationbychoice = zeros(length(set),1);
            if trialArray{ta} == 1
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
            elseif trialArray{ta} == 2
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
            elseif trialArray{ta} == 3
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
            elseif trialArray{ta} == 4
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
            elseif trialArray{ta} == 5
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
            end
            WARPviolations.(trialArray{ta}) = WARPviolation;
            WARPviolationcounts.(trialArray{ta}) = nnz(WARPviolations.(trialArray{ta}))/2;
            firstMax = max(WARPviolationbychoice);
            WARPseverity.(trialArray{ta})(1,1) = firstMax/(WARPviolationcounts.(trialArray{ta}));
            A = WARPviolationbychoice;
            if (max(A) ~= 0) && (max(A) ~= WARPviolationcounts.(trialArray{ta}))
                secondMax = max(A(A~=max(A)));
                if secondMax == 1;
                    secondMax = 0;
                end
            elseif (max(A) == 0) || (max(A) == WARPviolationcounts.(trialArray{ta}))
                secondMax = 0;
            end
            WARPseverity.(trialArray{ta})(1,2) = (firstMax + secondMax)/WARPviolationcounts.(trialArray{ta});
            WARPviolationperchoice.(trialArray{ta}) = WARPviolationbychoice;
            save('WARPviolationSeverity.mat', 'WARPseverity');
            save('WARPviolationMatrices.mat','WARPviolations');
            save('WARPviolationPerChoice.mat','WARPviolationperchoice');
            save('WARPviolationCounts.mat','WARPviolationcounts');
        end
    end

    
    clearvars -except 'subjects' 'folder' 'trialArray'
    
    cd('../');
  

end
  