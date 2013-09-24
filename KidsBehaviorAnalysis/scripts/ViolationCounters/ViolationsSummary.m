%SUMMARY Summary of this function goes here
%   Detailed explanation goes here
% cd('/Users/Niree/Documents/GitHub/GARP/PrePilot/preProcessedRev');
% cd('/Users/Niree/Documents/GitHub/GARP/YAOAPrePilot/preProcessedRev');
cd('/Users/Dalton/Documents/MATLAB/GARP/GARP/KidsBehaviorAnalysis/PreProcessed/');

subjects = dir;
ViolationSummary = zeros(length(subjects)+1,8);

for folder = 1:length(subjects)
    if subjects(folder).name(1) == '.';
        continue
    end
    
    if subjects(folder).name(1) == 'v';
        continue
    end
    
    if subjects(folder).name(1) == 'S';
        continue
    end
    
    if subjects(folder).name(1) == 'r';
        continue
    end
    
    if subjects(folder).name(1) == 'C';
        continue
    end
    
    cd(subjects(folder).name);
    load ('violationCounts.mat');
    load('preProcessed.mat');
    
    %first column of summary file is subject ID, followed by violation
    %counts for each task. the last column combines the three types of
    %three item GARP along with cyclical three item violations
    
    ViolationSummary(folder,1) = preProcessed.subjID;
    ViolationSummary(folder,2) = violationcounts.limitGARP;
    ViolationSummary(folder,3) = violationcounts.twoItemGARP;
    ViolationSummary(folder,4) = violationcounts.threeItemGARP3435;
%     ViolationSummary(folder,5) = violationcounts.threeItemGARP1223;
%     ViolationSummary(folder,6) = violationcounts.threeItemGARP1323;
%     ViolationSummary(folder,7) = violationcounts.threeItemCyclical;
%     x = [violationcounts.threeItemGARP1213, violationcounts.threeItemGARP1223, ...
%         violationcounts.threeItemGARP1323, violationcounts.threeItemCyclical];
%     sum3ItemViolations = sum(x,2);
%     ViolationSummary(folder,8) = sum3ItemViolations;

    
    cd('../');
end
cd('../Summaries');
save('ViolationsSummaryTable.mat','ViolationSummary');


