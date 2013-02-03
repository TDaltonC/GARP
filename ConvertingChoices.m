%For converting representations of choices (1 and 2) to actual amounts of
%each item selected 

cd('/Users/Dalton/Documents/MATLAB/GARP/GARP/PrePilot/preProcessed');
subjects = dir;
for folder = 1:length(subjects)
    if subjects(folder).name(1) == '.';
        continue
    end
    cd(subjects(folder).name);
load('preProcessed.mat');
 
 for i=1:length(preProcessed.twoItemGARP.choices);
     if  preProcessed.twoItemGARP.choices(i) == 1;
         preProcessed.twoItemGARP.actualchoices(1,i) = preProcessed.twoItemGARP.tasks(1,1,i);
         preProcessed.twoItemGARP.actualchoices(2,i) = preProcessed.twoItemGARP.tasks(1,2,i);
  elseif preProcessed.twoItemGARP.choices(i) == 2;
         preProcessed.twoItemGARP.actualchoices(1,i) = preProcessed.twoItemGARP.tasks(2,1,i);
         preProcessed.twoItemGARP.actualchoices(2,i) = preProcessed.twoItemGARP.tasks(2,2,i);
     end
 end
 
  for i=1:length(preProcessed.threeItemGARP1213.choices);
      if preProcessed.threeItemGARP1213.choices(i) == 1;
         preProcessed.threeItemGARP1213.actualchoices(1,i) = preProcessed.threeItemGARP1213.tasks(1,1,i);
         preProcessed.threeItemGARP1213.actualchoices(2,i) = preProcessed.threeItemGARP1213.tasks(1,2,i);
         preProcessed.threeItemGARP1213.actualchoices(3,i) = 0;
      elseif preProcessed.threeItemGARP1213.choices(i) == 2;
         preProcessed.threeItemGARP1213.actualchoices(1,i) = preProcessed.threeItemGARP1213.tasks(2,1,i);
         preProcessed.threeItemGARP1213.actualchoices(2,i) = 0;
         preProcessed.threeItemGARP1213.actualchoices(3,i) = preProcessed.threeItemGARP1213.tasks(2,2,i);
     end
  end
 
    for i=1:length(preProcessed.threeItemGARP1223.choices);
        if preProcessed.threeItemGARP1223.choices(i) == 1;
         preProcessed.threeItemGARP1223.actualchoices(1,i) = preProcessed.threeItemGARP1223.tasks(1,1,i);
         preProcessed.threeItemGARP1223.actualchoices(2,i) = preProcessed.threeItemGARP1223.tasks(1,2,i);
         preProcessed.threeItemGARP1223.actualchoices(3,i) = 0;
        elseif preProcessed.threeItemGARP1223.choices(i) == 2;
         preProcessed.threeItemGARP1223.actualchoices(1,i) = 0;
         preProcessed.threeItemGARP1223.actualchoices(2,i) = preProcessed.threeItemGARP1223.tasks(2,1,i);
         preProcessed.threeItemGARP1223.actualchoices(3,i) = preProcessed.threeItemGARP1223.tasks(2,2,i);
        end
    end
 
     for i=1:length(preProcessed.threeItemGARP1323.choices);
         if preProcessed.threeItemGARP1323.choices(i) == 1;
         preProcessed.threeItemGARP1323.actualchoices(1,i) = preProcessed.threeItemGARP1323.tasks(1,1,i);
         preProcessed.threeItemGARP1323.actualchoices(2,i) = 0;
         preProcessed.threeItemGARP1323.actualchoices(3,i) = preProcessed.threeItemGARP1323.tasks(1,2,i);
         elseif preProcessed.threeItemGARP1323.choices(i) == 2;
         preProcessed.threeItemGARP1323.actualchoices(1,i) = 0;
         preProcessed.threeItemGARP1323.actualchoices(2,i) = preProcessed.threeItemGARP1323.tasks(2,1,i);
         preProcessed.threeItemGARP1323.actualchoices(3,i) = preProcessed.threeItemGARP1323.tasks(2,2,i);
         end
     end
     
     for i=1:length(preProcessed.limitGARP.choices);
         if preProcessed.limitGARP.choices(i) == 1;
             preProcessed.limitGARP.actualchoices(2,i) = 0;
             preProcessed.limitGARP.actualchoices(1,i) = preProcessed.limitGARP.tasks(i,1);
         elseif preProcessed.limitGARP.choices(i) == 2;
             preProcessed.limitGARP.actualchoices(1,i) = 0;
             preProcessed.limitGARP.actualchoices(2,i) = preProcessed.limitGARP.tasks(i,2);
         end
     end
     
                 
save('preProcessed.mat','preProcessed');
cd('../');
end
 