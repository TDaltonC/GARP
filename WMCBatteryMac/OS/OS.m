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

function rc=OS(subject,screenparms,yesno)
global ptb3
global mfulptr mlessptr

try %catch errors for entire function and all subsidiaries

    %::::::::::::::::: add shared function directory to path
    ptb3=-1;
    fnDir = '..\sharedFuns';
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
    
    %::::::::::::::::: set up task, depending on how it was invoked
    if nargin < 3
        expinfo.yeskey = '/';
        expinfo.nokey = 'Z';
    else
        expinfo.yeskey = yesno{1};
        expinfo.nokey = yesno{2};
    end
    if nargin < 2
        screenparms = prepexp;
        subject=getSubject(screenparms);
    end
    expinfo.yeskey = upper(expinfo.yeskey);
    expinfo.nokey =  upper(expinfo.nokey);


    %::::::::::::::::: setup completed, define basic constants
    maxListLength = 8;
    Npracticetrials = 3; %must be <= length of pll
    pll= [ 3 4 5 ];      %list lengths for practice trials
    listlength = [4:8];  %array of list lengths, each replicated Ntpercond times
    Ntpercond = 3;       %trials per condition (ie list length)
    Ntotaltrials = Ntpercond * length(listlength);
    Ntotalops    = sum(listlength)*Ntpercond;   %total number of ops req'd
    Npracops     = sum(pll);

    seed = 54367;  %use 'seed=54367 + subject;' to change sequence for each subject
    rand ('state', seed);

    if ptb3
        expinfo.stimulussize = 50;
        expinfo.msgsize = 25;
    else
        expinfo.stimulussize = (screenparms.rect(RectBottom) - screenparms.rect(RectTop))/8;
        expinfo.msgsize = 40;
    end
    expinfo.textrow = 20;
    expinfo.leftofcenter = 0;
    expinfo.iii = 0.1;                  %inter-item interval (all times in sec)
    expinfo.Presentationduration = 1;   %presentation time for to-be-remembered stimuli
    expinfo.StudyTestDelay = .5;
    expinfo.InterTrialInterval = 0.5;
    expinfo.responsevisible = 0.2;      %time each response letter is visible on screen
    expinfo.PauseAfterBreak = 2;
    expinfo.ptDuration = 3;		        %maximum time that equations are visible

    WaitSecs(0.1); % Hack to pre-load WaitSecs.dll/mex

    datafile =    '..\Data\OS.dat';
    fid = fopen (datafile,'a');
    if fid<0                             %trap problems before commencing data collection
        error(['Cannot open ' datafile '. WMCBattery installation may be faulty'])
    end
    practicemsg = 'Press Space Bar to Begin Practice';
    beginmsg =    'Press Space Bar to Begin Task';
    expovermsg =  'Task over: Press Space Bar to Proceed to Next Task';
    breakmsg =    'Press Space Bar After Break';


    alphabet = ['B','C','D','F','G','H','J','K','L','M','N','P','R','S','T','V','W','X','Z'];

    %::::::::::::::::: now generate operations for span task
    [pracsentences, allsentences] = generateops(Ntotalops, Npracops);
    mfulptr = 1;
    mlessptr = 1;

    %create structure that governs experiment
    condn = sortrows(repmat(listlength,1,Ntpercond)')';

    responses = zeros(Ntotaltrials, maxListLength)';
    rts       = zeros(Ntotaltrials, maxListLength)';
    senresp   = zeros(Ntotaltrials, maxListLength)';
    sentrts   = zeros(Ntotaltrials, maxListLength)';
    tinfo = struct('condn', num2cell(condn,1), 'responses', num2cell(responses,1), ...
        'rts', num2cell(rts,1),  'senresp', num2cell(senresp,1), 'sentrts', num2cell(sentrts,1));

    %sample lists
    for i = 1:Npracticetrials
        tinfo(i).list = samplelist(alphabet, pll(i) );
        tm = [zeros(1,floor(pll(i)/2)) ...
            ones(1,floor(pll(i)/2) + mod(pll(i),2) )];
        tinfo(i).meaning = tm(randperm(pll(i)));
        tinfo(i).sentences = getops (pracsentences, tinfo(i).meaning);
    end

    %reset global pointers for real trials
    mfulptr = 1;
    mlessptr = 1;

    %::::::::::::::::: do practice
    tp = randperm(Npracticetrials);
    waitfkey (screenparms, expinfo, practicemsg);
    for i = 1:Npracticetrials
        doopspantrial(screenparms, expinfo, tinfo(tp(i)));
        WaitSecs(expinfo.InterTrialInterval);
    end

    %::::::::::::::::: now do experiment proper-repeat sampling of lists to avoid overlap with
    %practice
    for i = 1:Ntotaltrials
        tinfo(i).list = samplelist(alphabet, condn(i) );
        tm = [zeros(1,floor(condn(i)/2)) ...
            ones(1,floor(condn(i)/2) + mod(condn(i),2) )];
        tinfo(i).meaning = tm(randperm(condn(i)));
        tinfo(i).sentences = getops (allsentences, tinfo(i).meaning);
    end

    tp = randperm(Ntotaltrials);
    waitfkey (screenparms, expinfo, beginmsg);
    WaitSecs(1.5);
    for i = 1:Ntotaltrials
        [tinfo(tp(i)).responses, tinfo(tp(i)).rts, tinfo(tp(i)).senresp, ...
            tinfo(tp(i)).sentrts] = doopspantrial(screenparms, expinfo, tinfo(tp(i)));

        if ~mod(i,floor(Ntotaltrials/4)) && (i < Ntotaltrials)
            waitfkey (screenparms, expinfo, breakmsg);
            WaitSecs (expinfo.PauseAfterBreak);
        end
        WaitSecs (expinfo.InterTrialInterval);
    end

    %now record data
    for i=1:Ntotaltrials
        padding = maxListLength-tinfo(tp(i)).condn;
        tinfo(tp(i)).list = [tinfo(tp(i)).list, repmat('%', 1, padding)];
        tinfo(tp(i)).responses = [tinfo(tp(i)).responses, repmat('%', 1, padding)];
        tinfo(tp(i)).meaning = [tinfo(tp(i)).meaning, -ones(1,padding)];
        tinfo(tp(i)).rts = [tinfo(tp(i)).rts, -ones(1,padding)];
        tinfo(tp(i)).senresp = [tinfo(tp(i)).senresp, -ones(1,padding)];
        tinfo(tp(i)).sentrts = [tinfo(tp(i)).sentrts, -ones(1,padding)];

        fprintf (fid, '%3d %3d %3d  ', subject, i, tinfo(tp(i)).condn );
        for j=1:maxListLength
            fprintf (fid, '%s ', tinfo(tp(i)).list(j));
        end
        fprintf(fid, '   ');
        for j=1:maxListLength
            fprintf (fid, '%2c ', tinfo(tp(i)).responses(j));
        end
        fprintf(fid, '   ');
        for j=1:maxListLength
            fprintf (fid, '%6.3f ',tinfo(tp(i)).rts(j));
        end
        fprintf(fid, '   ');
        for j=1:maxListLength
            fprintf (fid, ' %2d ', tinfo(tp(i)).meaning(j));
        end
        fprintf(fid, '   ');
        for j=1:maxListLength
            fprintf (fid, ' %2d ', tinfo(tp(i)).senresp(j));
        end
        fprintf(fid, '   ');
        for j=1:maxListLength
            fprintf (fid, ' %6.3f ', tinfo(tp(i)).sentrts(j));
        end
        fprintf (fid,'\n');
    end
    fclose(fid);

    %essential: Close it all down properly!
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