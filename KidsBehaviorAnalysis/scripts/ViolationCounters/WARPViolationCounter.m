% cd('/Users/Niree/Documents/GitHub/GARP/prePilot/preProcessedRev/');
cd('/Users/Niree/Documents/GitHub/GARP/YAOAExperiment/preProcessedRev/');
subjects = dir;
for folder = 1:length(subjects)
    if subjects(folder).name(1) == '.';
        continue
    end
    cd(subjects(folder).name);
    load('preProcessed.mat');

set = preProcessed.catch.tasks;
choice = preProcessed.catch.choices;

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
end
WARPviolations.catch = WARPviolation;
WARPviolationcounts.catch = nnz(WARPviolations.catch)/2;
save('WARPviolationMatrices.mat','WARPviolations');
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
end

WARPviolations.twoItemGARP = WARPviolation;
WARPviolationcounts.twoItemGARP = nnz(WARPviolations.twoItemGARP)/2;
save('WARPviolationMatrices.mat','WARPviolations');
save('WARPviolationCounts.mat','WARPviolationcounts');

%%
set = preProcessed.threeItemGARP3435.revtasks;
choice = preProcessed.threeItemGARP3435.choices;

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
end

WARPviolations.threeItemGARP3435 = WARPviolation;
WARPviolationcounts.threeItemGARP3435 = nnz(WARPviolations.threeItemGARP3435)/2;
save('WARPviolationMatrices.mat','WARPviolations');
save('WARPviolationCounts.mat','WARPviolationcounts');

%%
set = preProcessed.threeItemGARP3445.revtasks;
choice = preProcessed.threeItemGARP3445.choices;

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
end

WARPviolations.threeItemGARP3445 = WARPviolation;
WARPviolationcounts.threeItemGARP3445 = nnz(WARPviolations.threeItemGARP3445)/2;
save('WARPviolationMatrices.mat','WARPviolations');
save('WARPviolationCounts.mat','WARPviolationcounts');

%%
set = preProcessed.threeItemGARP3545.revtasks;
choice = preProcessed.threeItemGARP3545.choices;

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
end

WARPviolations.threeItemGARP3545 = WARPviolation;
WARPviolationcounts.threeItemGARP3545 = nnz(WARPviolations.threeItemGARP3545)/2;
save('WARPviolationMatrices.mat','WARPviolations');
save('WARPviolationCounts.mat','WARPviolationcounts');
cd('../');

end


