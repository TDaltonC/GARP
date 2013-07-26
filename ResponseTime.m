
% starts off in GARP.YAOABehaviorVersion.records
cd('C:/Users/Niree/Documents/GitHub/GARP/PrePilot/records');
subjects = dir;

% goes into subject folders sequentially - starting at the top and going
% proceeding one at a time - and creates a second column in behavioral.secs
% for the difference in response time secs between each response. 

load('1_20130124T120921.mat');
for j = 1:(length(behavioral.secs(:,1)) - 1)
    behavioral.secs(1,2) = behavioral.secs(1,1);
    behavioral.secs(j+1,2) = behavioral.secs(j+1,1) - behavioral.secs(j,1);
end
save('1_20130124T120921.mat', 'behavioral');
clearvars -except i subjects

load('2_20130124T121034.mat');
for j = 1:(length(behavioral.secs(:,1)) - 1)
    behavioral.secs(1,2) = behavioral.secs(1,1);
    behavioral.secs(j+1,2) = behavioral.secs(j+1,1) - behavioral.secs(j,1);
end
save('2_20130124T121034.mat', 'behavioral');
clearvars -except i subjects
    
for i = 3:length(subjects)
    load(subjects(i).name)
    for j = 1:(length(behavioral.secs(:,1)) - 1)
        behavioral.secs(1,2) = behavioral.secs(1,1);
        behavioral.secs(j+1,2) = behavioral.secs(j+1,1) - behavioral.secs(j,1);
    end
    save(subjects(i).name, 'behavioral');
    clearvars -except i subjects
end

