% cd('/Users/Dalton/Documents/MATLAB/GARP/GARP/PrePilot/preProcessedRev');
cd('C:/Users/Niree/Documents/GitHub/GARP/YAOAExperiment/preProcessedRev');
subjects = dir;

for folder = 1:length(subjects)
    if ismember((subjects(folder).name(1)), {'.','C','r','S','v','V'});
        continue
    end
   
    cd(subjects(folder).name);
    load('preProcessed.mat');

set = preProcessed.catch.tasks;
choice = preProcessed.catch.choices;

[violation, violationbychoice] = limitGARPViolationCounter(set,choice);

[ firstMax, secondMax, thirdMax, fourthMax, fifthMax, sixthMax, seventhMax, violations ] = catchGARPChoiceOmit( violation, violationbychoice, set );

violationMats.catch = violations;
violationcounts.catch = nnz(violationMats.catch)/2;

severity.catch(1,1) = firstMax/(violationcounts.catch); %calculates how many violations remain when the choice that makes the most number of violations is removed
severity.catch(1,2) = (firstMax + secondMax)/violationcounts.catch;
severity.catch(1,3) = (firstMax + secondMax + thirdMax)/violationcounts.catch;
severity.catch(1,4) = (firstMax + secondMax + thirdMax + fourthMax)/violationcounts.catch;
severity.catch(1,5) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax)/violationcounts.catch;
severity.catch(1,6) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax + sixthMax)/violationcounts.catch;
severity.catch(1,7) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax + sixthMax + seventhMax)/violationcounts.catch;
violationperchoice.catch = violationbychoice;

save('violationSeverity.mat','severity');
save('violationMatrices.mat','violationMats');
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

[MAX, violations ] = twoItemGARPChoiceOmitTest( violation, violationbychoice, set );

violationMats.twoItemGARP = violations;
violationcounts.twoItemGARP = nnz(violationMats.twoItemGARP)/2;

severity.twoItemGARP(1,1) = MAX(1)/violationcounts.twoItemGARP; %calculates how many violations remain when the choice that makes the most number of violations is removed
severity.twoItemGARP(1,2) = (MAX(1)+ MAX(2))/violationcounts.twoItemGARP;
severity.twoItemGARP(1,3) = (MAX(1) + MAX(2) + MAX(3))/violationcounts.twoItemGARP;
severity.twoItemGARP(1,4) = (MAX(1)+MAX(2)+MAX(3)+MAX(4))/violationcounts.twoItemGARP;
severity.twoItemGARP(1,5) = (MAX(1)+MAX(2)+MAX(3)+MAX(4)+MAX(5))/violationcounts.twoItemGARP;
severity.twoItemGARP(1,6) = (MAX(1)+MAX(2)+MAX(3)+MAX(4)+MAX(5)+MAX(6))/violationcounts.twoItemGARP;
severity.twoItemGARP(1,7) = (MAX(1)+MAX(2)+MAX(3)+MAX(4)+MAX(5)+MAX(6)+MAX(7))/violationcounts.twoItemGARP;
violationperchoice.twoItemGARP = violationbychoice;

save('violationSeverity.mat','severity');
save('violationMatrices.mat','violationMats');
save('violationPerChoice.mat','violationperchoice');
save('violationCounts.mat','violationcounts');
%%
set = preProcessed.threeItemGARP3435.revtasks;
choice = preProcessed.threeItemGARP3435.choices;

[violation, violationbychoice] = threeItemGARP1213ViolationCounter(set,choice);

violations.threeItemGARP3435 = violation;
violationcounts.threeItemGARP3435 = nnz(violations.threeItemGARP3435)/2;

[MAX, violations ] = threeItemGARP3435ChoiceOmitTest( violation, violationbychoice, set );

violationMats.threeItemGARP3435 = violations;
violationcounts.threeItemGARP3435 = nnz(violationMats.threeItemGARP3435)/2;


severity.threeItemGARP3435(1,1) = MAX(1)/violationcounts.threeItemGARP3435; %calculates how many violations remain when the choice that makes the most number of violations is removed
severity.threeItemGARP3435(1,2) = (MAX(1)+ MAX(2))/violationcounts.threeItemGARP3435;
severity.threeItemGARP3435(1,3) = (MAX(1) + MAX(2) + MAX(3))/violationcounts.threeItemGARP3435;
severity.threeItemGARP3435(1,4) = (MAX(1)+MAX(2)+MAX(3)+MAX(4))/violationcounts.threeItemGARP3435;
severity.threeItemGARP3435(1,5) = (MAX(1)+MAX(2)+MAX(3)+MAX(4)+MAX(5))/violationcounts.threeItemGARP3435;
severity.threeItemGARP3435(1,6) = (MAX(1)+MAX(2)+MAX(3)+MAX(4)+MAX(5)+MAX(6))/violationcounts.threeItemGARP3435;
severity.threeItemGARP3435(1,7) = (MAX(1)+MAX(2)+MAX(3)+MAX(4)+MAX(5)+MAX(6)+MAX(7))/violationcounts.threeItemGARP3435;
violationperchoice.threeItemGARP3435 = violationbychoice;

save('violationSeverity.mat','severity');
save('violationMatrices.mat','violationMats');
save('violationPerChoice.mat','violationperchoice');
save('violationCounts.mat','violationcounts');
%%
set = preProcessed.threeItemGARP3445.revtasks;
choice = preProcessed.threeItemGARP3445.choices;

[violation, violationbychoice] = threeItemGARP1223ViolationCounter(set,choice);

violations.threeItemGARP3445 = violation;
violationcounts.threeItemGARP3445 = nnz(violations.threeItemGARP3445)/2;

[MAX, violations ] = threeItemGARP3445ChoiceOmitTest( violation, violationbychoice, set );

violationMats.threeItemGARP3445 = violations;
violationcounts.threeItemGARP3445 = nnz(violationMats.threeItemGARP3445)/2;

severity.threeItemGARP3445(1,1) = MAX(1)/violationcounts.threeItemGARP3445; %calculates how many violations remain when the choice that makes the most number of violations is removed
severity.threeItemGARP3445(1,2) = (MAX(1)+ MAX(2))/violationcounts.threeItemGARP3445;
severity.threeItemGARP3445(1,3) = (MAX(1) + MAX(2) + MAX(3))/violationcounts.threeItemGARP3445;
severity.threeItemGARP3445(1,4) = (MAX(1)+MAX(2)+MAX(3)+MAX(4))/violationcounts.threeItemGARP3445;
severity.threeItemGARP3445(1,5) = (MAX(1)+MAX(2)+MAX(3)+MAX(4)+MAX(5))/violationcounts.threeItemGARP3445;
severity.threeItemGARP3445(1,6) = (MAX(1)+MAX(2)+MAX(3)+MAX(4)+MAX(5)+MAX(6))/violationcounts.threeItemGARP3445;
severity.threeItemGARP3445(1,7) = (MAX(1)+MAX(2)+MAX(3)+MAX(4)+MAX(5)+MAX(6)+MAX(7))/violationcounts.threeItemGARP3445;
violationperchoice.threeItemGARP3445 = violationbychoice;

save('violationSeverity.mat','severity');
save('violationMatrices.mat','violationMats');
save('violationPerChoice.mat','violationperchoice');
save('violationCounts.mat','violationcounts');
%%
set = preProcessed.threeItemGARP3545.revtasks;
choice = preProcessed.threeItemGARP3545.choices;

[violation, violationbychoice] = threeItemGARP1323ViolationCounter(set,choice);

violations.threeItemGARP3545 = violation;
violationcounts.threeItemGARP3545 = nnz(violations.threeItemGARP3545)/2;

[ MAX, violations ] = threeItemGARP3545ChoiceOmitTest( violation, violationbychoice, set );

violationMats.threeItemGARP3545 = violations;
violationcounts.threeItemGARP3545 = nnz(violationMats.threeItemGARP3545)/2;

severity.threeItemGARP3545(1,1) = MAX(1)/violationcounts.threeItemGARP3545; %calculates how many violations remain when the choice that makes the most number of violations is removed
severity.threeItemGARP3545(1,2) = (MAX(1)+ MAX(2))/violationcounts.threeItemGARP3545;
severity.threeItemGARP3545(1,3) = (MAX(1) + MAX(2) + MAX(3))/violationcounts.threeItemGARP3545;
severity.threeItemGARP3545(1,4) = (MAX(1)+MAX(2)+MAX(3)+MAX(4))/violationcounts.threeItemGARP3545;
severity.threeItemGARP3545(1,5) = (MAX(1)+MAX(2)+MAX(3)+MAX(4)+MAX(5))/violationcounts.threeItemGARP3545;
severity.threeItemGARP3545(1,6) = (MAX(1)+MAX(2)+MAX(3)+MAX(4)+MAX(5)+MAX(6))/violationcounts.threeItemGARP3545;
severity.threeItemGARP3545(1,7) = (MAX(1)+MAX(2)+MAX(3)+MAX(4)+MAX(5)+MAX(6)+MAX(7))/violationcounts.threeItemGARP3545;
violationperchoice.threeItemGARP3545 = violationbychoice;

save('violationSeverity.mat','severity');
save('violationMatrices.mat','violationMats');
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

[ firstMax, secondMax, thirdMax, fourthMax, fifthMax, sixthMax, seventhMax, violations ] = threeItemCyclicalChoiceOmit( violation, violationbychoice, set1, choice1, set2, choice2, set3, choice3 );

violationMats.threeItemCyclical = violation;
violationcounts.threeItemCyclical = nnz(violationMats.threeItemCyclical);  %Do we divide by 3 here? or by 2? or something else!?

severity.threeItemCyclical(1,1) = firstMax/(violationcounts.threeItemCyclical); %calculates how many violations remain when the choice that makes the most number of violations is removed
severity.threeItemCyclical(1,2) = (firstMax + secondMax)/violationcounts.threeItemCyclical;
severity.threeItemCyclical(1,3) = (firstMax + secondMax + thirdMax)/violationcounts.threeItemCyclical;
severity.threeItemCyclical(1,4) = (firstMax + secondMax + thirdMax + fourthMax)/violationcounts.threeItemCyclical;
severity.threeItemCyclical(1,5) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax)/violationcounts.threeItemCyclical;
severity.threeItemCyclical(1,6) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax + sixthMax)/violationcounts.threeItemCyclical;
severity.threeItemCyclical(1,7) = (firstMax + secondMax + thirdMax + fourthMax + fifthMax + sixthMax + seventhMax)/violationcounts.threeItemCyclical;
violationperchoice.threeItemCyclical = violationbychoice;


save('violationSeverity.mat','severity');
save('violationMatrices.mat','violationMats');
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
    violationSeveritySummary(folder,37) = severity.threeItemCyclical(1);
    violationSeveritySummary(folder,38) = severity.threeItemCyclical(2);
    violationSeveritySummary(folder,39) = severity.threeItemCyclical(3);
    violationSeveritySummary(folder,40) = severity.threeItemCyclical(4);
    violationSeveritySummary(folder,41) = severity.threeItemCyclical(5);
    violationSeveritySummary(folder,42) = severity.threeItemCyclical(6);
    violationSeveritySummary(folder,43) = severity.threeItemCyclical(7);
    
    cd('../');
end

save('violationSeveritySummary.mat','violationSeveritySummary');