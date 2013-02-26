cd ('/Users/Dalton/Documents/MATLAB/GARP/GARP/PrePilot/RandomModel');
subjects = dir;
SummaryDirectViolationCount = zeros(length(subjects)+1,5);

    SummaryMatrix.limitGARP = zeros(25,25);
    SummaryMatrix.twoItemGARP = zeros(35,35);
    SummaryMatrix.threeItemGARP1213 = zeros(35,35);
    SummaryMatrix.threeItemGARP1223 = zeros(35,35);
    SummaryMatrix.threeItemGARP1323 = zeros(35,35);
    SummaryMatrix.threeItemCyclical = zeros(35,35,35);

for folder = 1:length(subjects)
    if subjects(folder).name(1) == '.';
        continue
    end
    if subjects(folder).name(1) == 'S';
        continue
    end
    cd(subjects(folder).name);
    load ('violationCounts.mat');
    load ('violationMatrices.mat');
    load ('preProcessed.mat');
    SummaryDirectViolationCount(folder,1) = preProcessed.subjID;
    SummaryDirectViolationCount(folder,2) = violationcounts.limitGARP;
    SummaryDirectViolationCount(folder,3) = violationcounts.twoItemGARP;
    SummaryDirectViolationCount(folder,4) = violationcounts.threeItemGARP1213;
    SummaryDirectViolationCount(folder,5) = violationcounts.threeItemGARP1223;
    SummaryDirectViolationCount(folder,6) = violationcounts.threeItemGARP1323;
    SummaryDirectViolationCount(folder,7) = violationcounts.threeItemCyclical;
    
    SummaryMatrix.limitGARP = SummaryMatrix.limitGARP + violations.limitGARP;
    SummaryMatrix.twoItemGARP = SummaryMatrix.twoItemGARP + violations.twoItemGARP;
    SummaryMatrix.threeItemGARP1213 = SummaryMatrix.threeItemGARP1213 + violations.threeItemGARP1213;
    SummaryMatrix.threeItemGARP1223 = SummaryMatrix.threeItemGARP1223 + violations.threeItemGARP1223;
    SummaryMatrix.threeItemGARP1323 = SummaryMatrix.threeItemGARP1323 + violations.threeItemGARP1323;
    SummaryMatrix.threeItemCyclical = SummaryMatrix.threeItemCyclical + violations.threeItemCyclical;
    
    cd('../');
end
cd('Summary');
save('violationSummary.mat','SummaryDirectViolationCount', 'SummaryMatrix');