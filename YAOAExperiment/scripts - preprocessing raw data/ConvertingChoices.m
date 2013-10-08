%For converting representations of choices (1 and 2) to actual amounts of
%each item selected 

% if running for YA
cd('C:/Users/Niree/Documents/GitHub/GARP/YAOAExperiment/YA/preProcessedRev');

% if running for OA
% cd('C:/Users/Niree/Documents/GitHub/GARP/YAOAExperiment/OA/preProcessedRev');

subjects = dir;
for folder = 1:length(subjects)
    if ismember((subjects(folder).name(1)), {'.','C','r','S','v','V','s'});
        continue
    end
    cd(subjects(folder).name);
    load('preProcessed.mat');
 
  for i=1:length(preProcessed.threeItemGARP3435.tasks);
      preProcessed.threeItemGARP3435.revtasks(1,1,i) = preProcessed.threeItemGARP3435.tasks(1,1,i);
      preProcessed.threeItemGARP3435.revtasks(1,2,i) = preProcessed.threeItemGARP3435.tasks(1,2,i);
      preProcessed.threeItemGARP3435.revtasks(1,3,i) = 0;
      preProcessed.threeItemGARP3435.revtasks(2,1,i) = preProcessed.threeItemGARP3435.tasks(2,1,i);
      preProcessed.threeItemGARP3435.revtasks(2,2,i) = 0;
      preProcessed.threeItemGARP3435.revtasks(2,3,i) = preProcessed.threeItemGARP3435.tasks(2,2,i);
  end
    
  for i=1:length(preProcessed.threeItemGARP3445.tasks);
      preProcessed.threeItemGARP3445.revtasks(1,1,i) = preProcessed.threeItemGARP3445.tasks(1,1,i);
      preProcessed.threeItemGARP3445.revtasks(1,2,i) = preProcessed.threeItemGARP3445.tasks(1,2,i);
      preProcessed.threeItemGARP3445.revtasks(1,3,i) = 0;
      preProcessed.threeItemGARP3445.revtasks(2,1,i) = 0;
      preProcessed.threeItemGARP3445.revtasks(2,2,i) = preProcessed.threeItemGARP3445.tasks(2,1,i);
      preProcessed.threeItemGARP3445.revtasks(2,3,i) = preProcessed.threeItemGARP3445.tasks(2,2,i);
  end
 
  for i=1:length(preProcessed.threeItemGARP3545.tasks);
      preProcessed.threeItemGARP3545.revtasks(1,1,i) = preProcessed.threeItemGARP3545.tasks(1,1,i);
      preProcessed.threeItemGARP3545.revtasks(1,2,i) = 0;
      preProcessed.threeItemGARP3545.revtasks(1,3,i) = preProcessed.threeItemGARP3545.tasks(1,2,i);
      preProcessed.threeItemGARP3545.revtasks(2,1,i) = 0;
      preProcessed.threeItemGARP3545.revtasks(2,2,i) = preProcessed.threeItemGARP3545.tasks(2,1,i);
      preProcessed.threeItemGARP3545.revtasks(2,3,i) = preProcessed.threeItemGARP3545.tasks(2,2,i);
  end
  
  for i=1:length(preProcessed.catch.tasks);
      preProcessed.catch.revtasks(1,1,i) = preProcessed.catch.tasks(i,1);
      preProcessed.catch.revtasks(1,2,i) = 0;
      preProcessed.catch.revtasks(2,1,i) = 0;
      preProcessed.catch.revtasks(2,2,i) = preProcessed.catch.tasks(i,2);
  end
  
save('preProcessed.mat','preProcessed');

cd('../');



end



 