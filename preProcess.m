function [ output_args ] = preProcess( input_args )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
cd ('/Users/Dalton/Documents/MATLAB/GARP/GARP/PrePilot/records');
subjects = dir;
for i = 1:length(subjects)
    if subjects(i).name(1) == '.';
        continue
    end
    load(subjects(i).name);
    cd ('../preProcessed');
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
    preProcessed.subjID                  = settings.subjID;
    preProcessed.limitGARP.        tasks = settings.limitGARPTasks;
    preProcessed.twoItemGARP.      tasks = settings.twoItemGARPTasks;
    preProcessed.threeItemGARP1213.tasks = settings.threeItemGARPTasks1213;
    preProcessed.threeItemGARP1223.tasks = settings.threeItemGARPTasks1223;
    preProcessed.threeItemGARP1323.tasks = settings.threeItemGARPTasks1323;
    for press = 1: length(behavioral.key)
        if behavioral.key(press) == 'f';
             choice(press) = 1;
        elseif behavioral.key(press) == 'j';
            choice(press) = 2;
        end
    end
    lgIndex = 1;
    tiIndex = 1;
    ti21Index=1;
    ti22Index=1;
    ti32Index=1;
    preProcessed.limitGARP.choices = zeros(length(preProcessed.limitGARP.tasks),2);
    preProcessed.twoItemGARP.choices = zeros(length(preProcessed.twoItemGARP.tasks),2);
    preProcessed.threeItemGARP1213.choices= zeros(length(preProcessed.threeItemGARP1213.tasks),2);
    preProcessed.threeItemGARP1223.choices= zeros(length(preProcessed.threeItemGARP1223.tasks),2);
    preProcessed.threeItemGARP1323.choices= zeros(length(preProcessed.threeItemGARP1323.tasks),2);
    for tn=1 : length(settings.trialOrder)
    switch settings.trialOrder(tn)
        case 1
            reorder = settings.limitGARPOrder(lgIndex);
            if preProcessed.limitGARP.choices(reorder) == 0 
                preProcessed.limitGARP.choices(reorder) = choice(tn);
            else
                preProcessed.limitGARP.choices(reorder,2) = choice(tn);
            end
            lgIndex = lgIndex + 1;
        case 2
            reorder = settings.twoItemGARPOrder(tiIndex);
            if preProcessed.twoItemGARP.choices(reorder) == 0 
                preProcessed.twoItemGARP.choices(reorder) = choice(tn);
            else
                preProcessed.twoItemGARP.choices(reorder,2) = choice(tn);
            end
            tiIndex = tiIndex + 1;
        case 3
            reorder = settings.threeItemGARPOrder1213(ti21Index);
            if preProcessed.threeItemGARP1213.choices(reorder) == 0 
                preProcessed.threeItemGARP1213.choices(reorder) = choice(tn);
            else
                preProcessed.threeItemGARP1213.choices(reorder,2) = choice(tn);
            end
            ti21Index=ti21Index+1;
        case 4
            reorder = settings.threeItemGARPOrder1223(ti22Index);
            if preProcessed.threeItemGARP1223.choices(reorder) == 0 
                preProcessed.threeItemGARP1223.choices(reorder) = choice(tn);
            else
                preProcessed.threeItemGARP1223.choices(reorder,2) = choice(tn);
            end
            ti22Index = ti22Index + 1;
        case 5
            reorder = settings.threeItemGARPOrder1323(ti32Index);
            if preProcessed.threeItemGARP1323.choices(reorder) == 0 
                preProcessed.threeItemGARP1323.choices(reorder) = choice(tn);
            else
                preProcessed.threeItemGARP1323.choices(reorder,2) = choice(tn);
            end
            ti32Index = ti32Index + 1;
    end
    end
    save('preProcessed.mat','preProcessed') 


%Right before the end of the loop
cd('../../records');
clearvars -except i subjects
%End of the loop

end

