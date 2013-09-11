%SUMMARY Summary of this function goes here
%   Detailed explanation goes here
% cd('/Users/Niree/Documents/GitHub/GARP/PrePilot/preProcessedRev');
% cd('/Users/Niree/Documents/GitHub/GARP/YAOAExperiment/preProcessedRev');
cd('/Users/Dalton/Documents/MATLAB/GARP/GARP/KidsBehaviorAnalysis/PreProcessed/');

subjects = dir;
StrategySummary = zeros(length(subjects)+1,11);

for folder = 1:length(subjects)
    if subjects(folder).name(1) == '.';
        continue
    end
    cd(subjects(folder).name);
    load ('strategy.mat');
    load ('preProcessed.mat');
    
        
    StrategySummary(folder,1) = preProcessed.subjID;
    StrategySummary(folder,2) = strategy.limitGARP.heuristic;
    StrategySummary(folder,3) = strategy.limitGARP.deviation;
    StrategySummary(folder,4) = strategy.twoItemGARP.heuristic;
    StrategySummary(folder,5) = strategy.twoItemGARP.deviation;
    StrategySummary(folder,6) = strategy.threeItemGARP3435.heuristic;
    StrategySummary(folder,7) = strategy.threeItemGARP3435.deviation;
    StrategySummary(folder,8) = strategy.threeItemGARP3445.heuristic;
    StrategySummary(folder,9) = strategy.threeItemGARP3445.deviation;
    StrategySummary(folder,10) = strategy.threeItemGARP3545.heuristic;
    StrategySummary(folder,11) = strategy.threeItemGARP3545.deviation;
    
    cd('../');
end

save('StrategySummary.mat','StrategySummary');


