cd('/Users/Niree/Documents/MATLAB/GARP/preProcessed/');
subjects = dir;
for folder = 1:length(subjects)
    if subjects(folder).name(1) == '.';
        continue
    end
    cd(subjects(folder).name);
    load('preProcessed.mat');
    
set1 = preProcessed.threeItemGARP1213.revtasks;
choice1 = preProcessed.threeItemGARP1213.choices;
set2 = preProcessed.threeItemGARP1223.revtasks;
choice2 = preProcessed.threeItemGARP1223.choices;
set3 = preProcessed.threeItemGARP1323.revtasks;
choice3 = preProcessed.threeItemGARP1323.choices;

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
end

violations.threeItemCyclical = violation;
violationcounts.threeItemCyclical = nnz(violations.threeItemCyclical)/3;  %Do we divide by 3 here? or by 2? or something else!?
save('violationMatrices.mat','violations');
save('violationCounts.mat','violationcounts');

cd('../');

end