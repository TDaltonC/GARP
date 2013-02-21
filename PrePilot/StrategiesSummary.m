%SUMMARY Summary of this function goes here
%   Detailed explanation goes here
cd('/Users/Niree/Documents/GitHub/GARP/PrePilot/preProcessedRev');
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
    StrategySummary(folder,6) = strategy.threeItemGARP1213.heuristic;
    StrategySummary(folder,7) = strategy.threeItemGARP1213.deviation;
    StrategySummary(folder,8) = strategy.threeItemGARP1223.heuristic;
    StrategySummary(folder,9) = strategy.threeItemGARP1223.deviation;
    StrategySummary(folder,10) = strategy.threeItemGARP1323.heuristic;
    StrategySummary(folder,11) = strategy.threeItemGARP1323.deviation;
    
    cd('../');
end

save('StrategySummary.mat','StrategySummary');


