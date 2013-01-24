% This program forms part of the Working Memory Capacity Battery, 
% written by Stephan Lewandowsky, Klaus Oberauer, Lee-Xieng Yang, and Ullrich Ecker. 
% The WMCBattery is available online at the website of the Cognitive Science
% Laboratories of the University of Western Australia's School of Psychology:
% http://www.cogsciwa.com ("Software" button on main menu).
% Conditions of Use: Using the WMCBattery is free of charge but the authors 
% request that the associated paper be cited (add details later) 
% when publications arise out of data collection with the WMCBattery. 
% The authors do not guarantee the WMCBattery's functionality. 
% This task requires Matlab version 7.5 (2007b) or higher and the 
% Psychophysics Toolbox version 2.54 or 3.0.8. 
function rc=MU(subject,screenparms)
global ptb3

try %catch errors for entire function and all subsidiaries

    %::::::::::::::::: add shared function directory to path
	ptb3=-1;
    fnDir = ['../sharedFuns'];
    preserveLW = lastwarn;
    lastwarn('');
    addpath(fnDir)
    if strmatch ('Name is nonexistent or not a directory',lastwarn)
        fnDir='';
        error('Faulty WMCBattery installation: Directory ''sharedFuns'' not found')
    end
    lastwarn(preserveLW);

    %::::::::::::::::: get version of ptb, this sets global variable ptb3
    getptb;

    if nargin < 2
        screenparms = prepexp;
        subject=getSubject(screenparms);
    end


    %::::::::::::::::: setup completed, define basic constants
    Npracticetrials = 2;
    Ntesttrials = 15;
    setsize4mt = [2 3   3 4 3 4 5 4 5 3 5 3 3 5 4 4 5];
    opnum4mt =   [4 3   3 4 6 5 5 3 2 2 3 5 4 4 6 2 6];

    seed = 27775; %use 'seed=27775 + subject;' to change sequence for each subject
    rand ('state', seed);

    if ptb3
        expinfo.stimulussize = 40;
        expinfo.msgsize = 25;
        expinfo.targetsize = 15;
    else
        expinfo.stimulussize = (screenparms.rect(RectBottom) - screenparms.rect(RectTop))/10;
        expinfo.msgsize = 40;
        expinfo.targetsize = 20;
    end
    expinfo.leftofcenter = 0;            %by default
    expinfo.textrow = 20;
    expinfo.iii = 0.25;          %inter-item interval (all times in sec)
    expinfo.iti = 1;             %inter-trial interval
    expinfo.itesti = 1;          %inter-test interval
    expinfo.startinterval = 1;   %interval between fixation cross and first start value
    expinfo.prestime = [1, 1.3]; %presentation time for start values / for operations
    expinfo.PauseAfterBreak = 2;

    WaitSecs(0.1); % Hack to pre-load WaitSecs.dll/mex

    datafile = '../Data/MU.dat';
    fid = fopen (datafile,'a');
    if fid<0                             %trap problems before commencing data collection
        error(['Cannot open ' datafile '. WMCBattery installation may be faulty'])
    end
    practicemsg   = 'Press Space Bar to Begin Practice';
    beginmsg      = 'Press Space Bar to Begin Task';
    nexttrialmsg  = 'Press Space Bar to Continue With Next Trial';
    expovermsg    = 'Task over: Press Space Bar to Proceed to Next Task';

    Maketrial2(setsize4mt,opnum4mt);
    trials = textread('mutrials.txt', '');
    for t = 1:size(trials,1)
        trial(t).setsize = trials(t,2);
        trial(t).opnum = trials(t,3);
        trial(t).startvalue = trials(t,4:9);
        trial(t).oploc = trials(t,10:17);
        trial(t).op = trials(t,18:25);
        trial(t).testorder = trials(t,26:31);
        trial(t).endvalue = trials(t,32:37);
    end

    %::::::::::::::::: do practice
    waitfkey (screenparms, expinfo, practicemsg);
    for i = 1:Npracticetrials
        Displaytrial(screenparms, expinfo, trial(i));
        waitfkey (screenparms, expinfo, nexttrialmsg);
        WaitSecs(expinfo.iti);
    end

    %::::::::::::::::: do test
    waitfkey (screenparms, expinfo, beginmsg);
    for i = Npracticetrials+1:Npracticetrials+Ntesttrials
        [WW, response] = Displaytrial(screenparms, expinfo, trial(i));
        trial(i).WW = WW;
        trial(i).response = response;
        waitfkey (screenparms, expinfo, nexttrialmsg);
        WaitSecs(expinfo.iti);
    end

    %::::::::::::::::: now record data
    for i=Npracticetrials+1:Npracticetrials+Ntesttrials
        fprintf (fid, '%3d %3d  ', subject, i );
        for j=1:6
            fprintf (fid, '%1s ', str2mat(trial(i).response(j)));
        end
        for j=1:6
            fprintf (fid, '%3d ', trial(i).WW(j));
        end
        fprintf (fid,'/n');
    end
    fclose(fid);

    %::::::::::::::::: essential: Close it all down properly!
    waitfkey (screenparms, expinfo, expovermsg);
    if nargin<2, shutDown; end
    rc=0;



    %:::::::::::::::::::: any error anywhere at any time...
catch errNo
    if strfind(errNo.message,'PsychtoolboxVersion')
        disp('Psychtoolbox not installed. WMCBattery cannot be run');
        return;
    end

    if ptb3>-1, shutDown; end
    rc=-1;
    if strfind(errNo.message,'User terminated')
        disp(errNo.message);
        return;    %no need for error message if user pressed F12
    end
    rethrow(errNo); %having shut down properly, continue with MatLab error
end



    function shutDown
        if ptb3, ListenChar(0); end
        Screen('CloseAll');
        fclose('all');
        rmpath(fnDir);
        while KbCheck; end
        FlushEvents('keyDown');
    end
end