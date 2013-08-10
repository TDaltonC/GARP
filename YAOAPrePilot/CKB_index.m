 cd('/Users/Dalton/Documents/MATLAB/GARP/GARP/PrePilot/preProcessedRev');
subjects = dir;

for folder = 1:length(subjects)
    if subjects(folder).name(1) == '.';
        continue
    end
    if subjects(folder).name(1) == 'S';
        continue
    end
    cd(subjects(folder).name);
    load('preProcessed.mat');

set = preProcessed.limitGARP.tasks;

cross = zeros (length(set));
CKBindex = zeros (length(set));
i = 1;
j = 1;
for i = 1 : length(set);
    for j = 1 : length(set);
        if set(i,1) > set(j,1) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
           set(i,2) < set(j,2); % And line 'j' is on top of line 'i' on the right side
                cross(i,j) = 1;
                CKBindex(i,j) = abs(set(i,1) - set(j,1)) + abs(set(i,2) - set(j,2));
        end
        
        if set(i,1) == set(j,1) && ... % Do they cross so that line 'i' is on top of line 'j' on the left side
           set(i,2) > set(j,2); % As well as on the right side
                cross(i,j) = 1;
                CKBindex(i,j) = abs(set(i,1) - set(j,1)) + abs(set(i,2) - set(j,2));
        end
        
        if set(i,1) == set(j,1) && ... % Do they cross so that line 'j' is on top of line 'i' on the left side
           set(j,2) > set(i,2); % As well as on the right side
                cross(i,j) = 1;
                CKBindex(i,j) = abs(set(i,1) - set(j,1)) + abs(set(i,2) - set(j,2));
        end

        if set(i,1) < set(j,1) && ...  % Do they cross so that line 'j' is on top of line 'i' on the left side
           set(i,2) > set(j,2); % And line 'i' is on top of line 'j' on the right side
                cross(i,j) = 1;
                CKBindex(i,j) = abs(set(i,1) - set(j,1)) + abs(set(i,2) - set(j,2));
        end
        
        if set(i,1) > set(j,1) && ... % Do they cross so that line 'i' is on top of line 'j' on the right side
           set(i,2) == set(j,2); % As well as on the left side
                cross(i,j) = 1;
                CKBindex(i,j) = abs(set(i,1) - set(j,1)) + abs(set(i,2) - set(j,2));
        end
        
        if set(j,1) > set(i,1) && ... % Do they cross so that line 'j' is on top of line 'i' on the right side
           set(j,2) == set(i,2); % As well as on the left side
                cross(i,j) = 1;
                CKBindex(i,j) = abs(set(i,1) - set(j,1)) + abs(set(i,2) - set(j,2));
        end

    end
end
CKBwarp.oneItemGARP = CKBindex;
save('CKBIndex.mat','CKBwarp');


%%
set = preProcessed.twoItemGARP.tasks;

Price = zeros(length(set), 2);
for i = 1:length(set);
    Price(i,1) = (set(2,2,i)-set(1,2,i))/(set(1,1,i)-set(2,1,i));
    Price(i,2) = 1;
end

cross = zeros (length(set));
CKBindex = zeros (length(set));
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
                CKBindex(i,j) = sqrt((set(1,1,i) - set(1,1,j))^2 + (set(1,2,i) - set(1,2,j))^2) + ...
                                sqrt((set(2,1,i) - set(2,1,j))^2 + (set(2,2,i) - set(2,2,j))^2);
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
                CKBindex(i,j) = sqrt((set(1,1,i) - set(1,1,j))^2 + (set(1,2,i) - set(1,2,j))^2) + ...
                                sqrt((set(2,1,i) - set(2,1,j))^2 + (set(2,2,i) - set(2,2,j))^2);
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
                CKBindex(i,j) = sqrt((set(1,1,i) - set(1,1,j))^2 + (set(1,2,i) - set(1,2,j))^2) + ...
                                sqrt((set(2,1,i) - set(2,1,j))^2 + (set(2,2,i) - set(2,2,j))^2);
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
                CKBindex(i,j) = sqrt((set(1,1,i) - set(1,1,j))^2 + (set(1,2,i) - set(1,2,j))^2) + ...
                                sqrt((set(2,1,i) - set(2,1,j))^2 + (set(2,2,i) - set(2,2,j))^2);
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
                CKBindex(i,j) = sqrt((set(1,1,i) - set(1,1,j))^2 + (set(1,2,i) - set(1,2,j))^2) + ...
                                sqrt((set(2,1,i) - set(2,1,j))^2 + (set(2,2,i) - set(2,2,j))^2);
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
                CKBindex(i,j) = sqrt((set(1,1,i) - set(1,1,j))^2 + (set(1,2,i) - set(1,2,j))^2) + ...
                                sqrt((set(2,1,i) - set(2,1,j))^2 + (set(2,2,i) - set(2,2,j))^2);
               end
            end
        end
    end
end

CKBwarp.twoItemGARP = CKBindex;
save('CKBIndex.mat','CKBwarp');


%%
set = preProcessed.threeItemGARP1213.revtasks;

cross = zeros (length(set));
CKBindex = zeros (length(set));
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
                CKBindex(i,j) = sqrt((set(1,1,i) - set(1,1,j))^2 + (set(1,2,i) - set(1,2,j))^2) + ...
                                sqrt((set(2,1,i) - set(2,1,j))^2 + (set(2,2,i) - set(2,2,j))^2);
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
                CKBindex(i,j) = sqrt((set(1,1,i) - set(1,1,j))^2 + (set(1,2,i) - set(1,2,j))^2) + ...
                                sqrt((set(2,1,i) - set(2,1,j))^2 + (set(2,2,i) - set(2,2,j))^2);
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
                CKBindex(i,j) = sqrt((set(1,1,i) - set(1,1,j))^2 + (set(1,2,i) - set(1,2,j))^2) + ...
                                sqrt((set(2,1,i) - set(2,1,j))^2 + (set(2,2,i) - set(2,2,j))^2);
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
                CKBindex(i,j) = sqrt((set(1,1,i) - set(1,1,j))^2 + (set(1,2,i) - set(1,2,j))^2) + ...
                                sqrt((set(2,1,i) - set(2,1,j))^2 + (set(2,2,i) - set(2,2,j))^2);
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
                CKBindex(i,j) = sqrt((set(1,1,i) - set(1,1,j))^2 + (set(1,2,i) - set(1,2,j))^2) + ...
                                sqrt((set(2,1,i) - set(2,1,j))^2 + (set(2,2,i) - set(2,2,j))^2);
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
                CKBindex(i,j) = sqrt((set(1,1,i) - set(1,1,j))^2 + (set(1,2,i) - set(1,2,j))^2) + ...
                                sqrt((set(2,1,i) - set(2,1,j))^2 + (set(2,2,i) - set(2,2,j))^2);
               end
            end
        end
    end
end

CKBwarp.threeItemGARP1213 = CKBindex;
save('CKBIndex.mat','CKBwarp');


%%
set = preProcessed.threeItemGARP1223.revtasks;

cross = zeros (length(set));
CKBindex = zeros (length(set));
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
                CKBindex(i,j) = sqrt((set(1,1,i) - set(1,1,j))^2 + (set(1,2,i) - set(1,2,j))^2) + ...
                                sqrt((set(2,1,i) - set(2,1,j))^2 + (set(2,2,i) - set(2,2,j))^2);
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
                CKBindex(i,j) = sqrt((set(1,1,i) - set(1,1,j))^2 + (set(1,2,i) - set(1,2,j))^2) + ...
                                sqrt((set(2,1,i) - set(2,1,j))^2 + (set(2,2,i) - set(2,2,j))^2);
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
                CKBindex(i,j) = sqrt((set(1,1,i) - set(1,1,j))^2 + (set(1,2,i) - set(1,2,j))^2) + ...
                                sqrt((set(2,1,i) - set(2,1,j))^2 + (set(2,2,i) - set(2,2,j))^2);
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
                CKBindex(i,j) = sqrt((set(1,1,i) - set(1,1,j))^2 + (set(1,2,i) - set(1,2,j))^2) + ...
                                sqrt((set(2,1,i) - set(2,1,j))^2 + (set(2,2,i) - set(2,2,j))^2);
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
                CKBindex(i,j) = sqrt((set(1,1,i) - set(1,1,j))^2 + (set(1,2,i) - set(1,2,j))^2) + ...
                                sqrt((set(2,1,i) - set(2,1,j))^2 + (set(2,2,i) - set(2,2,j))^2);
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
                CKBindex(i,j) = sqrt((set(1,1,i) - set(1,1,j))^2 + (set(1,2,i) - set(1,2,j))^2) + ...
                                sqrt((set(2,1,i) - set(2,1,j))^2 + (set(2,2,i) - set(2,2,j))^2);
               end
            end
        end
    end
end

CKBwarp.threeItemGARP1223 = CKBindex;
save('CKBIndex.mat','CKBwarp');


%%
set = preProcessed.threeItemGARP1323.revtasks;

cross = zeros (length(set));
CKBindex = zeros (length(set));
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
                CKBindex(i,j) = sqrt((set(1,1,i) - set(1,1,j))^2 + (set(1,2,i) - set(1,2,j))^2) + ...
                                sqrt((set(2,1,i) - set(2,1,j))^2 + (set(2,2,i) - set(2,2,j))^2);
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
                CKBindex(i,j) = sqrt((set(1,1,i) - set(1,1,j))^2 + (set(1,2,i) - set(1,2,j))^2) + ...
                                sqrt((set(2,1,i) - set(2,1,j))^2 + (set(2,2,i) - set(2,2,j))^2);
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
                CKBindex(i,j) = sqrt((set(1,1,i) - set(1,1,j))^2 + (set(1,2,i) - set(1,2,j))^2) + ...
                                sqrt((set(2,1,i) - set(2,1,j))^2 + (set(2,2,i) - set(2,2,j))^2);
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
                CKBindex(i,j) = sqrt((set(1,1,i) - set(1,1,j))^2 + (set(1,2,i) - set(1,2,j))^2) + ...
                                sqrt((set(2,1,i) - set(2,1,j))^2 + (set(2,2,i) - set(2,2,j))^2);
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
                CKBindex(i,j) = sqrt((set(1,1,i) - set(1,1,j))^2 + (set(1,2,i) - set(1,2,j))^2) + ...
                                sqrt((set(2,1,i) - set(2,1,j))^2 + (set(2,2,i) - set(2,2,j))^2);
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
                CKBindex(i,j) = sqrt((set(1,1,i) - set(1,1,j))^2 + (set(1,2,i) - set(1,2,j))^2) + ...
                                sqrt((set(2,1,i) - set(2,1,j))^2 + (set(2,2,i) - set(2,2,j))^2);
               end
            end
        end
    end
end

CKBwarp.threeItemGARP1323 = CKBindex;
save('CKBIndex.mat','CKBwarp');

cd('../');
end
