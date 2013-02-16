function [ output_args ] = Summary( input_args )
%SUMMARY Summary of this function goes here
%   Detailed explanation goes here
cd('/Users/Dalton/Documents/MATLAB/GARP/GARP/PrePilot/preProcessedRev');
subjects = dir;
WARPSummary = zeros(length(subjects)+1,5);

for folder = 1:length(subjects)
    if subjects(folder).name(1) == '.';
        continue
    end
    cd(subjects(folder).name);
    load ('WARPviolationCounts.mat');
    load ('preProcessed.mat');
    WARPSummary(folder,1) = preProcessed.subjID;
    WARPSummary(folder,2) = WARPviolationcounts.limitGARP;
    WARPSummary(folder,3) = WARPviolationcounts.twoItemGARP;
    WARPSummary(folder,4) = WARPviolationcounts.threeItemGARP1213;
    WARPSummary(folder,5) = WARPviolationcounts.threeItemGARP1223;
    WARPSummary(folder,6) = WARPviolationcounts.threeItemGARP1323;
    
    cd('../');
end

save('WARPviolationArray.mat','WARPSummary');
end
