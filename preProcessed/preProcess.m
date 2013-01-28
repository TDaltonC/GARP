function [ output_args ] = preProcess( input_args )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
cd ('/Users/Dalton/Documents/MATLAB/GARP/GARP/PrePilot/records');
subjects = dir;
for i = 4:(length(subjects)-1)
    load(subjects(i).name);
    cd ('../preProcessed');
    mkdir([num2str(settings.subjID)]);
    cd ([num2str(settings.subjID)]);
    preProcessed.limitGARP.tasks = settings.limitGARPTasks;
    preProcessed.twoItemGARP.tasks = settings.twoItemGARPTasks;
    preProcessed.threeItemGARP1213.tasks = settings.threeItemGARPTasks1213;
    preProcessed.threeItemGARP1223.tasks = settings.threeItemGARPTasks1223;
    preProcessed.threeItemGARP1323.tasks = settings.threeItemGARPTasks1323;
    for press = 1: length(behavioral.key)
        if behavioral.key(press) == 'f'
             choice(press) = 1;
        else choice(press) = 2;
        end
    end
    lgIndex = 1;
    tiIndex = 1;
    ti21Index=1;
    ti22Index=1;
    ti32Index=1;
    preProcessed.limitGARP.choices = [];
    preProcessed.twoItemGARP.choices = [];
    preProcessed.threeItemGARP1213.choices=[];
    preProcessed.threeItemGARP1223.choices=[];
    preProcessed.threeItemGARP1323.choices=[];
    for tn=1 : length(settings.trialOrder)
    switch settings.trialOrder(tn)
        case 1
            reorder = settings.limitGARPOrder(lgIndex);
            %if preProcessed.limitGARP.choices(reorder) == [] 
                preProcessed.limitGARP.choices(reorder) = choice(tn);
            %end
            lgIndex = lgIndex + 1;
        case 2
            reorder = settings.twoItemGARPOrder(tiIndex);
            %if preProcessed.twoItemGARP.choices(reorder) == [] 
                preProcessed.twoItemGARP.choices(tiIndex) = choice(tn);
            %end
            tiIndex = tiIndex + 1;
        case 3
            reorder = settings.threeItemGARPOrder1213(ti21Index);
            %if preProcessed.threeItemGARP1213.choices(reorder) == [] 
                preProcessed.threeItemGARP1213.choices(ti21Index) = choice(tn);
            %end
            ti21Index=ti21Index+1;
        case 4
            reorder = settings.threeItemGARPOrder1223(ti22Index);
            %if preProcessed.threeItemGARP1223.choices(reorder) == [] 
                preProcessed.threeItemGARP1223.choices(ti22Index) = choice(tn);
            %end
            ti22Index = ti22Index + 1;
        case 5
            reorder = settings.threeItemGARPOrder1323(ti32Index);
            %if preProcessed.threeItemGARP1323.choices(reorder) == [] 
                preProcessed.threeItemGARP1323.choices(ti32Index) = choice(tn);
            %end
            ti32Index = ti32Index + 1;
    end
    end
    save('precessed.mat','preProcessed') 


%Right before the end of the loop
cd('../../records');
%End of the loop

end

