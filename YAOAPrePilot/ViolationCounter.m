
% cd('/Users/Dalton/Documents/MATLAB/GARP/GARP/PrePilot/preProcessedRev');
cd('C:/Users/Niree/Documents/GitHub/GARP/YAOAPrePilot/preProcessedRev');
subjects = dir;

for folder = 1:length(subjects)
    if ismember((subjects(folder).name(1)), {'.','C','r','S','v'});
        continue
    end
   
    cd(subjects(folder).name);
    load('preProcessed.mat');

set = preProcessed.limitGARP.tasks;
choice = preProcessed.limitGARP.choices;

[violation, violationbychoice] = limitGARPViolationCounter(set,choice);

[ firstMax, secondMax, thirdMax, fourthMax, fifthMax, sixthMax, violations ] = limitGARPChoiceOmit( violation, violationbychoice, set );

violations.limitGARP = violations;
violationcounts.limitGARP = nnz(violations.limitGARP)/2;

% choice2 = choice;
% if choice(firstMax,1) == 1
%     choice2(firstMax,1) = 2;
% elseif choice(firstMax,1) == 2
%     choice2(firstMax,1) = 1;
% end
% 
% choice = choice2;
% [violation, violationbychoice] = limitGARPViolationCounter(set,choice);

severity.limitGARP(1,1) = firstMax/(violationcounts.limitGARP); %calculates how many violations remain when the choice that makes the most number of violations is removed
severity.limitGARP(1,2) = (firstMax + secondMax)/violationcounts.limitGARP;
severity.limitGARP(1,3) = (firstMax + secondMax + thirdMax)/violationcounts.limitGARP;
severity.limitGARP(1,4) = (firstMax + secondMax + thirdMax + fourthMax)/violationcounts.limitGARP;
severity.limitGARP(1,5) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax)/violationcounts.limitGARP;
severity.limitGARP(1,6) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax + sixthMax)/violationcounts.limitGARP;
violationperchoice.limitGARP = violationbychoice;

save('violationSeverity.mat','severity');
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

[violation, violationbychoice] = twoItemGARPViolationCounter(set,choice);

violations.twoItemGARP = violation;
violationcounts.twoItemGARP = nnz(violations.twoItemGARP)/2;

[ firstMax, secondMax, thirdMax, fourthMax, fifthMax, sixthMax, violations ] = twoItemGARPChoiceOmit( violation, violationbychoice, set );

violations.twoItemGARP = violations;
violationcounts.twoItemGARP = nnz(violations.twoItemGARP)/2;

severity.twoItemGARP(1,1) = firstMax/violationcounts.twoItemGARP; %calculates how many violations remain when the choice that makes the most number of violations is removed
severity.twoItemGARP(1,2) = (firstMax + secondMax)/violationcounts.twoItemGARP;
severity.twoItemGARP(1,3) = (firstMax + secondMax + thirdMax)/violationcounts.twoItemGARP;
severity.twoItemGARP(1,4) = (firstMax + secondMax + thirdMax + fourthMax)/violationcounts.twoItemGARP;
severity.twoItemGARP(1,5) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax)/violationcounts.twoItemGARP;
severity.twoItemGARP(1,6) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax + sixthMax)/violationcounts.twoItemGARP;
violationperchoice.twoItemGARP = violationbychoice;

save('violationSeverity.mat','severity');
save('violationMatrices.mat','violations');
save('violationPerChoice.mat','violationperchoice');
save('violationCounts.mat','violationcounts');
%%
set = preProcessed.threeItemGARP1213.revtasks;
choice = preProcessed.threeItemGARP1213.choices;

[violation, violationbychoice] = threeItemGARP1213ViolationCounter(set,choice);

violations.threeItemGARP1213 = violation;
violationcounts.threeItemGARP1213 = nnz(violations.threeItemGARP1213)/2;

[ firstMax, secondMax, thirdMax, fourthMax, fifthMax, sixthMax, violations ] = threeItemGARP1213ChoiceOmit( violation, violationbychoice, set );

violations.threeItemGARP1213 = violations;
violationcounts.threeItemGARP1213 = nnz(violations.threeItemGARP1213)/2;

severity.threeItemGARP1213(1,1) = firstMax/(violationcounts.threeItemGARP1213); %calculates how many violations remain when the choice that makes the most number of violations is removed
severity.threeItemGARP1213(1,2) = (firstMax + secondMax)/violationcounts.threeItemGARP1213;
severity.threeItemGARP1213(1,3) = (firstMax + secondMax + thirdMax)/violationcounts.threeItemGARP1213;
severity.threeItemGARP1213(1,4) = (firstMax + secondMax + thirdMax + fourthMax)/violationcounts.threeItemGARP1213;
severity.threeItemGARP1213(1,5) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax)/violationcounts.threeItemGARP1213;
severity.threeItemGARP1213(1,6) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax + sixthMax)/violationcounts.threeItemGARP1213;
violationperchoice.threeItemGARP1213 = violationbychoice;

save('violationSeverity.mat','severity');
save('violationMatrices.mat','violations');
save('violationPerChoice.mat','violationperchoice');
save('violationCounts.mat','violationcounts');
%%
set = preProcessed.threeItemGARP1223.revtasks;
choice = preProcessed.threeItemGARP1223.choices;

[violation, violationbychoice] = threeItemGARP1223ViolationCounter(set, choice);

violations.threeItemGARP1223 = violation;
violationcounts.threeItemGARP1223 = nnz(violations.threeItemGARP1223)/2;

[ firstMax, secondMax, thirdMax, fourthMax, fifthMax, sixthMax, violations ] = threeItemGARP1223ChoiceOmit( violation, violationbychoice, set );

violations.threeItemGARP1223 = violations;
violationcounts.threeItemGARP1223 = nnz(violations.threeItemGARP1223)/2;

severity.threeItemGARP1223(1,1) = firstMax/violationcounts.threeItemGARP1223; %calculates how many violations remain when the choice that makes the most number of violations is removed
severity.threeItemGARP1223(1,2) = (firstMax + secondMax)/violationcounts.threeItemGARP1223;
severity.threeItemGARP1223(1,3) = (firstMax + secondMax + thirdMax)/violationcounts.threeItemGARP1223;
severity.threeItemGARP1223(1,4) = (firstMax + secondMax + thirdMax + fourthMax)/violationcounts.threeItemGARP1223;
severity.threeItemGARP1223(1,5) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax)/violationcounts.threeItemGARP1223;
severity.threeItemGARP1223(1,6) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax + sixthMax)/violationcounts.threeItemGARP1223;
violationperchoice.threeItemGARP1223 = violationbychoice;

save('violationSeverity.mat','severity');
save('violationMatrices.mat','violations');
save('violationPerChoice.mat','violationperchoice');
save('violationCounts.mat','violationcounts');
%%
set = preProcessed.threeItemGARP1323.revtasks;
choice = preProcessed.threeItemGARP1323.choices;

[violation, violationbychoice] = threeItemGARP1323ViolationCounter(set, choice);

violations.threeItemGARP1323 = violation;
violationcounts.threeItemGARP1323 = nnz(violations.threeItemGARP1323)/2;

[ firstMax, secondMax, thirdMax, fourthMax, fifthMax, sixthMax, violations ] = threeItemGARP1323ChoiceOmit( violation, violationbychoice, set );

violations.threeItemGARP1323 = violations;
violationcounts.threeItemGARP1323 = nnz(violations.threeItemGARP1323)/2;

severity.threeItemGARP1323(1,1) = firstMax/(violationcounts.threeItemGARP1323); %calculates how many violations remain when the choice that makes the most number of violations is removed
severity.threeItemGARP1323(1,2) = (firstMax + secondMax)/violationcounts.threeItemGARP1323;
severity.threeItemGARP1323(1,3) = (firstMax + secondMax + thirdMax)/violationcounts.threeItemGARP1323;
severity.threeItemGARP1323(1,4) = (firstMax + secondMax + thirdMax + fourthMax)/violationcounts.threeItemGARP1323;
severity.threeItemGARP1323(1,5) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax)/violationcounts.threeItemGARP1323;
severity.threeItemGARP1323(1,6) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax + sixthMax)/violationcounts.threeItemGARP1323;
violationperchoice.threeItemGARP1323 = violationbychoice;

save('violationSeverity.mat','severity');
save('violationMatrices.mat','violations');
save('violationPerChoice.mat','violationperchoice');
save('violationCounts.mat','violationcounts');
%%
%Cyclical Violation Counter
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

cd('/Users/Niree/Documents/GitHub/GARP/YAOAPrePilot/preProcessedRev');

for folder = 1:length(subjects)
    if ismember((subjects(folder).name(1)), {'.','C','r','S','v'});
        continue
    end
    cd(subjects(folder).name);
    load ('violationSeverity.mat');
    load('preProcessed.mat');
    
    violationSeveritySummary(folder,1) = preProcessed.subjID;
    violationSeveritySummary(folder,2) = severity.limitGARP(1);
    violationSeveritySummary(folder,3) = severity.limitGARP(2);
    violationSeveritySummary(folder,4) = severity.limitGARP(3);
    violationSeveritySummary(folder,5) = severity.limitGARP(4);
    violationSeveritySummary(folder,6) = severity.limitGARP(5);
    violationSeveritySummary(folder,7) = severity.limitGARP(6);
    violationSeveritySummary(folder,8) = severity.twoItemGARP(1);
    violationSeveritySummary(folder,9) = severity.twoItemGARP(2);
    violationSeveritySummary(folder,10) = severity.twoItemGARP(3);
    violationSeveritySummary(folder,11) = severity.twoItemGARP(4);
    violationSeveritySummary(folder,12) = severity.twoItemGARP(5);
    violationSeveritySummary(folder,13) = severity.twoItemGARP(6);
    violationSeveritySummary(folder,14) = severity.threeItemGARP1213(1);
    violationSeveritySummary(folder,15) = severity.threeItemGARP1213(2);
    violationSeveritySummary(folder,16) = severity.threeItemGARP1213(3);
    violationSeveritySummary(folder,17) = severity.threeItemGARP1213(4);
    violationSeveritySummary(folder,18) = severity.threeItemGARP1213(5);
    violationSeveritySummary(folder,19) = severity.threeItemGARP1213(6);
    violationSeveritySummary(folder,20) = severity.threeItemGARP1223(1);
    violationSeveritySummary(folder,21) = severity.threeItemGARP1223(2);
    violationSeveritySummary(folder,22) = severity.threeItemGARP1223(3);
    violationSeveritySummary(folder,23) = severity.threeItemGARP1223(4);
    violationSeveritySummary(folder,24) = severity.threeItemGARP1223(5);
    violationSeveritySummary(folder,25) = severity.threeItemGARP1223(6);
    violationSeveritySummary(folder,26) = severity.threeItemGARP1323(1);
    violationSeveritySummary(folder,27) = severity.threeItemGARP1323(2);
    violationSeveritySummary(folder,28) = severity.threeItemGARP1323(3);
    violationSeveritySummary(folder,29) = severity.threeItemGARP1323(4); 
    violationSeveritySummary(folder,30) = severity.threeItemGARP1323(5);
    violationSeveritySummary(folder,31) = severity.threeItemGARP1323(6);
    
    cd('../');
end

save('violationSeveritySummary.mat','violationSeveritySummary');