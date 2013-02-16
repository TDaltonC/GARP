function [ output_args ] = Summary( input_args )
%SUMMARY Summary of this function goes here
%   Detailed explanation goes here
cd('/Users/Dalton/Documents/MATLAB/GARP/GARP/PrePilot/preProcessedRev');
subjects = dir;
CKBISummary = zeros(length(subjects)+1,5);

for folder = 1:length(subjects)
    if subjects(folder).name(1) == '.';
        continue
    end
    if subjects(folder).name(1) == 'v';
        continue
    end
    cd(subjects(folder).name);
    load ('violationMatricesCKB.mat');
    load ('preProcessed.mat');
    CKBISummary.sum(folder,1) = preProcessed.subjID;
    CKBISummary.sum(folder,2) = sum(sum(violations.limitGARP));
    CKBISummary.sum(folder,3) = sum(sum(violations.twoItemGARP));
    CKBISummary.sum(folder,4) = sum(sum(violations.threeItemGARP1213));
    CKBISummary.sum(folder,5) = sum(sum(violations.threeItemGARP1223));
    CKBISummary.sum(folder,6) = sum(sum(violations.threeItemGARP1323));
    
    CKBISummary.max(folder,1) = preProcessed.subjID;
    CKBISummary.max(folder,2) = max(max(violations.limitGARP));
    CKBISummary.max(folder,3) = max(max(violations.twoItemGARP));
    CKBISummary.max(folder,4) = max(max(violations.threeItemGARP1213));
    CKBISummary.max(folder,5) = max(max(violations.threeItemGARP1223));
    CKBISummary.max(folder,6) = max(max(violations.threeItemGARP1323));
    
    cd('../');
end

save('violationSummary.mat','CKBISummary');
end
