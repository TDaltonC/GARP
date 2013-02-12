function [ output_args ] = Summary( input_args )
%SUMMARY Summary of this function goes here
%   Detailed explanation goes here
cd('/Users/Dalton/Documents/MATLAB/GARP/GARP/PrePilot/preProcessedRev');
subjects = dir;
Summary = zeros(length(subjects)+1,5);

for folder = 1:length(subjects)
    if subjects(folder).name(1) == '.';
        continue
    end
    cd(subjects(folder).name);
    load ('violationCounts.mat');
    load ('preProcessed.mat');
    Summary(folder,1) = preProcessed.subjID;
    Summary(folder,2) = violationcounts.limitGARP;
    Summary(folder,3) = violationcounts.twoItemGARP;
    Summary(folder,4) = violationcounts.threeItemGARP1213;
    Summary(folder,5) = violationcounts.threeItemGARP1223;
    Summary(folder,6) = violationcounts.threeItemGARP1323;
    
    cd('../');
end

save('violationArray.mat','Summary');
end
