%SUMMARY Summary of this function goes here
%   Detailed explanation goes here
% cd('/Users/Niree/Documents/GitHub/GARP/PrePilot/preProcessedRev');

% if running for YA
cd('/Users/Niree/Documents/GitHub/GARP/YAOAExperiment/YA/preProcessedRev/');

% if running for OA
% cd('/Users/Niree/Documents/GitHub/GARP/YAOAExperiment/OA/preProcessedRev/');

subjects = dir;
StrategySummary = zeros(length(subjects)+1,11);

for folder = 1:length(subjects)
    if ismember((subjects(folder).name(1)), {'.','C','r','S','v','V','s'});
        continue
    end
    cd(subjects(folder).name);
    load ('strategy.mat');
    load ('preProcessed.mat');
    
        
    StrategySummary(folder,1) = preProcessed.subjID;
%     StrategySummary(folder,2) = strategy.catch.heuristic;
%     StrategySummary(folder,3) = strategy.catch.deviation;
    StrategySummary(folder,2) = strategy.twoItemGARP.heuristic;
    StrategySummary(folder,3) = strategy.twoItemGARP.deviation;
    StrategySummary(folder,4) = strategy.threeItemGARP3435.heuristic;
    StrategySummary(folder,5) = strategy.threeItemGARP3435.deviation;
    StrategySummary(folder,6) = strategy.threeItemGARP3445.heuristic;
    StrategySummary(folder,7) = strategy.threeItemGARP3445.deviation;
    StrategySummary(folder,8) = strategy.threeItemGARP3545.heuristic;
    StrategySummary(folder,9) = strategy.threeItemGARP3545.deviation;
    
    cd('../');
end

save('StrategySummary.mat','StrategySummary');


