
% cd('/Users/Dalton/Documents/MATLAB/GARP/GARP/PrePilot/preProcessedRev');
% if running for YA
cd('/Users/Niree/Documents/GitHub/GARP/YAOAExperiment/YA/preProcessedRev/');

% if running for OA
% cd('/Users/Niree/Documents/GitHub/GARP/YAOAExperiment/OA/preProcessedRev/');

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
severityRev.twoItemGARP(1,1) = denom - maxes(1);

for i = 2:20
    index = i - 1;
    severity.twoItemGARP(1,i) = severity.twoItemGARP(1,index) + maxes(i)/denom;
    severityRev.twoItemGARP(1,i) = severityRev.twoItemGARP(1,index) - maxes(i);
end

violationperchoice.twoItemGARP = violationbychoice;

save('violationSeverity.mat','severity');
save('violationSeverityRev.mat','severityRev');
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
severityRev.threeItemGARP3435(1,1) = denom - maxes(1);

for i = 2:20
    index = i -1;
    severity.threeItemGARP3435(1,i) = severity.threeItemGARP3435(1,index) + maxes(i)/denom;
    severityRev.threeItemGARP3435(1,i) = severityRev.threeItemGARP3435(1,index) - maxes(i);
end

violationperchoice.threeItemGARP3435 = violationbychoice;

save('violationSeverity.mat','severity');
save('violationSeverityRev.mat','severityRev');
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
severityRev.threeItemGARP3445(1,1) = denom - maxes(1);

for i = 2:20
    index = i -1;
    severity.threeItemGARP3445(1,i) = severity.threeItemGARP3445(1,index) + maxes(i)/denom;
    severityRev.threeItemGARP3445(1,i) = severityRev.threeItemGARP3445(1,index) - maxes(i);
end

violationperchoice.threeItemGARP3445 = violationbychoice;

save('violationSeverity.mat','severity');
save('violationSeverityRev.mat','severityRev');
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
severityRev.threeItemGARP3545(1,1) = denom - maxes(1);

for i = 2:20
    index = i -1;
    severity.threeItemGARP3545(1,i) = severity.threeItemGARP3545(1,index) + maxes(i)/denom;
    severityRev.threeItemGARP3545(1,i) = severityRev.threeItemGARP3545(1,index) - maxes(i);
end

violationperchoice.threeItemGARP3545 = violationbychoice;

save('violationSeverity.mat','severity');
save('violationSeverityRev.mat','severityRev');
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
severityRev.threeItemCyclical(1,1) = denom - maxes(1);

for i = 2:20
    index = i -1;
    severity.threeItemCyclical(1,i) = severity.threeItemCyclical(1,index) + maxes(i)/denom;
    severityRev.threeItemCyclical(1,i) = severityRev.threeItemCyclical(1,index) - maxes(i);
end

violationperchoice.threeItemCyclical = violationbychoice;


save('violationSeverity.mat','severity');
save('violationSeverityRev.mat','severityRev');
save('violationMatrices.mat','violations');
save('violationPerChoice.mat','violationperchoice');
save('violationCounts.mat','violationcounts');
%%
cd('../');
clearvars -except 'subjects', 'folder';
end

% if running for YA
cd('/Users/Niree/Documents/GitHub/GARP/YAOAExperiment/YA/preProcessedRev/');

% if running for OA
% cd('/Users/Niree/Documents/GitHub/GARP/YAOAExperiment/OA/preProcessedRev/');

for folder = 1:length(subjects)
    if ismember((subjects(folder).name(1)), {'.','C','r','S','v','V'});
        continue
    end
    cd(subjects(folder).name);
    load('violationSeverity.mat');
    load('violationSeverityRev.mat');
    load('preProcessed.mat');


violationSeveritySummary(folder,1) = preProcessed.subjID;

for i = 2:21
    index = i - 1;
    violationSeveritySummary(folder,i) = severity.twoItemGARP(1,index);
end

for i = 22:41
    index = i - 21;
    violationSeveritySummary(folder,i) = severity.threeItemGARP3435(1,index);
end

for i = 42:61
    index = i - 41;
    violationSeveritySummary(folder,i) = severity.threeItemGARP3445(1,index);
end

for i = 62:81
    index = i - 61;
    violationSeveritySummary(folder,i) = severity.threeItemGARP3545(1,index);
end

for i = 82:101
    index = i - 81;
    violationSeveritySummary(folder,i) = severity.threeItemCyclical(1,index);
end


violationSeverityRevSummary(folder,1) = preProcessed.subjID;

for i = 2:21
    index = i - 1;
    violationSeverityRevSummary(folder,i) = severityRev.twoItemGARP(1,index);
end

for i = 22:41
    index = i - 21;
    violationSeverityRevSummary(folder,i) = severityRev.threeItemGARP3435(1,index);
end

for i = 42:61
    index = i - 41;
    violationSeverityRevSummary(folder,i) = severityRev.threeItemGARP3445(1,index);
end

for i = 62:81
    index = i - 61;
    violationSeverityRevSummary(folder,i) = severityRev.threeItemGARP3545(1,index);
end

for i = 82:101
    index = i - 81;
    violationSeverityRevSummary(folder,i) = severityRev.threeItemCyclical(1,index);
end


    cd('../');
end

save('violationSeveritySummary.mat','violationSeveritySummary');
save('violationSeverityRevSummary.mat','violationSeverityRevSummary');