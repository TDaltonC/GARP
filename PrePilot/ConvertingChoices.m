<<<<<<< HEAD
%For converting representations of choices (1 and 2) to actual amounts of
%each item selected 

cd('/Users/Niree/Documents/GitHub/GARP/prePilot/preProcessedRev/');
subjects = dir;
for folder = 1:length(subjects)
    if subjects(folder).name(1) == '.';
        continue
    end
    cd(subjects(folder).name);
    load('preProcessed.mat');
 
% for i=1:length(preProcessed.limitGARP.tasks);
%     if preProcessed.limitGARP.choices(i,1) == 1;
%         preProcessed.limitGARP.actualchoices(2,i) = 0;
%         preProcessed.limitGARP.actualchoices(1,i) = preProcessed.limitGARP.tasks(i,1);
%     elseif preProcessed.limitGARP.choices(i,1) == 2;
%         preProcessed.limitGARP.actualchoices(1,i) = 0;
%         preProcessed.limitGARP.actualchoices(2,i) = preProcessed.limitGARP.tasks(i,2);
%     end
% end
    
%  for i=1:length(preProcessed.twoItemGARP.tasks);
%     if preProcessed.twoItemGARP.choices(i,1) == 1;
%         preProcessed.twoItemGARP.actualchoices(1,i) = preProcessed.twoItemGARP.tasks(1,1,i);
%         preProcessed.twoItemGARP.actualchoices(2,i) = preProcessed.twoItemGARP.tasks(1,2,i);
%      elseif preProcessed.twoItemGARP.choices(i,1) == 2;
%         preProcessed.twoItemGARP.actualchoices(1,i) = preProcessed.twoItemGARP.tasks(2,1,i);
%         preProcessed.twoItemGARP.actualchoices(2,i) = preProcessed.twoItemGARP.tasks(2,2,i);
%      end
%  end
 
%   for i=1:length(preProcessed.threeItemGARP1213.tasks);
%       if preProcessed.threeItemGARP1213.choices(i,1) == 1;
%          preProcessed.threeItemGARP1213.actualchoices(1,i) = preProcessed.threeItemGARP1213.tasks(1,1,i);
%          preProcessed.threeItemGARP1213.actualchoices(2,i) = preProcessed.threeItemGARP1213.tasks(1,2,i);
%          preProcessed.threeItemGARP1213.actualchoices(3,i) = 0;
%       elseif preProcessed.threeItemGARP1213.choices(i,1) == 2;
%          preProcessed.threeItemGARP1213.actualchoices(1,i) = preProcessed.threeItemGARP1213.tasks(2,1,i);
%          preProcessed.threeItemGARP1213.actualchoices(2,i) = 0;
%          preProcessed.threeItemGARP1213.actualchoices(3,i) = preProcessed.threeItemGARP1213.tasks(2,2,i);
%      end
%   end
  
  for i=1:length(preProcessed.threeItemGARP1213.tasks);
      preProcessed.threeItemGARP1213.revtasks(1,1,i) = preProcessed.threeItemGARP1213.tasks(1,1,i);
      preProcessed.threeItemGARP1213.revtasks(1,2,i) = preProcessed.threeItemGARP1213.tasks(1,2,i);
      preProcessed.threeItemGARP1213.revtasks(1,3,i) = 0;
      preProcessed.threeItemGARP1213.revtasks(2,1,i) = preProcessed.threeItemGARP1213.tasks(2,1,i);
      preProcessed.threeItemGARP1213.revtasks(2,2,i) = 0;
      preProcessed.threeItemGARP1213.revtasks(2,3,i) = preProcessed.threeItemGARP1213.tasks(2,2,i);
  end
 
%     for i=1:length(preProcessed.threeItemGARP1223.tasks);
%         if preProcessed.threeItemGARP1223.choices(i,1) == 1;
%          preProcessed.threeItemGARP1223.actualchoices(1,i) = preProcessed.threeItemGARP1223.tasks(1,1,i);
%          preProcessed.threeItemGARP1223.actualchoices(2,i) = preProcessed.threeItemGARP1223.tasks(1,2,i);
%          preProcessed.threeItemGARP1223.actualchoices(3,i) = 0;
%         elseif preProcessed.threeItemGARP1223.choices(i,1) == 2;
%          preProcessed.threeItemGARP1223.actualchoices(1,i) = 0;
%          preProcessed.threeItemGARP1223.actualchoices(2,i) = preProcessed.threeItemGARP1223.tasks(2,1,i);
%          preProcessed.threeItemGARP1223.actualchoices(3,i) = preProcessed.threeItemGARP1223.tasks(2,2,i);
%         end
%     end
    
  for i=1:length(preProcessed.threeItemGARP1223.tasks);
      preProcessed.threeItemGARP1223.revtasks(1,1,i) = preProcessed.threeItemGARP1223.tasks(1,1,i);
      preProcessed.threeItemGARP1223.revtasks(1,2,i) = preProcessed.threeItemGARP1223.tasks(1,2,i);
      preProcessed.threeItemGARP1223.revtasks(1,3,i) = 0;
      preProcessed.threeItemGARP1223.revtasks(2,1,i) = 0;
      preProcessed.threeItemGARP1223.revtasks(2,2,i) = preProcessed.threeItemGARP1223.tasks(2,1,i);
      preProcessed.threeItemGARP1223.revtasks(2,3,i) = preProcessed.threeItemGARP1223.tasks(2,2,i);
  end
 
%      for i=1:length(preProcessed.threeItemGARP1323.tasks);
%          if preProcessed.threeItemGARP1323.choices(i,1) == 1;
%          preProcessed.threeItemGARP1323.actualchoices(1,i) = preProcessed.threeItemGARP1323.tasks(1,1,i);
%          preProcessed.threeItemGARP1323.actualchoices(2,i) = 0;
%          preProcessed.threeItemGARP1323.actualchoices(3,i) = preProcessed.threeItemGARP1323.tasks(1,2,i);
%          elseif preProcessed.threeItemGARP1323.choices(i,1) == 2;
%          preProcessed.threeItemGARP1323.actualchoices(1,i) = 0;
%          preProcessed.threeItemGARP1323.actualchoices(2,i) = preProcessed.threeItemGARP1323.tasks(2,1,i);
%          preProcessed.threeItemGARP1323.actualchoices(3,i) = preProcessed.threeItemGARP1323.tasks(2,2,i);
%          end
%      end
     
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

=======
%For converting representations of choices (1 and 2) to actual amounts of
%each item selected 

cd('/Users/Dalton/Documents/MATLAB/GARP/GARP/PrePilot/preProcessedRev');
subjects = dir;

for folder = 1:length(subjects)
    if subjects(folder).name(1) == '.';
        continue
    end
    if subjects(folder).name(1) == 'S';
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
     
 
                  
save('preProcessed.mat','preProcessed');
cd('../');
end


>>>>>>> Includes the first drat of the Random model
 