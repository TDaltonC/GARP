cd ('/Users/Dalton/Documents/MATLAB/GARP/GARP/PrePilot/RandomModel/Scripts');
numberOfRandomSubjects = 1000;
subjects = 1:numberOfRandomSubjects;% Count all of the subjects in the folder
load('protoSubject.mat');
cd ('../');
for subject = 1:length(subjects)          % create (and enter) a forlder for each "subject"
    folderName = num2str(subject);
    switch length(folderName)
        case 1
            mkdir(['00000' folderName]);
            cd(['00000' folderName]);
        case 2
            mkdir(['0000' folderName]);
            cd(['0000' folderName])
        case 3
            mkdir(['000' folderName]);
            cd(['000' folderName])
        case 4
            mkdir(['00' folderName]);
            cd(['00' folderName])
        case 5
            mkdir(['0' folderName]);
            cd(['0' folderName])
        case 6
            mkdir(folderName);
            cd(folderName)
    end
    %% Bring over the tesks from the protoSubject.
    preProcessed.subjID                  = settings.subjID;
    preProcessed.limitGARP.        tasks = settings.limitGARPTasks;
    preProcessed.twoItemGARP.      tasks = settings.twoItemGARPTasks;
    preProcessed.threeItemGARP1213.tasks = settings.threeItemGARPTasks1213;
    preProcessed.threeItemGARP1223.tasks = settings.threeItemGARPTasks1223;
    preProcessed.threeItemGARP1323.tasks = settings.threeItemGARPTasks1323;

    
    %% Make up random answers for each subject
    preProcessed.limitGARP.choices = randi(2,length(preProcessed.limitGARP.tasks),2);
    preProcessed.twoItemGARP.choices = randi(2,length(preProcessed.twoItemGARP.tasks),2);
    preProcessed.threeItemGARP1213.choices= randi(2,length(preProcessed.threeItemGARP1213.tasks),2);
    preProcessed.threeItemGARP1223.choices= randi(2,length(preProcessed.threeItemGARP1223.tasks),2);
    preProcessed.threeItemGARP1323.choices= randi(2,length(preProcessed.threeItemGARP1323.tasks),2);
    
    %%Convert the choices so that the answer is seperated out
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
    %% Convert the tasks so that they include zeros
    
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
     

    %%Count the violations
set = preProcessed.limitGARP.tasks;
choice = preProcessed.limitGARP.choices;

cross = zeros (length(set));
violation = zeros (length(set));
i = 1;
j = 1;
for i = 1 : length(set);
    for j = 1 : length(set);
        if set(i,1) > set(j,1) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
           set(i,2) < set(j,2); % And line 'j' is on top of line 'i' on the right side
                cross(i,j) = 1;
                if choice(i) == 2 && ...
                   choice(j) == 1;
                   violation(i,j) = 1;
                end
        end
        
        if set(i,1) < set(j,1) && ...  % Do they cross so that line 'j' is on top of line 'i' on the left side
           set(i,2) > set(j,2); % And line 'i' is on top of line 'j' on the right side
                cross(i,j) = 1;
                if choice(i) == 1 && ...
                   choice(j) == 2;
                   violation(i,j) = 1;
                end
        end
    end
end
violations.limitGARP = violation;
violationcounts.limitGARP = nnz(violations.limitGARP)/2;
save('violationMatrices.mat','violations');
save('violationCounts.mat','violationcounts');
%%
set = preProcessed.twoItemGARP.tasks;
choice = preProcessed.twoItemGARP.choices;

Price = zeros(length(set), 2);
for i = 1:length(set);
    Price(i,1) = (set(2,2,i)-set(1,2,i))/(set(1,1,i)-set(2,1,i));
    Price(i,2) = 1;
end

cross = zeros (length(set));
violation = zeros (length(set));
i = 1;
j = 1;
for i = 1 : length(set);
    for j = 1 : length(set);
        if set(1,1,i) >= set(1,1,j) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
           set(1,2,i) >= set(1,2,j) && ...  % 
           set(2,1,i) <= set(2,1,j) && ...  % And have line 'j' above line line 'i' on the right
           set(2,2,i) <= set(2,2,j);
            if (set(1,1,i) ~= set(1,1,j) ||...   %Then is first basket in 'i' not equal to the first basket in 'j'
                set(1,2,i) ~= set(1,2,j));
               if (set(2,1,i) ~= set(2,1,j) ||...%Then is second basket in 'i' not equal to the second basket in 'j'
                   set(2,2,i) ~= set(2,2,j));
                cross(i,j) = 1;
                if choice(i) == 2 && ...
                   choice(j) == 1;
                   violation(i,j) = 1;
                   AEIMatrix(i,j) = max(dot(Price(i,:),set(1,:,j))/dot(Price(i,:),(set(2,:,i)))-eps, dot(Price(j,:),set(2,:,i))/dot(Price(j,:),set(1,:,j))-eps);
                end
               end
            end
        end
        
        if set(1,1,i) <= set(1,1,j) && ...   % Vice Versa
           set(1,2,i) <= set(1,2,j) && ...
           set(2,1,i) >= set(2,1,j) && ...
           set(2,2,i) >= set(2,2,j);
            if (set(1,1,i) ~= set(1,1,j) ||...
                set(1,2,i) ~= set(1,2,j));
               if (set(2,1,i) ~= set(2,1,j) ||...
                   set(2,2,i) ~= set(2,2,j));
                cross(i,j) = 1;
                if choice(i) == 1 && ...
                   choice(j) == 2;
                    violation(i,j) = 1;
                   % AEIMatrix(i,j) = max(dot(Price(i,:),set(1,:,j))/dot(Price(i,:),(set(2,:,i)))-eps, dot(Price(j,:),set(2,:,i))/dot(Price(j,:),set(1,:,j))-eps);
                end
               end
            end
        end
    end
end
violations.twoItemGARP = violation;
violationcounts.twoItemGARP = nnz(violations.twoItemGARP)/2;
save('violationMatrices.mat','violations');
save('violationCounts.mat','violationcounts');
%%
set = preProcessed.threeItemGARP1213.revtasks;
choice = preProcessed.threeItemGARP1213.choices;

cross = zeros (length(set));
violation = zeros (length(set));
i = 1;
j = 1;
for i = 1 : length(set);
    for j = 1 : length(set);
        if set(1,1,i) >= set(1,1,j) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
           set(1,2,i) >= set(1,2,j) && ...  % 
           set(2,1,i) <= set(2,1,j) && ...  % And have line 'j' above line line 'i' on the right
           set(2,3,i) <= set(2,3,j);
            if (set(1,1,i) ~= set(1,1,j) ||...   %Then is first basket in 'i' not equal to the first basket in 'j'
                set(1,2,i) ~= set(1,2,j));
               if (set(2,1,i) ~= set(2,1,j) ||...%Then is second basket in 'i' not equal to the second basket in 'j'
                   set(2,3,i) ~= set(2,3,j));
                cross(i,j) = 1;
                if choice(i) == 2 && ...
                   choice(j) == 1;
                    violation(i,j) = 1;
                end
               end
            end
        end
        if set(1,1,i) <= set(1,1,j) && ...   % Vice Versa
           set(1,2,i) <= set(1,2,j) && ...
           set(2,1,i) >= set(2,1,j) && ...
           set(2,3,i) >= set(2,3,j);
            if (set(1,1,i) ~= set(1,1,j) ||...
                set(1,2,i) ~= set(1,2,j));
               if (set(2,1,i) ~= set(2,1,j) ||...
                   set(2,3,i) ~= set(2,3,j));
                cross(i,j) = 1;
                if choice(i) == 1 && ...
                   choice(j) == 2;
                    violation(i,j) = 1;
                end
               end
            end
        end
    end
end
violations.threeItemGARP1213 = violation;
violationcounts.threeItemGARP1213 = nnz(violations.threeItemGARP1213)/2;
save('violationMatrices.mat','violations');
save('violationCounts.mat','violationcounts');

%%Count Violations
set = preProcessed.threeItemGARP1223.revtasks;
choice = preProcessed.threeItemGARP1223.choices;

cross = zeros (length(set));
violation = zeros (length(set));
i = 1;
j = 1;
for i = 1 : length(set);
    for j = 1 : length(set);
        if set(1,1,i) >= set(1,1,j) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
           set(1,2,i) >= set(1,2,j) && ...  % 
           set(2,2,i) <= set(2,2,j) && ...  % And have line 'j' above line line 'i' on the right
           set(2,3,i) <= set(2,3,j);
            if (set(1,1,i) ~= set(1,1,j) ||...   %Then is first basket in 'i' not equal to the first basket in 'j'
                set(1,2,i) ~= set(1,2,j));
               if (set(2,2,i) ~= set(2,2,j) ||...%Then is second basket in 'i' not equal to the second basket in 'j'
                   set(2,3,i) ~= set(2,3,j));
                cross(i,j) = 1;
                if choice(i) == 2 && ...
                   choice(j) == 1;
                    violation(i,j) = 1;
                end
               end
            end
        end
        if set(1,1,i) <= set(1,1,j) && ...   % Vice Versa
           set(1,2,i) <= set(1,2,j) && ...
           set(2,2,i) >= set(2,2,j) && ...
           set(2,3,i) >= set(2,3,j);
            if (set(1,1,i) ~= set(1,1,j) ||...
                set(1,2,i) ~= set(1,2,j));
               if (set(2,2,i) ~= set(2,2,j) ||...
                   set(2,3,i) ~= set(2,3,j));
                cross(i,j) = 1;
                if choice(i) == 1 && ...
                   choice(j) == 2;
                    violation(i,j) = 1;
                end
               end
            end
        end
    end
end
violations.threeItemGARP1223 = violation;
violationcounts.threeItemGARP1223 = nnz(violations.threeItemGARP1223)/2;
save('violationMatrices.mat','violations');
save('violationCounts.mat','violationcounts');
%%
set = preProcessed.threeItemGARP1323.revtasks;
choice = preProcessed.threeItemGARP1323.choices;

cross = zeros (length(set));
violation = zeros (length(set));
i = 1;
j = 1;
for i = 1 : length(set);
    for j = 1 : length(set);
        if set(1,1,i) >= set(1,1,j) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
           set(1,3,i) >= set(1,3,j) && ...  % 
           set(2,2,i) <= set(2,2,j) && ...  % And have line 'j' above line line 'i' on the right
           set(2,3,i) <= set(2,3,j);
            if (set(1,1,i) ~= set(1,1,j) ||...   %Then is first basket in 'i' not equal to the first basket in 'j'
                set(1,3,i) ~= set(1,3,j));
               if (set(2,2,i) ~= set(2,2,j) ||...%Then is second basket in 'i' not equal to the second basket in 'j'
                   set(2,3,i) ~= set(2,3,j));
                cross(i,j) = 1;
                if choice(i) == 2 && ...
                   choice(j) == 1;
                    violation(i,j) = 1;
                end
               end
            end
        end
        if set(1,1,i) <= set(1,1,j) && ...   % Vice Versa
           set(1,3,i) <= set(1,3,j) && ...
           set(2,2,i) >= set(2,2,j) && ...
           set(2,3,i) >= set(2,3,j);
            if (set(1,1,i) ~= set(1,1,j) ||...
                set(1,3,i) ~= set(1,3,j));
               if (set(2,2,i) ~= set(2,2,j) ||...
                   set(2,3,i) ~= set(2,3,j));
                cross(i,j) = 1;
                if choice(i) == 1 && ...
                   choice(j) == 2;
                    violation(i,j) = 1;
                end
               end
            end
        end
    end
end
violations.threeItemGARP1323 = violation;
violationcounts.threeItemGARP1323 = nnz(violations.threeItemGARP1323)/2;


    save('violationMatrices.mat','violations');
    save('violationCounts.mat','violationcounts');     

%%
%Cyclical Violation Counter
set1 = preProcessed.threeItemGARP1213.revtasks;
choice1 = preProcessed.threeItemGARP1213.choices;
set2 = preProcessed.threeItemGARP1223.revtasks;
choice2 = preProcessed.threeItemGARP1223.choices;
set3 = preProcessed.threeItemGARP1323.revtasks;
choice3 = preProcessed.threeItemGARP1323.choices;

cross = zeros (length(set1),length(set1),length(set1));
violation = zeros(length(set1),length(set1),length(set1));
i = 1;
j = 1;
k = 1;
for i = 1 : length(set1);
    for j = 1 : length(set2);
        for k = 1: length(set3);
            if set1(2,1,i) >= set3(1,1,k) && ... %This is condition + from Brocas' notes
                    set1(2,3,i) >= set3(1,3,k) && ...
                    set3(2,2,k) >= set2(2,2,j) && ...
                    set3(2,3,k) >= set2(2,3,j) && ...
                    set2(1,1,j) >= set1(1,1,i) && ...
                    set2(1,2,j) >= set1(1,2,i);
                if (set1(1,1,i) ~= set2(1,1,j) ||... %Then is first bundle in set1 different than the first bundle in set2
                        set1(1,2,i) ~= set2(1,2,j));
                    if (set1(2,1,i) ~= set3(1,1,k) ||... %Then is second bundle in set1 different than the first bundle in set3
                            set1(2,3,i) ~= set3(1,3,k)); 
                        if (set2(2,2,j) ~= set3(2,2,k) ||... %Then is second bundle in set2 different than the second bundle in set3
                                set2(2,3,j) ~= set3(2,3,k));
                            cross(i,j,k) = 1; %Then, there is a possible contradiction
                            if choice1(i) == 1 && ... 
                                    choice2(j) == 2 && ...
                                    choice3(k) == 1;
                                violation(i,j,k) = 1;
                            end
                        end
                    end
                end
            end
        end
        if set1(2,1,i) <= set3(1,1,k) && ... %This is condition ++ from Brocas' notes
                set1(2,3,i) <= set3(1,3,k) && ...
                set3(2,2,k) <= set2(2,2,j) && ...
                set3(2,3,k) <= set2(2,3,j) && ...
                set2(1,1,j) <= set1(1,1,i) && ...
                set2(1,2,j) <= set1(1,2,i);
            if (set1(1,1,i) ~= set2(1,1,j) ||... %Then is first bundle in set1 different than the first bundle in set2
                    set1(1,2,i) ~= set2(1,2,j));
                if (set1(2,1,i) ~= set3(1,1,k) ||... %Then is second bundle in set1 different than the first bundle in set3
                        set1(2,3,i) ~= set3(1,3,k));
                    if (set2(2,2,j) ~= set3(2,2,k) ||... %Then is second bundle in set2 different than the second bundle in set3
                            set2(2,3,j) ~= set3(2,3,k));
                        cross(i,j,k) = 1; %Then, there is a possible contradiction
                        if choice1(i) == 2 && ...
                                choice2(j) == 1 && ...
                                choice3(k) == 2;
                            violation(i,j,k) = 1;
                        end
                    end
                end
            end
        end
    end
end

violations.threeItemCyclical = violation;
violationcounts.threeItemCyclical = nnz(violations.threeItemCyclical);  %Do we divide by 3 here? or by 2? or something else!?
save('violationMatrices.mat','violations');
save('violationCounts.mat','violationcounts');   
    
    
    
    
    
    save('preProcessed.mat','preProcessed') 


%Right before the end of the loop
cd('../');
clearvars -except i subjects settings
%End of the loop

end