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

function WMCBattery(subject)
clear all;
global ptb3

try %to catch errors
    
    %determine which version of sentence span. Choices are:
    % easy
    % hard
    % chinese
    SSversion = 'easy';
    if strcmp(SSversion, 'chinese')
        iDir = 'ChineseInstructions/';
    else
        iDir = 'EnglishInstructions/';
    end

    %determine response keys
    expinfo.yeskey = '/';          %e.g., for right arrow: 'right';
    expinfo.nokey = 'Z';           %e.g., for left arrow: 'left';
    
    yesno{1}=expinfo.yeskey;
    yesno{2}=expinfo.nokey;         

    %::::::::::::::::: add shared function directory to path
    ptb3=-1;
    fnDir = [cd '/sharedFuns'];
    preserveLW = lastwarn;
    lastwarn('');
    addpath(fnDir)
    if strmatch ('Name is nonexistent or not a directory',lastwarn)
        fnDir='';
        error('Faulty WMCBattery installation: Directory ''sharedFuns'' not found')
    end
    lastwarn(preserveLW);

    %::::::::::::::::: get subject number, and set up screen
    getptb;
    screenparms = prepexp;
    if exist('subject','var') == 0; subject=getSubject(screenparms); end % If 'subject' doesn't exist, ask for it.
    subject = subject;


    %initial instructions
    InitInstruct=[iDir 'InitInstruct.jpg'];
    ima=imread(InitInstruct, 'jpg');
    dImageWait;
    
    %display MU instructions and run task
    MUInstruct1=[iDir 'MUInstruct1.jpg'];
    ima=imread(MUInstruct1, 'jpg');
    dImageWait;
    MUInstruct2=[iDir 'MUInstruct2.jpg'];
    ima=imread(MUInstruct2, 'jpg');
    dImageWait;
    if ~strcmp(SSversion, 'chinese')  %one more page for English
        MUInstruct3=[iDir 'MUInstruct3.jpg'];
        ima=imread(MUInstruct3, 'jpg');
        dImageWait;
    end
    cd 'MU'
    rc=MU(subject,screenparms);
    cd '..'
    if rc<0, return, end;

    %display OS instructions and run task
    cls(screenparms);
    OSInstruct1=[iDir 'OSInstruct1.jpg'];
    ima=imread(OSInstruct1, 'jpg');
    dImageWait;
    OSInstruct2=[iDir 'OSInstruct2.jpg'];
    ima=imread(OSInstruct2, 'jpg');
    dImageWait;
    cd 'OS'
    rc=OS(subject,screenparms,yesno);
    cd '..'
    if rc<0, return, end;

    %display SS instructions and run task
    switch (SSversion)
        case {'hard','chinese'}
            cls(screenparms);
            SSInstruct1=[iDir 'SSInstruct1.jpg'];
            ima=imread(SSInstruct1, 'jpg');
            dImageWait;
            SSInstruct2=[iDir 'SSInstruct2.jpg'];
            ima=imread(SSInstruct2, 'jpg');
            dImageWait;
        case 'easy'
            SSeasyInstruct1=[iDir 'SSeasyInstruct1.jpg'];
            ima=imread(SSeasyInstruct1, 'jpg');
            dImageWait;
            SSeasyInstruct2=[iDir 'SSeasyInstruct2.jpg'];
            ima=imread(SSeasyInstruct2, 'jpg');
            dImageWait;
    end
    cd 'SS'
    rc=SS(subject,screenparms,yesno,SSversion);
    cd '..'
    if rc<0, return, end;
% 
% 
%     %display SSTM instructions and run task
%     cls(screenparms);
%     SSTMInstruct1=[iDir 'SSTMInstruct1.jpg'];
%     ima=imread(SSTMInstruct1, 'jpg');
%     dImageWait;
%     SSTMInstruct2=[iDir 'SSTMInstruct2.jpg'];
%     ima=imread(SSTMInstruct2, 'jpg');
%     dImageWait;
%     cd 'SSTM'
%     rc=SSTM(subject,screenparms);
%     cd '..'
%     if rc<0, return, end;

    %::::::::::::::: normal program termination
    shutDown;


catch errNo
    if strfind(errNo.message,'PsychtoolboxVersion')
        disp('Psychtoolbox not installed. WMCBattery cannot be run');
        return;
    end

    if ptb3>-1, shutDown; end
    if strfind(errNo.message,'User terminated')
        disp(errNo.message);
        return;    %no need for error message if user pressed F12
    end
    if strfind(errNo.message,'does not exist')
        ME = MException('WMC:Installation', 'Faulty WMCBattery installation: Instructions not found');
        throw(ME)
    end
    if strfind(errNo.message,'Cannot CD')
        ME = MException('WMC:Installation', 'Faulty WMCBattery installation: Task folder not found');
        throw(ME)
    end

    rethrow(errNo); %having shut down properly, continue with MatLab error
end


%:::::::::::::: embedded auxiliary functions
    function shutDown
        if ptb3, ListenChar(0); end
        Screen('CloseAll');
        fclose('all');
        rmpath(fnDir);
        while KbCheck; end
        FlushEvents('keyDown');
    end

    function dImageWait
        if ptb3
            Screen('PutImage', screenparms.window, ima);
            Screen('Flip', screenparms.window);          
        else
            Screen(screenparms.window, 'PutImage', ima); % put image on screen
        end
        while KbCheck; end      %clear keyboard queue
        KbWait;                 %wait for any key
        cls(screenparms);
    end
end