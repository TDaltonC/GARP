
% Description: this script calls on subscripts that count violations (i.e.
% threeItemGARP1213ViolationCounter.m) as well as subscripts designed to
% count the number of choice removals necessary to obtain perfect
% consistency (i.e. twoItemGARPChoiceOmit.m). The script creates several
% .mat files for each subject containing their violation counts, choice
% removals for consistency, and CKB severity index, all by task type.

% Caution: if running this for OA, need to "uncomment" script lines at two
% locations 

% cd('/Users/Dalton/Documents/MATLAB/GARP/GARP/PrePilot/preProcessedRev');
% if running for YA
cd('/Users/Niree/Documents/GitHub/GARP/YAOAExperiment/YA/preProcessedRev/');

% if running for OA
% cd('/Users/Niree/Documents/GitHub/GARP/YAOAExperiment/OA/preProcessedRev/');

subjects = dir;

for folder = 1:length(subjects)
    if ismember((subjects(folder).name(1)), {'.','C','r','S','v','V','s'});
        continue
    end
   
    cd(subjects(folder).name);
    load('preProcessed.mat');

%%
set = preProcessed.catch.tasks; 
choice = preProcessed.catch.choices;

[violation] = catchViolationCounter(set,choice);

violationcounts.catch = violation;
save('violationCounts.mat','violationcounts');

%% 
set = preProcessed.twoItemGARP.tasks;
choice = preProcessed.twoItemGARP.choices;

% Price = zeros(length(set), 2);
% for i = 1:length(set);
%     Price(i,1) = (set(2,2,i)-set(1,2,i))/(set(1,1,i)-set(2,1,i));
%     Price(i,2) = 1;
% end

[violation, violationbychoice, CKB, CKBbychoice] = twoItemGARPViolationCounter(set,choice);

if nnz(CKB) ~= 0
    severityIndexCKB.twoItemGARP = sum(sum(CKB))/nnz(CKB);
else
    severityIndexCKB.twoItemGARP = 0;
end

severityCKB.twoItemGARP = CKB;
severityCKBbychoice.twoItemGARP = CKBbychoice;

violations.twoItemGARP = violation;
violationcounts.twoItemGARP = nnz(violations.twoItemGARP)/2;

[maxes] = twoItemGARPChoiceOmit( violation, violationbychoice, set );

denom = violationcounts.twoItemGARP;

severity.twoItemGARP(1,1) = maxes(1)/denom; %calculates how many violations remain when the choice that makes the most number of violations is removed
severityRev.twoItemGARP(1,1) = denom;
severityRev.twoItemGARP(1,2) = denom - maxes(1);

for i = 2:20
    index = i - 1;
    severity.twoItemGARP(1,i) = severity.twoItemGARP(1,index) + maxes(i)/denom;
end

for i = 3:21
    index = i - 1;
    severityRev.twoItemGARP(1,i) = severityRev.twoItemGARP(1,index) - maxes(index);
end

i = 1;
while i < 22
    if (i == 1) && (severityRev.twoItemGARP(1,i) == 0);
        severityIndex.twoItemGARP = 0;
        i = 22;
    elseif (i ~= 1) && (severityRev.twoItemGARP(1,i) == 0);
        severityIndex.twoItemGARP = i - 1;
        i = 22;
    elseif severityRev.twoItemGARP(1,i) ~= 0;
        severityIndex.twoItemGARP = i;
    end
    i = i + 1;
end
        
violationperchoice.twoItemGARP = violationbychoice;

save('severityIndexCKB.mat','severityIndexCKB');
save('severityCKBbychoice.mat','severityCKBbychoice');
save('severityCKB.mat','severityCKB');
save('violationSeverity.mat','severity');
save('violationSeverityRev.mat','severityRev');
save('severityIndex.mat','severityIndex');
save('violationMatrices.mat','violations');
save('violationPerChoice.mat','violationperchoice');
save('violationCounts.mat','violationcounts');
%%
set = preProcessed.threeItemGARP3435.revtasks;
choice = preProcessed.threeItemGARP3435.choices;

[violation, violationbychoice, CKB, CKBbychoice] = threeItemGARP1213ViolationCounter(set,choice);

if nnz(CKB) ~= 0
    severityIndexCKB.threeItemGARP3435 = sum(sum(CKB))/nnz(CKB);
else
    severityIndexCKB.threeItemGARP3435 = 0;
end

severityCKB.threeItemGARP3435 = CKB;
severityCKBbychoice.threeItemGARP3435 = CKBbychoice;

violations.threeItemGARP3435 = violation;
violationcounts.threeItemGARP3435 = nnz(violations.threeItemGARP3435)/2;

[maxes] = threeItemGARP3435ChoiceOmit( violation, violationbychoice, set );

denom = violationcounts.threeItemGARP3435; 

severity.threeItemGARP3435(1,1) = maxes(1)/denom; %calculates how many violations remain when the choice that makes the most number of violations is removed
severityRev.threeItemGARP3435(1,1) = denom;
severityRev.threeItemGARP3435(1,2) = denom - maxes(1);

for i = 2:20
    index = i - 1;
    severity.threeItemGARP3435(1,i) = severity.threeItemGARP3435(1,index) + maxes(i)/denom;
end

for i = 3:21
    index = i - 1;
    severityRev.threeItemGARP3435(1,i) = severityRev.threeItemGARP3435(1,index) - maxes(index);
end

i = 1;
while i < 22
    if (i == 1) && (severityRev.threeItemGARP3435(1,i) == 0);
        severityIndex.threeItemGARP3435 = 0;
        i = 22;
    elseif (i ~= 1) && (severityRev.threeItemGARP3435(1,i) == 0);
        severityIndex.threeItemGARP3435 = i - 1;
        i = 22;
    elseif severityRev.threeItemGARP3435(1,i) ~= 0;
        severityIndex.threeItemGARP3435 = i;
    end
    i = i + 1;
end

violationperchoice.threeItemGARP3435 = violationbychoice;

save('severityIndexCKB.mat','severityIndexCKB');
save('severityCKBbychoice.mat','severityCKBbychoice');
save('severityCKB.mat','severityCKB');
save('violationSeverity.mat','severity');
save('violationSeverityRev.mat','severityRev');
save('severityIndex.mat','severityIndex');
save('violationMatrices.mat','violations');
save('violationPerChoice.mat','violationperchoice');
save('violationCounts.mat','violationcounts');
%%
set = preProcessed.threeItemGARP3445.revtasks;
choice = preProcessed.threeItemGARP3445.choices;

[violation, violationbychoice, CKB, CKBbychoice] = threeItemGARP1223ViolationCounter(set,choice);

if nnz(CKB) ~= 0
    severityIndexCKB.threeItemGARP3445 = sum(sum(CKB))/nnz(CKB);
else
    severityIndexCKB.threeItemGARP3445 = 0;
end

severityCKB.threeItemGARP3445 = CKB;
severityCKBbychoice.threeItemGARP3445 = CKBbychoice;

violations.threeItemGARP3445 = violation;
violationcounts.threeItemGARP3445 = nnz(violations.threeItemGARP3445)/2;

[maxes] = threeItemGARP3445ChoiceOmit( violation, violationbychoice, set );

denom = violationcounts.threeItemGARP3445;

severity.threeItemGARP3445(1,1) = maxes(1)/denom; %calculates how many violations remain when the choice that makes the most number of violations is removed
severityRev.threeItemGARP3445(1,1) = denom;
severityRev.threeItemGARP3445(1,2) = denom - maxes(1);

for i = 2:20
    index = i - 1;
    severity.threeItemGARP3445(1,i) = severity.threeItemGARP3445(1,index) + maxes(i)/denom;
end

for i = 3:21
    index = i - 1;
    severityRev.threeItemGARP3445(1,i) = severityRev.threeItemGARP3445(1,index) - maxes(index);
end

i = 1;
while i < 22
    if (i == 1) && (severityRev.threeItemGARP3445(1,i) == 0);
        severityIndex.threeItemGARP3445 = 0;
        i = 22;
    elseif (i ~= 1) && (severityRev.threeItemGARP3445(1,i) == 0);
        severityIndex.threeItemGARP3445 = i - 1;
        i = 22;
    elseif severityRev.threeItemGARP3445(1,i) ~= 0;
        severityIndex.threeItemGARP3445 = i;
    end
    i = i + 1;
end

violationperchoice.threeItemGARP3445 = violationbychoice;

save('severityIndexCKB.mat','severityIndexCKB');
save('severityCKBbychoice.mat','severityCKBbychoice');
save('severityCKB.mat','severityCKB');
save('violationSeverity.mat','severity');
save('violationSeverityRev.mat','severityRev');
save('severityIndex.mat','severityIndex');
save('violationMatrices.mat','violations');
save('violationPerChoice.mat','violationperchoice');
save('violationCounts.mat','violationcounts');
%%
set = preProcessed.threeItemGARP3545.revtasks;
choice = preProcessed.threeItemGARP3545.choices;

[violation, violationbychoice, CKB, CKBbychoice] = threeItemGARP1323ViolationCounter(set,choice);

if nnz(CKB) ~= 0
    severityIndexCKB.threeItemGARP3545 = sum(sum(CKB))/nnz(CKB);
else
    severityIndexCKB.threeItemGARP3545 = 0;
end

severityCKB.threeItemGARP3545 = CKB;
severityCKBbychoice.threeItemGARP3545 = CKBbychoice;

violations.threeItemGARP3545 = violation;
violationcounts.threeItemGARP3545 = nnz(violations.threeItemGARP3545)/2;

[maxes] = threeItemGARP3545ChoiceOmit( violation, violationbychoice, set );

denom = violationcounts.threeItemGARP3545;

severity.threeItemGARP3545(1,1) = maxes(1)/denom; %calculates how many violations remain when the choice that makes the most number of violations is removed
severityRev.threeItemGARP3545(1,1) = denom;
severityRev.threeItemGARP3545(1,2) = denom - maxes(1);

for i = 2:20
    index = i - 1;
    severity.threeItemGARP3545(1,i) = severity.threeItemGARP3545(1,index) + maxes(i)/denom;
end

for i = 3:21
    index = i - 1;
    severityRev.threeItemGARP3545(1,i) = severityRev.threeItemGARP3545(1,index) - maxes(index);
end

i = 1;
while i < 22
    if (i == 1) && (severityRev.threeItemGARP3545(1,i) == 0);
        severityIndex.threeItemGARP3545 = 0;
        i = 22;
    elseif (i ~= 1) && (severityRev.threeItemGARP3545(1,i) == 0);
        severityIndex.threeItemGARP3545 = i - 1;
        i = 22;
    elseif severityRev.threeItemGARP3545(1,i) ~= 0;
        severityIndex.threeItemGARP3545 = i;
    end
    i = i + 1;
end

violationperchoice.threeItemGARP3545 = violationbychoice;

save('severityIndexCKB.mat','severityIndexCKB');
save('severityCKBbychoice.mat','severityCKBbychoice');
save('severityCKB.mat','severityCKB');
save('violationSeverity.mat','severity');
save('violationSeverityRev.mat','severityRev');
save('severityIndex.mat','severityIndex');
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

[violation, violationbychoice, CKB, CKBbychoice] = threeItemCyclicalViolationCounter(set1, choice1, set2, choice2, set3, choice3);

severityCKB.threeItemCyclical = CKB;
if nnz(CKBbychoice) ~= 0
    severityIndexCKB.threeItemCyclical = sum(CKBbychoice)/nnz(CKBbychoice);
else
    severityIndexCKB.threeItemCyclical = 0;
end
severityCKBbychoice.threeItemCyclical = CKBbychoice;

violations.threeItemCyclical = violation;
violationcounts.threeItemCyclical = nnz(violations.threeItemCyclical);

[maxes] = threeItemCyclicalChoiceOmit( violation, violationbychoice, set1, choice1, set2, choice2, set3, choice3 );

denom = violationcounts.threeItemCyclical; 

severity.threeItemCyclical(1,1) = maxes(1)/denom; %calculates how many violations remain when the choice that makes the most number of violations is removed
severityRev.threeItemCyclical(1,1) = denom;
severityRev.threeItemCyclical(1,2) = denom - maxes(1);

for i = 2:20
    index = i - 1;
    severity.threeItemCyclical(1,i) = severity.threeItemCyclical(1,index) + maxes(i)/denom;
end

for i = 3:21
    index = i - 1;
    severityRev.threeItemCyclical(1,i) = severityRev.threeItemCyclical(1,index) - maxes(index);
end

i = 1;
while i < 22
    if (i == 1) && (severityRev.threeItemCyclical(1,i) == 0);
        severityIndex.threeItemCyclical = 0;
        i = 22;
    elseif (i ~= 1) && (severityRev.threeItemCyclical(1,i) == 0);
        severityIndex.threeItemCyclical = i - 1;
        i = 22;
    elseif severityRev.threeItemCyclical(1,i) ~= 0;
        severityIndex.threeItemCyclical = i;
    end
    i = i + 1;
end

violationperchoice.threeItemCyclical = violationbychoice;

save('severityIndexCKB.mat','severityIndexCKB');
save('severityCKBbychoice.mat','severityCKBbychoice');
save('severityCKB.mat','severityCKB');
save('violationSeverity.mat','severity');
save('violationSeverityRev.mat','severityRev');
save('severityIndex.mat','severityIndex');
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
    if ismember((subjects(folder).name(1)), {'.','C','r','S','v','V','s'});
        continue
    end
    cd(subjects(folder).name);
    load('violationSeverity.mat');
    load('violationSeverityRev.mat');
    load('preProcessed.mat');
    load('severityIndex.mat');
    load('severityIndexCKB.mat');

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

for i = 2:22
    index = i - 1;
    violationSeverityRevSummary(folder,i) = severityRev.twoItemGARP(1,index);
end

for i = 23:43 
    index = i - 22;
    violationSeverityRevSummary(folder,i) = severityRev.threeItemGARP3435(1,index);
end

for i = 44:64
    index = i - 43;
    violationSeverityRevSummary(folder,i) = severityRev.threeItemGARP3445(1,index);
end

for i = 65:85
    index = i - 64;
    violationSeverityRevSummary(folder,i) = severityRev.threeItemGARP3545(1,index);
end

for i = 86:106
    index = i - 85;
    violationSeverityRevSummary(folder,i) = severityRev.threeItemCyclical(1,index);
end

severityIndexSummary(folder,1) = preProcessed.subjID;
severityIndexSummary(folder,2) = severityIndex.twoItemGARP;
severityIndexSummary(folder,3) = severityIndex.threeItemGARP3435;
severityIndexSummary(folder,4) = severityIndex.threeItemGARP3445;
severityIndexSummary(folder,5) = severityIndex.threeItemGARP3545;
severityIndexSummary(folder,6) = severityIndex.threeItemCyclical;


severityIndexCKBSummary(folder,1) = preProcessed.subjID;
severityIndexCKBSummary(folder,2) = severityIndexCKB.twoItemGARP;
severityIndexCKBSummary(folder,3) = severityIndexCKB.threeItemGARP3435;
severityIndexCKBSummary(folder,4) = severityIndexCKB.threeItemGARP3445;
severityIndexCKBSummary(folder,5) = severityIndexCKB.threeItemGARP3545;
severityIndexCKBSummary(folder,6) = severityIndexCKB.threeItemCyclical;

    cd('../');
end

save('violationSeveritySummary.mat','violationSeveritySummary');
save('violationSeverityRevSummary.mat','violationSeverityRevSummary');
save('severityIndexSummary.mat','severityIndexSummary');
save('severityIndexCKBSummary.mat','severityIndexCKBSummary');