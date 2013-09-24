
% cd('/Users/Dalton/Documents/MATLAB/GARP/GARP/PrePilot/preProcessedRev');
cd('C:/Users/Niree/Documents/GitHub/GARP/YAOAExperiment/preProcessedRev');
subjects = dir;

for folder = 1:length(subjects)
    if ismember((subjects(folder).name(1)), {'.','C','r','S','v','V'});
        continue
    end
   
    cd(subjects(folder).name);
    load('preProcessed.mat');

%%
set = preProcessed.twoItemGARP.tasks;
choice = preProcessed.twoItemGARP.choices;

% Price = zeros(length(set), 2);
% for i = 1:length(set);
%     Price(i,1) = (set(2,2,i)-set(1,2,i))/(set(1,1,i)-set(2,1,i));
%     Price(i,2) = 1;
% end

[violation, violationbychoice] = twoItemGARPViolationCounter(set,choice);

violations.twoItemGARP = violation;
violationcounts.twoItemGARP = nnz(violations.twoItemGARP)/2;

[maxes] = twoItemGARPChoiceOmit( violation, violationbychoice, set );

denom = violationcounts.twoItemGARP;

severity.twoItemGARP(1,1) = maxes(1)/denom; %calculates how many violations remain when the choice that makes the most number of violations is removed
severity.twoItemGARP(1,2) = severity.twoItemGARP(1,1) + maxes(2)/denom;
severity.twoItemGARP(1,3) = severity.twoItemGARP(1,2) + maxes(3)/denom;
severity.twoItemGARP(1,4) = severity.twoItemGARP(1,3) + maxes(4)/denom;
severity.twoItemGARP(1,5) = severity.twoItemGARP(1,4) + maxes(5)/denom;
severity.twoItemGARP(1,6) = severity.twoItemGARP(1,5) + maxes(6)/denom;
severity.twoItemGARP(1,7) = severity.twoItemGARP(1,6) + maxes(7)/denom;
severity.twoItemGARP(1,8) = severity.twoItemGARP(1,7) + maxes(8)/denom;
severity.twoItemGARP(1,9) = severity.twoItemGARP(1,8) + maxes(9)/denom;
severity.twoItemGARP(1,10) = severity.twoItemGARP(1,9) + maxes(10)/denom;
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

[maxes] = threeItemGARP3435ChoiceOmit( violation, violationbychoice, set );

denom = violationcounts.threeItemGARP3435; 

severity.threeItemGARP3435(1,1) = maxes(1)/denom; %calculates how many violations remain when the choice that makes the most number of violations is removed
severity.threeItemGARP3435(1,2) = severity.threeItemGARP3435(1,1) + maxes(2)/denom;
severity.threeItemGARP3435(1,3) = severity.threeItemGARP3435(1,2) + maxes(3)/denom;
severity.threeItemGARP3435(1,4) = severity.threeItemGARP3435(1,3) + maxes(4)/denom;
severity.threeItemGARP3435(1,5) = severity.threeItemGARP3435(1,4) + maxes(5)/denom;
severity.threeItemGARP3435(1,6) = severity.threeItemGARP3435(1,5) + maxes(6)/denom;
severity.threeItemGARP3435(1,7) = severity.threeItemGARP3435(1,6) + maxes(7)/denom;
severity.threeItemGARP3435(1,8) = severity.threeItemGARP3435(1,7) + maxes(8)/denom;
severity.threeItemGARP3435(1,9) = severity.threeItemGARP3435(1,8) + maxes(9)/denom;
severity.threeItemGARP3435(1,10) = severity.threeItemGARP3435(1,9) + maxes(10)/denom;
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

[maxes] = threeItemGARP3445ChoiceOmit( violation, violationbychoice, set );

denom = violationcounts.threeItemGARP3445;

severity.threeItemGARP3445(1,1) = maxes(1)/denom; %calculates how many violations remain when the choice that makes the most number of violations is removed
severity.threeItemGARP3445(1,2) = severity.threeItemGARP3445(1,1) + maxes(2)/denom;
severity.threeItemGARP3445(1,3) = severity.threeItemGARP3445(1,2) + maxes(3)/denom;
severity.threeItemGARP3445(1,4) = severity.threeItemGARP3445(1,3) + maxes(4)/denom;
severity.threeItemGARP3445(1,5) = severity.threeItemGARP3445(1,4) + maxes(5)/denom;
severity.threeItemGARP3445(1,6) = severity.threeItemGARP3445(1,5) + maxes(6)/denom;
severity.threeItemGARP3445(1,7) = severity.threeItemGARP3445(1,6) + maxes(7)/denom;
severity.threeItemGARP3445(1,8) = severity.threeItemGARP3445(1,7) + maxes(8)/denom;
severity.threeItemGARP3445(1,9) = severity.threeItemGARP3445(1,8) + maxes(9)/denom;
severity.threeItemGARP3445(1,10) = severity.threeItemGARP3445(1,9) + maxes(10)/denom;
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

[maxes] = threeItemGARP3545ChoiceOmit( violation, violationbychoice, set );

denom = violationcounts.threeItemGARP3545;

severity.threeItemGARP3545(1,1) = maxes(1)/denom; %calculates how many violations remain when the choice that makes the most number of violations is removed
severity.threeItemGARP3545(1,2) = severity.threeItemGARP3545(1,1) + maxes(2)/denom;
severity.threeItemGARP3545(1,3) = severity.threeItemGARP3545(1,2) + maxes(3)/denom;
severity.threeItemGARP3545(1,4) = severity.threeItemGARP3545(1,3) + maxes(4)/denom;
severity.threeItemGARP3545(1,5) = severity.threeItemGARP3545(1,4) + maxes(5)/denom;
severity.threeItemGARP3545(1,6) = severity.threeItemGARP3545(1,5) + maxes(6)/denom;
severity.threeItemGARP3545(1,7) = severity.threeItemGARP3545(1,6) + maxes(7)/denom;
severity.threeItemGARP3545(1,8) = severity.threeItemGARP3545(1,7) + maxes(8)/denom;
severity.threeItemGARP3545(1,9) = severity.threeItemGARP3545(1,8) + maxes(9)/denom;
severity.threeItemGARP3545(1,10) = severity.threeItemGARP3545(1,9) + maxes(10)/denom;
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

[violation, violationbychoice] = threeItemCyclicalViolationCounter(set1, choice1, set2, choice2, set3, choice3);

violations.threeItemCyclical = violation;
violationcounts.threeItemCyclical = nnz(violations.threeItemCyclical);

[maxes] = threeItemCyclicalChoiceOmit( violation, violationbychoice, set1, choice1, set2, choice2, set3, choice3 );

denom = violationcounts.threeItemCyclical; 

severity.threeItemCyclical(1,1) = maxes(1)/denom; %calculates how many violations remain when the choice that makes the most number of violations is removed
severity.threeItemCyclical(1,2) = severity.threeItemCyclical(1,1) + maxes(2)/denom;
severity.threeItemCyclical(1,3) = severity.threeItemCyclical(1,2) + maxes(3)/denom;
severity.threeItemCyclical(1,4) = severity.threeItemCyclical(1,3) + maxes(4)/denom;
severity.threeItemCyclical(1,5) = severity.threeItemCyclical(1,4) + maxes(5)/denom;
severity.threeItemCyclical(1,6) = severity.threeItemCyclical(1,5) + maxes(6)/denom;
severity.threeItemCyclical(1,7) = severity.threeItemCyclical(1,6) + maxes(7)/denom;
severity.threeItemCyclical(1,8) = severity.threeItemCyclical(1,7) + maxes(8)/denom;
severity.threeItemCyclical(1,9) = severity.threeItemCyclical(1,8) + maxes(9)/denom;
severity.threeItemCyclical(1,10) = severity.threeItemCyclical(1,9) + maxes(10)/denom;
violationperchoice.threeItemCyclical = violationbychoice;


save('violationSeverity.mat','severity');
save('violationMatrices.mat','violations');
save('violationPerChoice.mat','violationperchoice');
save('violationCounts.mat','violationcounts');
%%
cd('../');
clearvars -except 'subjects', 'folder';
end

cd('/Users/Niree/Documents/GitHub/GARP/YAOAExperiment/preProcessedRev');

for folder = 1:length(subjects)
    if ismember((subjects(folder).name(1)), {'.','C','r','S','v','V'});
        continue
    end
    cd(subjects(folder).name);
    load ('violationSeverity.mat');
    load('preProcessed.mat');


violationSeveritySummary(folder,1) = preProcessed.subjID;

for i = 2:11
    index = i - 1;
    violationSeveritySummary(folder,i) = severity.twoItemGARP(1,index);
end

for i = 12:21
    index = i - 11;
    violationSeveritySummary(folder,i) = severity.threeItemGARP3435(1,index);
end

for i = 22:31
    index = i - 21;
    violationSeveritySummary(folder,i) = severity.threeItemGARP3445(1,index);
end

for i = 32:41
    index = i - 31;
    violationSeveritySummary(folder,i) = severity.threeItemGARP3545(1,index);
end

for i = 42:51
    index = i - 41;
    violationSeveritySummary(folder,i) = severity.threeItemCyclical(1,index);
end



    cd('../');
end

save('violationSeveritySummary.mat','violationSeveritySummary');