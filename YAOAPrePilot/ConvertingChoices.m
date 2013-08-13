
%For converting representations of choices (1 and 2) to actual amounts of
%each item selected 

cd('/Users/Niree/Documents/GitHub/GARP/YAOAprePilot/preProcessedRev/');
subjects = dir;
for folder = 1:length(subjects)
    if subjects(folder).name(1) == '.';
        continue
    end
    cd(subjects(folder).name);
    load('preProcessed.mat');
 
  for i=1:length(preProcessed.threeItemGARP1213.tasks);
      preProcessed.threeItemGARP1213.revtasks(1,1,i) = preProcessed.threeItemGARP1213.tasks(1,1,i);
      preProcessed.threeItemGARP1213.revtasks(1,2,i) = preProcessed.threeItemGARP1213.tasks(1,2,i);
      preProcessed.threeItemGARP1213.revtasks(1,3,i) = 0;
      preProcessed.threeItemGARP1213.revtasks(2,1,i) = preProcessed.threeItemGARP1213.tasks(2,1,i);
      preProcessed.threeItemGARP1213.revtasks(2,2,i) = 0;
      preProcessed.threeItemGARP1213.revtasks(2,3,i) = preProcessed.threeItemGARP1213.tasks(2,2,i);
  end
 
  for i=1:length(preProcessed.threeItemGARP1223.tasks);
      preProcessed.threeItemGARP1223.revtasks(1,1,i) = preProcessed.threeItemGARP1223.tasks(1,1,i);
      preProcessed.threeItemGARP1223.revtasks(1,2,i) = preProcessed.threeItemGARP1223.tasks(1,2,i);
      preProcessed.threeItemGARP1223.revtasks(1,3,i) = 0;
      preProcessed.threeItemGARP1223.revtasks(2,1,i) = 0;
      preProcessed.threeItemGARP1223.revtasks(2,2,i) = preProcessed.threeItemGARP1223.tasks(2,1,i);
      preProcessed.threeItemGARP1223.revtasks(2,3,i) = preProcessed.threeItemGARP1223.tasks(2,2,i);
  end
 
     
  for i=1:length(preProcessed.threeItemGARP1323.tasks);
      preProcessed.threeItemGARP1323.revtasks(1,1,i) = preProcessed.threeItemGARP1323.tasks(1,1,i);
      preProcessed.threeItemGARP1323.revtasks(1,2,i) = 0;
      preProcessed.threeItemGARP1323.revtasks(1,3,i) = preProcessed.threeItemGARP1323.tasks(1,2,i);
      preProcessed.threeItemGARP1323.revtasks(2,1,i) = 0;
      preProcessed.threeItemGARP1323.revtasks(2,2,i) = preProcessed.threeItemGARP1323.tasks(2,1,i);
      preProcessed.threeItemGARP1323.revtasks(2,3,i) = preProcessed.threeItemGARP1323.tasks(2,2,i);
  end
  
  for i=1:length(preProcessed.limitGARP.tasks);
      preProcessed.limitGARP.revtasks(1,1,i) = preProcessed.limitGARP.tasks(i,1);
      preProcessed.limitGARP.revtasks(1,2,i) = 0;
      preProcessed.limitGARP.revtasks(2,1,i) = 0;
      preProcessed.limitGARP.revtasks(2,2,i) = preProcessed.limitGARP.tasks(i,2);
  end
  
save('preProcessed.mat','preProcessed');

cd('../');
clearvars -except 'subjects', 'folder';


end

