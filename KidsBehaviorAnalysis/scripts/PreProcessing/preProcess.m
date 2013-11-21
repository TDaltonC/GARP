% This script takes all of the subject data from the /RawData forlder and
% preprocesses it (unscramples the order and adds quantities to all of the
% choices) and places it in the /PreProcessed folder

function [ output_args ] = preProcess( input_args )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% cd('/Users/Dalton/Documents/MATLAB/GARP/GARP/PrePilot/records');
% cd('C:/Users/Niree/Documents/GitHub/GARP/PrePilot/records');
% cd('C:/Users/Niree/Documents/GitHub/GARP/YAOAExperiment/records');
cd('/Users/Dalton/Documents/MATLAB/GARP/GARP/KidsBehaviorAnalysis/RawData/GARP');

subjects = dir;             % count all of the subjects in the folder
for i = 1:length(subjects)  %make sure that you're looking at a subject folder
    if subjects(i).name(1) == '.';
        continue
    end
    clear behavioral settings;
    load(subjects(i).name);
    cd ('../../PreProcessed');
    folderName = num2str(settings.subjID);
    switch length(folderName)
        case 1
            mkdir(['00' folderName]);
            cd(['00' folderName]);
        case 2
            mkdir(['0' folderName]);
            cd(['0' folderName])
        case 3
            mkdir(folderName);
            cd(folderName);
    end
    %% Bring over the tasks from the subject data files.
    preProcessed.subjID                  = settings.subjID;
    preProcessed.limitGARP.        tasks = settings.limitGARPTasks;
    preProcessed.twoItemGARP.      tasks = settings.twoItemGARPTasks;
    preProcessed.threeItemGARP3435.tasks = settings.threeItemGARPTasks1213;
    preProcessed.threeItemGARP3445.tasks = settings.threeItemGARPTasks1223;
    preProcessed.threeItemGARP3545.tasks = settings.threeItemGARPTasks1323;
    for press = 1: length(behavioral.key)
        if behavioral.key(press) == 'f';
            if settings.flipLR(press) == 0;
                choice(press) = 1;
            elseif settings.flipLR(press) == 1;
                choice(press) = 2;
            end
        elseif behavioral.key(press) == 'j';
            if settings.flipLR(press) == 0;
                choice(press) = 2;
            elseif settings.flipLR(press) == 1;
                choice(press) = 1;
            end
        end
    end
    
    %% Unshuffle the choices, and corresponding response times, and make sure the that they get paired to the right trials 
    lgIndex = 1;
    tiIndex = 1;
    ti21Index=1;
    ti22Index=1;
    ti32Index=1;
    preProcessed.limitGARP.choices = zeros(length(preProcessed.limitGARP.tasks),2);
%     preProcessed.limitGARP.responseTimes = zeros(length(preProcessed.limitGARP.tasks),2);
    preProcessed.twoItemGARP.choices = zeros(length(preProcessed.twoItemGARP.tasks),2);
%     preProcessed.twoItemGARP.responseTimes = zeros(length(preProcessed.twoItemGARP.tasks),2);
    preProcessed.threeItemGARP3435.choices = zeros(length(preProcessed.threeItemGARP3435.tasks),2);
%     preProcessed.threeItemGARP3435.responseTimes = zeros(length(preProcessed.threeItemGARP3435.tasks),2);
    preProcessed.threeItemGARP3445.choices = zeros(length(preProcessed.threeItemGARP3445.tasks),2);
%     preProcessed.threeItemGARP3445.responseTimes = zeros(length(preProcessed.threeItemGARP3445.tasks),2);
    preProcessed.threeItemGARP3545.choices = zeros(length(preProcessed.threeItemGARP3545.tasks),2);
%     preProcessed.threeItemGARP3545.responseTimes = zeros(length(preProcessed.threeItemGARP3545.tasks),2);
    for tn=1 : length(settings.trialOrder)
    switch settings.trialOrder(tn)
        case 1
            reorder = settings.limitGARPOrder(lgIndex);
            if preProcessed.limitGARP.choices(reorder) == 0 
                preProcessed.limitGARP.choices(reorder) = choice(tn);
%                 preProcessed.limitGARP.responseTimes(reorder) = behavioral.secs(tn,2);
            else
                preProcessed.limitGARP.choices(reorder,2) = choice(tn);
%                 preProcessed.limitGARP.responseTimes(reorder,2) = behavioral.secs(tn,2);
            end
            lgIndex = lgIndex + 1;
        case 2
            reorder = settings.twoItemGARPOrder(tiIndex);
            if preProcessed.twoItemGARP.choices(reorder) == 0 
                preProcessed.twoItemGARP.choices(reorder) = choice(tn);
%                 preProcessed.twoItemGARP.responseTimes(reorder) = behavioral.secs(tn,2);
            else
                preProcessed.twoItemGARP.choices(reorder,2) = choice(tn);
%                 preProcessed.twoItemGARP.responseTimes(reorder,2) = behavioral.secs(tn,2);
            end
            tiIndex = tiIndex + 1;
        case 3
            reorder = settings.threeItemGARPOrder1213(ti21Index);
            if preProcessed.threeItemGARP3435.choices(reorder) == 0 
                preProcessed.threeItemGARP3435.choices(reorder) = choice(tn);
%                 preProcessed.threeItemGARP3435.responseTimes(reorder) = behavioral.secs(tn,2);
            else
                preProcessed.threeItemGARP3435.choices(reorder,2) = choice(tn);
%                 preProcessed.threeItemGARP3435.responseTimes(reorder,2) = behavioral.secs(tn,2);
            end
            ti21Index=ti21Index+1;
        case 4
            reorder = settings.threeItemGARPOrder1223(ti22Index);
            if preProcessed.threeItemGARP3445.choices(reorder) == 0 
                preProcessed.threeItemGARP3445.choices(reorder) = choice(tn);
%                 preProcessed.threeItemGARP3445.responseTimes(reorder) = behavioral.secs(tn,2);
            else
                preProcessed.threeItemGARP3445.choices(reorder,2) = choice(tn);
%                 preProcessed.threeItemGARP3445.responseTimes(reorder,2) = behavioral.secs(tn,2);
            end
            ti22Index = ti22Index + 1;
        case 5
            reorder = settings.threeItemGARPOrder1323(ti32Index);
            if preProcessed.threeItemGARP3545.choices(reorder) == 0 
                preProcessed.threeItemGARP3545.choices(reorder) = choice(tn);
%                 preProcessed.threeItemGARP3545.responseTimes(reorder) = behavioral.secs(tn,2);
            else
                preProcessed.threeItemGARP3545.choices(reorder,2) = choice(tn);
%                 preProcessed.threeItemGARP3545.responseTimes(reorder,2) = behavioral.secs(tn,2);
            end
            ti32Index = ti32Index + 1;
    end
    end
    save('preProcessed.mat','preProcessed') 


%Right before the end of the loop
cd('../../RawData/GARP');
clearvars -except i subjects
%End of the loop
end

%%Convert the choices from 1's and 2's to the amouts of goods that those
%%code for
cd('../../PreProcessed');
subjects = dir;
for folder = 1:length(subjects)
    if subjects(folder).name(1) == '.';
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
  
  for i=1:length(preProcessed.limitGARP.tasks);
      preProcessed.limitGARP.revtasks(1,1,i) = preProcessed.limitGARP.tasks(i,1);
      preProcessed.limitGARP.revtasks(1,2,i) = 0;
      preProcessed.limitGARP.revtasks(2,1,i) = 0;
      preProcessed.limitGARP.revtasks(2,2,i) = preProcessed.limitGARP.tasks(i,2);
  end
  
save('preProcessed.mat','preProcessed');

cd('../');



end
end



