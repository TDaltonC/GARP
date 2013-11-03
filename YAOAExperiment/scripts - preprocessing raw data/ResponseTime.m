
% cd ('/Users/Dalton/Documents/MATLAB/GARP/GARP/PrePilot/records');

% if running for YA
cd('C:/Users/Niree/Documents/GitHub/GARP/YAOAExperiment/YA/records');

% if running for OA
% cd('C:/Users/Niree/Documents/GitHub/GARP/YAOAExperiment/OA/records');

subjects = dir;

% goes into subject folders sequentially - starting at the top and
% proceeding one at a time - and creates a second column in behavioral.secs
% for the difference in response time secs between each response. 

load('201_20130912T123807.mat');
for j = 1:(length(behavioral.secs(:,1)) - 1)
    behavioral.secs(1,2) = NaN; %remove because interval between start time and Part 1 captured
    behavioral.secs(j+1,2) = behavioral.secs(j+1,1) - behavioral.secs(j,1);
end
behavioral.secs(39,2) = NaN; %remove because ISI (Part 1 and Part 2) captured
behavioral.secs(77,2) = NaN; %remove because ISI (Part 2 and Part 3) captured
behavioral.secs(115,2) = NaN; %remove because ISI (Part 3 and Part 4) captured
save('201_20130912T123807.mat', 'behavioral', 'settings');

load('202_20130912T123909.mat');
for j = 1:(length(behavioral.secs(:,1)) - 1)
    behavioral.secs(1,2) = NaN; %remove because interval between start time and Part 1 captured
    behavioral.secs(j+1,2) = behavioral.secs(j+1,1) - behavioral.secs(j,1);
end
behavioral.secs(39,2) = NaN; %remove because ISI (Part 1 and Part 2) captured
behavioral.secs(77,2) = NaN; %remove because ISI (Part 2 and Part 3) captured
behavioral.secs(115,2) = NaN; %remove because ISI (Part 3 and Part 4) captured
save('202_20130912T123909.mat', 'behavioral', 'settings');

    
for i = 3:length(subjects)
    load(subjects(i).name)
    for j = 1:(length(behavioral.secs(:,1)) - 1)
        behavioral.secs(1,2) = NaN; %remove because interval between start time and Part 1 captured
        behavioral.secs(j+1,2) = behavioral.secs(j+1,1) - behavioral.secs(j,1);
    end
    behavioral.secs(39,2) = NaN; %remove because ISI (Part 1 and Part 2) captured
    behavioral.secs(77,2) = NaN; %remove because ISI (Part 2 and Part 3) captured
    behavioral.secs(115,2) = NaN; %remove because ISI (Part 3 and Part 4) captured
    save(subjects(i).name, 'behavioral', 'settings');
    
end

