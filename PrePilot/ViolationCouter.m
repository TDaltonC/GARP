cd('/Users/Dalton/Documents/MATLAB/GARP/GARP/PrePilot/preProcessed');
subjects = dir;
for folder = 1:length(subjects)
    if subjects(folder).name(1) == '.';
        continue
    end
    cd(subjects(folder).name);
load('preProcessed.mat');

set = preProcessed.limitGARP.tasks;
choice = preProcessed.limitGARP.choices;

cross = zeros (length(set));
violation = zeros (length(set));
i = 1;
j = 1;
for i = 1 : length(set);
    for j = 1 : length(set);
        if set(i,1) > set(j,1) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
           set(i,2) < set(j,2);
                cross(i,j) = 1;
                if choice(i) == 2 && ...
                   choice(j) == 1;
                    violation(i,j) = 1;
                end
        end

        if set(i,1) < set(j,1) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
           set(i,2) > set(j,2);
                cross(i,j) = 1;
                if choice(i) == 1 && ...
                   choice(j) == 2;
                    violation(i,j) = 1;
                end
        end

    end
end
violations.limitGARP = violation;
save('violationMatrices.mat','violations')
%%
set = preProcessed.twoItemGARP.tasks;
choice = preProcessed.twoItemGARP.choices;

cross = zeros (length(set));
violation = zeros (length(set));
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
                    violation(i,j) = 1;
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
                end
               end
            end
        end
    end
end
violations.twoItemGARP = violation;
save('violationMatrices.mat','violations')
%%
set = preProcessed.threeItemGARP1213.tasks;
choice = preProcessed.threeItemGARP1213.choices;

cross = zeros (length(set));
violation = zeros (length(set));
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
                    violation(i,j) = 1;
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
                end
               end
            end
        end
    end
end
violations.threeItemGARP1213 = violation;
save('violationMatrices.mat','violations')
%%
set = preProcessed.threeItemGARP1223.tasks;
choice = preProcessed.threeItemGARP1223.choices;

cross = zeros (length(set));
violation = zeros (length(set));
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
                    violation(i,j) = 1;
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
                end
               end
            end
        end
    end
end
violations.threeItemGARP1223 = violation;
save('violationMatrices.mat','violations')
%%
set = preProcessed.threeItemGARP1323.tasks;
choice = preProcessed.threeItemGARP1323.choices;

cross = zeros (length(set));
violation = zeros (length(set));
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
                    violation(i,j) = 1;
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
                end
               end
            end
        end
    end
end
violations.threeItemGARP1323 = violation;
save('violationMatrices.mat','violations')
cd('../');
end