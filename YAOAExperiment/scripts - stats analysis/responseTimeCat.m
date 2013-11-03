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
    load('violationPerChoice.mat');
    
    A1 = preProcessed.twoItemGARP.responseTimes;
    A2 = preProcessed.threeItemGARP3435.responseTimes;
    A3 = preProcessed.threeItemGARP3445.responseTimes;
    A4 = preProcessed.threeItemGARP3545.responseTimes;
    preProcessed.allRTimesAndViolations = vertcat(A1,A2,A3,A4);
    
    B1 = violationperchoice.twoItemGARP;
    B2 = violationperchoice.threeItemGARP3435;
    B3 = violationperchoice.threeItemGARP3445;
    B4 = violationperchoice.threeItemGARP3545;
    preProcessed.allRTimesAndViolations(1:140,2) = vertcat(B1,B2,B3,B4);
    
    
    %takes out all of the first choices and corresponding RT's of each part (where RT is
    %nonsensical). 4 choices and RT's deleted in all for each subject.
    i = 1;
    j = 1;
    while i < 137
        if isnan(preProcessed.allRTimesAndViolations(j,1)) == 1 %if no RT in 1st column
        elseif isnan(preProcessed.allRTimesAndViolations(j,1)) == 0
            preProcessed.allRTimesAndViolationsRev(i,1) = ...
                preProcessed.allRTimesAndViolations(j,1);
            preProcessed.allRTimesAndViolationsRev(i,2) = ...
                preProcessed.allRTimesAndViolations(j,2);
            i = i + 1;
        end
        j = j + 1;
    end
   
    preProcessed.allRTimesAndViolationsRev = preProcessed.allRTimesAndViolationsRev(1:136,1:2);
    
    save('preProcessed.mat','preProcessed');       
   
    RTandViolaScatter = scatter(preProcessed.allRTimesAndViolationsRev(1:136,1),...
        preProcessed.allRTimesAndViolationsRev(1:136,2));
    print -djpeg RTandViolaRevScatter.jpg
    
    clearvars -except i subjects
    
    cd('../');
end


