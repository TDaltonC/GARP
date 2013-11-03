
% starts off in GARP.YAOABehaviorVersion.records
cd('C:/Users/Niree/Documents/GitHub/GARP/YAOAPrePilot/records');
subjects = dir;

% goes into subject folders sequentially - starting at the top and
% proceeding one at a time - and creates a second column in behavioral.secs
% for the difference in response time secs between each response. 

load('1_20130124T120921.mat');
for j = 1:(length(behavioral.secs(:,1)) - 1)
    behavioral.secs(1,2) = NaN;
    behavioral.secs(j+1,2) = behavioral.secs(j+1,1) - behavioral.secs(j,1);
end
behavioral.secs(45,2) = NaN; %remove because ISI (Part 1 and Part 2) captured
behavioral.secs(89,2) = NaN; %remove because ISI (Part 2 and Part 3) captured
behavioral.secs(133,2) = NaN; %remove because ISI (Part 3 and Part 4) captured
save('1_20130124T120921.mat', 'behavioral', 'settings');

load('2_20130124T121034.mat');
for j = 1:(length(behavioral.secs(:,1)) - 1)
    behavioral.secs(1,2) = NaN;
    behavioral.secs(j+1,2) = behavioral.secs(j+1,1) - behavioral.secs(j,1);
end
behavioral.secs(45,2) = NaN; %remove because ISI (Part 1 and Part 2) captured
behavioral.secs(89,2) = NaN; %remove because ISI (Part 2 and Part 3) captured
behavioral.secs(133,2) = NaN; %remove because ISI (Part 3 and Part 4) captured
save('2_20130124T121034.mat', 'behavioral', 'settings');

    
for i = 3:length(subjects)
    load(subjects(i).name)
    for j = 1:(length(behavioral.secs(:,1)) - 1)
        behavioral.secs(1,2) = NaN;
        behavioral.secs(j+1,2) = behavioral.secs(j+1,1) - behavioral.secs(j,1);
    end
    behavioral.secs(45,2) = NaN; %remove because ISI (Part 1 and Part 2) captured
    behavioral.secs(89,2) = NaN; %remove because ISI (Part 2 and Part 3) captured
    behavioral.secs(133,2) = NaN; %remove because ISI (Part 3 and Part 4) captured
    save(subjects(i).name, 'behavioral', 'settings');
    
end

