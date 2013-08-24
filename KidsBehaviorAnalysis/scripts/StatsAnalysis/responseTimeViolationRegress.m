% cd('/Users/Niree/Documents/GitHub/GARP/prePilot/preProcessedRev/');
cd('/Users/Niree/Documents/GitHub/GARP/YAOAExperiment/preProcessedRev/');
subjects = dir;

for folder = 1:length(subjects)
    if subjects(folder).name(1) == '.';
        continue
    end
    
    if subjects(folder).name(1) == 'C';
        break 
        
    cd(subjects(folder).name);
    load('preProcessed.mat');
    load('violationPerChoice.mat');
    
    trialArray = {'catch', 'twoItemGARP', 'threeItemGARP1213', 'threeItemGARP1223', 'threeItemGARP1323'};
    
    for i = 1:5;
       x = preProcessed.(trialArray{i}).responseTimes(:,1); %sets response times as x variable for regression
       y = violationperchoice.(trialArray{i}); %sets violations per choice as y variable for regression
       stats = regstats(y,x);
       f = stats.fstat.f;
       pVal = stats.fstat.pval;
       regressionResults(folder,1) = folder;
       regressionResults(folder,2*i) = f;
       regressionResults(folder,(2*i+1)) = pVal;
    end
    
    save('regression.mat','regressionResults');
    


cd('../');

    end

end
