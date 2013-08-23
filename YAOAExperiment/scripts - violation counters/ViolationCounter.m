
% cd('/Users/Dalton/Documents/MATLAB/GARP/GARP/PrePilot/preProcessedRev');
cd('C:/Users/Niree/Documents/GitHub/GARP/YAOAExperiment/preProcessedRev');
subjects = dir;

for folder = 1:length(subjects)
    if ismember((subjects(folder).name(1)), {'.','C','r','S','v'});
        continue
    end
   
    cd(subjects(folder).name);
    load('preProcessed.mat');

set = preProcessed.catch.tasks;
choice = preProcessed.catch.choices;

[violation, violationbychoice] = limitGARPViolationCounter(set,choice);

[ firstMax, secondMax, thirdMax, fourthMax, fifthMax, sixthMax, seventhMax, violations ] = catchGARPChoiceOmit( violation, violationbychoice, set );

violations.catch = violations;
violationcounts.catch = nnz(violations.catch)/2;

severity.catch(1,1) = firstMax/(violationcounts.catch); %calculates how many violations remain when the choice that makes the most number of violations is removed
severity.catch(1,2) = (firstMax + secondMax)/violationcounts.catch;
severity.catch(1,3) = (firstMax + secondMax + thirdMax)/violationcounts.catch;
severity.catch(1,4) = (firstMax + secondMax + thirdMax + fourthMax)/violationcounts.catch;
severity.catch(1,5) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax)/violationcounts.catch;
severity.catch(1,6) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax + sixthMax)/violationcounts.catch;
severity.catch(1,7) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax + sixthMax + seventhMax)/violationcounts.catch;
violationperchoice.catch = violationbychoice;

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

[ firstMax, secondMax, thirdMax, fourthMax, fifthMax, sixthMax, seventhMax, violations ] = twoItemGARPChoiceOmit( violation, violationbychoice, set );

violations.twoItemGARP = violations;
violationcounts.twoItemGARP = nnz(violations.twoItemGARP)/2;

severity.twoItemGARP(1,1) = firstMax/violationcounts.twoItemGARP; %calculates how many violations remain when the choice that makes the most number of violations is removed
severity.twoItemGARP(1,2) = (firstMax + secondMax)/violationcounts.twoItemGARP;
severity.twoItemGARP(1,3) = (firstMax + secondMax + thirdMax)/violationcounts.twoItemGARP;
severity.twoItemGARP(1,4) = (firstMax + secondMax + thirdMax + fourthMax)/violationcounts.twoItemGARP;
severity.twoItemGARP(1,5) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax)/violationcounts.twoItemGARP;
severity.twoItemGARP(1,6) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax + sixthMax)/violationcounts.twoItemGARP;
severity.twoItemGARP(1,7) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax + sixthMax + seventhMax)/violationcounts.twoItemGARP;
violationperchoice.twoItemGARP = violationbychoice;

save('violationSeverity.mat','severity');
save('violationMatrices.mat','violations');
save('violationPerChoice.mat','violationperchoice');
save('violationCounts.mat','violationcounts');
%%
set = preProcessed.threeItemGARP3435.revtasks;
choice = preProcessed.threeItemGARP3435.choices;

[violation, violationbychoice] = threeItemGARP1213ViolationCounter(set,choice);

violations.threeItemGARP3435 = violation;
violationcounts.threeItemGARP3435 = nnz(violations.threeItemGARP3435)/2;

[ firstMax, secondMax, thirdMax, fourthMax, fifthMax, sixthMax, seventhMax, violations ] = threeItemGARP3435ChoiceOmit( violation, violationbychoice, set );

violations.threeItemGARP3435 = violations;
violationcounts.threeItemGARP3435 = nnz(violations.threeItemGARP3435)/2;

severity.threeItemGARP3435(1,1) = firstMax/(violationcounts.threeItemGARP3435); %calculates how many violations remain when the choice that makes the most number of violations is removed
severity.threeItemGARP3435(1,2) = (firstMax + secondMax)/violationcounts.threeItemGARP3435;
severity.threeItemGARP3435(1,3) = (firstMax + secondMax + thirdMax)/violationcounts.threeItemGARP3435;
severity.threeItemGARP3435(1,4) = (firstMax + secondMax + thirdMax + fourthMax)/violationcounts.threeItemGARP3435;
severity.threeItemGARP3435(1,5) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax)/violationcounts.threeItemGARP3435;
severity.threeItemGARP3435(1,6) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax + sixthMax)/violationcounts.threeItemGARP3435;
severity.threeItemGARP3435(1,7) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax + sixthMax + seventhMax)/violationcounts.threeItemGARP3435;
violationperchoice.threeItemGARP3435 = violationbychoice;

save('violationSeverity.mat','severity');
save('violationMatrices.mat','violations');
save('violationPerChoice.mat','violationperchoice');
save('violationCounts.mat','violationcounts');
%%
set = preProcessed.threeItemGARP3445.revtasks;
choice = preProcessed.threeItemGARP3445.choices;

[violation, violationbychoice] = threeItemGARP1223ViolationCounter(set,choice);

violations.threeItemGARP3445 = violation;
violationcounts.threeItemGARP3445 = nnz(violations.threeItemGARP3445)/2;

[ firstMax, secondMax, thirdMax, fourthMax, fifthMax, sixthMax, seventhMax, violations ] = threeItemGARP3445ChoiceOmit( violation, violationbychoice, set );

violations.threeItemGARP3445 = violations;
violationcounts.threeItemGARP3445 = nnz(violations.threeItemGARP3445)/2;

severity.threeItemGARP3445(1,1) = firstMax/violationcounts.threeItemGARP3445; %calculates how many violations remain when the choice that makes the most number of violations is removed
severity.threeItemGARP3445(1,2) = (firstMax + secondMax)/violationcounts.threeItemGARP3445;
severity.threeItemGARP3445(1,3) = (firstMax + secondMax + thirdMax)/violationcounts.threeItemGARP3445;
severity.threeItemGARP3445(1,4) = (firstMax + secondMax + thirdMax + fourthMax)/violationcounts.threeItemGARP3445;
severity.threeItemGARP3445(1,5) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax)/violationcounts.threeItemGARP3445;
severity.threeItemGARP3445(1,6) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax + sixthMax)/violationcounts.threeItemGARP3445;
severity.threeItemGARP3445(1,7) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax + sixthMax + seventhMax)/violationcounts.threeItemGARP3445;
violationperchoice.threeItemGARP3445 = violationbychoice;

save('violationSeverity.mat','severity');
save('violationMatrices.mat','violations');
save('violationPerChoice.mat','violationperchoice');
save('violationCounts.mat','violationcounts');
%%
set = preProcessed.threeItemGARP3545.revtasks;
choice = preProcessed.threeItemGARP3545.choices;

[violation, violationbychoice] = threeItemGARP1323ViolationCounter(set,choice);

violations.threeItemGARP3545 = violation;
violationcounts.threeItemGARP3545 = nnz(violations.threeItemGARP3545)/2;

[ firstMax, secondMax, thirdMax, fourthMax, fifthMax, sixthMax, seventhMax, violations ] = threeItemGARP3545ChoiceOmit( violation, violationbychoice, set );

violations.threeItemGARP3545 = violations;
violationcounts.threeItemGARP3545 = nnz(violations.threeItemGARP3545)/2;

severity.threeItemGARP3545(1,1) = firstMax/(violationcounts.threeItemGARP3545); %calculates how many violations remain when the choice that makes the most number of violations is removed
severity.threeItemGARP3545(1,2) = (firstMax + secondMax)/violationcounts.threeItemGARP3545;
severity.threeItemGARP3545(1,3) = (firstMax + secondMax + thirdMax)/violationcounts.threeItemGARP3545;
severity.threeItemGARP3545(1,4) = (firstMax + secondMax + thirdMax + fourthMax)/violationcounts.threeItemGARP3545;
severity.threeItemGARP3545(1,5) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax)/violationcounts.threeItemGARP3545;
severity.threeItemGARP3545(1,6) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax + sixthMax)/violationcounts.threeItemGARP3545;
severity.threeItemGARP3545(1,7) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax + sixthMax + seventhMax)/violationcounts.threeItemGARP3545;
violationperchoice.threeItemGARP3545 = violationbychoice;

save('violationSeverity.mat','severity');
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

cd('/Users/Niree/Documents/GitHub/GARP/YAOAExperiment/preProcessedRev');

for folder = 1:length(subjects)
    if ismember((subjects(folder).name(1)), {'.','C','r','S','v'});
        continue
    end
    cd(subjects(folder).name);
    load ('violationSeverity.mat');
    load('preProcessed.mat');
    
    violationSeveritySummary(folder,1) = preProcessed.subjID;
    violationSeveritySummary(folder,2) = severity.catch(1);
    violationSeveritySummary(folder,3) = severity.catch(2);
    violationSeveritySummary(folder,4) = severity.catch(3);
    violationSeveritySummary(folder,5) = severity.catch(4);
    violationSeveritySummary(folder,6) = severity.catch(5);
    violationSeveritySummary(folder,7) = severity.catch(6);
    violationSeveritySummary(folder,8) = severity.catch(7);
    violationSeveritySummary(folder,9) = severity.twoItemGARP(1);
    violationSeveritySummary(folder,10) = severity.twoItemGARP(2);
    violationSeveritySummary(folder,11) = severity.twoItemGARP(3);
    violationSeveritySummary(folder,12) = severity.twoItemGARP(4);
    violationSeveritySummary(folder,13) = severity.twoItemGARP(5);
    violationSeveritySummary(folder,14) = severity.twoItemGARP(6);
    violationSeveritySummary(folder,15) = severity.twoItemGARP(7);
    violationSeveritySummary(folder,16) = severity.threeItemGARP3435(1);
    violationSeveritySummary(folder,17) = severity.threeItemGARP3435(2);
    violationSeveritySummary(folder,18) = severity.threeItemGARP3435(3);
    violationSeveritySummary(folder,19) = severity.threeItemGARP3435(4);
    violationSeveritySummary(folder,20) = severity.threeItemGARP3435(5);
    violationSeveritySummary(folder,21) = severity.threeItemGARP3435(6);
    violationSeveritySummary(folder,22) = severity.threeItemGARP3435(7);
    violationSeveritySummary(folder,23) = severity.threeItemGARP3445(1);
    violationSeveritySummary(folder,24) = severity.threeItemGARP3445(2);
    violationSeveritySummary(folder,25) = severity.threeItemGARP3445(3);
    violationSeveritySummary(folder,26) = severity.threeItemGARP3445(4);
    violationSeveritySummary(folder,27) = severity.threeItemGARP3445(5);
    violationSeveritySummary(folder,28) = severity.threeItemGARP3445(6);
    violationSeveritySummary(folder,29) = severity.threeItemGARP3445(7);
    violationSeveritySummary(folder,30) = severity.threeItemGARP3545(1);
    violationSeveritySummary(folder,31) = severity.threeItemGARP3545(2);
    violationSeveritySummary(folder,32) = severity.threeItemGARP3545(3);
    violationSeveritySummary(folder,33) = severity.threeItemGARP3545(4); 
    violationSeveritySummary(folder,34) = severity.threeItemGARP3545(5);
    violationSeveritySummary(folder,35) = severity.threeItemGARP3545(6);
    violationSeveritySummary(folder,36) = severity.threeItemGARP3545(7);
    
    cd('../');
end

save('violationSeveritySummary.mat','violationSeveritySummary');