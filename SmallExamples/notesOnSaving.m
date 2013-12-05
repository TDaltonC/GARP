%This is a play ground for building the strcures for saving stuff
cd ('GARP') % Sets the current directory to GARP
%% Settings



% At the end of the settings
settings.recordfolder = 'records';
% if the records folder doesn't exist, create it. 
mkdir(settings.recordfloder);
% creat the file name for this run of this subject
recordname = [setting.recordfolder '/' num2str(subjid) '_' datestr(now,'yyyymmddTHHMMSS') '.mat'];
% Save the settings (the results are saved later)
save (recordname, setting)
% Restrict the keys that can be used for the Kb commands
if (ismac)
            RestrictKeysForKbCheck([f, j, ESCAPE])
            escKey = KbName('ESCAPE');
        else
            RestrictKeysForKbCheck([f, j, Esc])
            escKey = KbName('Esc');
        end

%% during the experiment
% Here we need to be mindfull that only the "behavioral." data structure will be saved.



% Measure the leangth of the array that codes for which experiement
% comes when
i = 1;
while i < % the leangth of the string measured above

    % figure out which trial type (1-5) should be presented
    % call the right function that Niree is writing
    % flip
    
    % Key response
Waitfor(0.2sec)    
[behavioural.secs(i,1), keyCode, deltaSecs] = KbWait;
behavioural.key(i,1) = KbName(keyCode);
i = i++
end
%% at the end 
% up at the end of setings we created a file to hold all of our important data
% Now we will save all of the behavioural data in the same -.mat file

save (recordname, behavioural, -append)



