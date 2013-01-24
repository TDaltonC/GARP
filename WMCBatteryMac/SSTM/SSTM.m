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

function rc=SSTM(subject,screenparms)
% XXXXXXXXXXXXXXXXXXXXXXXXXXXX HELP XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% This is the main function "SSTM" that used to perform the Spatial Short-Term
% Memory Task
% Each subject's data will be recorded in a specific file (Sub-xx.txt) in
% the folder '..\Data\SSTMDetailed' and all subjects' data will be recorded in
% SSTM.dat which will be saved with other summary files from the other 3
% tasks.
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
global ptb3

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

   
    if nargin < 2
        screenparms = prepexp;
        subject=getSubject(screenparms);
    end

    % Get the cpu time
    date=clock;
    IntDate=[int2str(date(1,1)) '/' int2str(date(1,2)) '/' int2str(date(1,3))...
        ' ' int2str(date(1,4)) ':' int2str(date(1,5))];


    % XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    %  Time control events
    % XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    Time.Dot=.9;        % Dots displayed length
    Time.PostDot=.1;    % Interval between dots
    Time.Result=1;      % Length for "Draw the Dots"
    Time.Alert=1;       % Length for "Alert!!"
    Time.PostTrial=0;   % Interval from the last dot disapear to "Draw the dots" shows
    Time.PostAlert=.5;  % Interval from "Alert!!" disapear to first dot displayed

    % XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    %  Stimuli control events
    % XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    NumT.Pract=2;       % Number of practice trial (Must be 2)
    NumT.Test=30;       % Number of test trial (Must bigger than 1)
    NumT.Total=NumT.Test+NumT.Pract;
    Dot.Gap=4;          % the margin gap of each cell
    Dot.Size=50-2*Dot.Gap;

    % XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    % CheckBoard; the margin of the 10 x 10 matrix (under 800*600 resolution)
    % XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    Board.Left=151;
    Board.Right=651;
    Board.Top=51;
    Board.Bottom=551;
    Board.Cell=50;

    w=screenparms.window;
    Rect=screenparms.rect;
    HideCursor;
    black=screenparms.black;
    white=screenparms.white;

    % XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    % Set the guide text content and color
    % XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    Text.Fix='+';
    Text.Draw='Please Draw the Dots';
    Text.Next='Next';
    practicemsg = 'Press Space Bar to Begin Practice';
    beginmsg =    'Press Space Bar to Begin Task';
    expovermsg =  'Experiment over: Call Experimenter';
    Text.Color1=black;
    Text.Color2=white;
    
    if ptb3
        expinfo.stimulussize = 50;
        expinfo.msgsize = 25;
        Text.Size1=24;
        Text.Size2=36;
        Text.Size3=75;
    else
        expinfo.stimulussize = (screenparms.rect(RectBottom) - screenparms.rect(RectTop))/8;
        expinfo.msgsize = 40;
        Text.Size1=36;
        Text.Size2=48;
        Text.Size3=100;
    end
    expinfo.textrow = 20;
    expinfo.leftofcenter = 0;

    % Adjust the resolution of the screen to fit different resolution
    AdjH=Rect(1,3)/800;
    AdjV=Rect(1,4)/600;
    %Need to do widescreen check
    if (AdjH/AdjV)>=(4/3) %If it is a widescreen, tune X dimension in the same
        AdjH=AdjV;%ratio as for tuning the Y dimension
    end

    if ptb3
        Screen('TextSize', w, expinfo.stimulussize);
        Screen('TextFont', w,  screenparms.sansSerifFont);
    else
        SCREEN(w,'TextFont',screenparms.sansSerifFont);
        SCREEN(w,'TextSize',expinfo.stimulussize);
    end

    % Input Subject's ID and create subject's own data folder
    SubID=subject;
    if SubID <= 9
        FileID=['0' int2str(SubID)];
    else
        FileID=int2str(SubID);
    end;
    cls(screenparms);

    % Randomize the original location data. Get the sequence index of the random
    % order and the randomed correct answer data.
    [Order RecTrial]=RandLoc2(subject);

    for i=1:NumT.Total
        NumIndex(1,i)=RecTrial{i,3};
    end;

    % Start the task
    ShowTest=0;
    waitfkey (screenparms, expinfo, practicemsg);
    for Trial=1:NumT.Total
        if Trial >= NumT.Pract+1 && ShowTest==0
            waitfkey (screenparms, expinfo, beginmsg);
            ShowTest=1;
        end;
        %     Display the test items by function "DisPlayDot"
        DisPlayDot(screenparms,Text,Time,Trial,NumIndex,AdjH,AdjV,RecTrial,Dot,Board,w);
        %     Receive the response by function "Response"
        [RecAns,RT]=Response(screenparms,Trial,NumIndex,Dot,Text,Board,AdjH,AdjV,w);
        RecExp{Trial,1}=RecAns;
        RecRT(Trial,1)=RT;
        cls(screenparms);
        if Trial >= NumT.Pract+1
            %waitfkey(screenparms, expinfo,['This was Trial # ' int2str(Trial-NumT.Pract) ' out of ' int2str(NumT.Test)])
            waitfkey(screenparms, expinfo, ['Press Space to Continue'])
        end;
    end;

    waitfkey (screenparms, expinfo, expovermsg,1);
    % Calculate the score by the function "CalScore"
    [Score ShiftAns]=CalScore(RecExp,RecTrial,NumT,NumIndex);

    % Store the data to SubDotFile
    %RecTask1(SubID,IntDate,NumT,Score);
    RecTask(SubID,FileID,IntDate,NumT,RecExp,RecTrial,ShiftAns,Score,Order,RecRT,NumIndex);

    waitfkey (screenparms, expinfo, 'Data Recorded-Press Space Bar to Exit');
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

