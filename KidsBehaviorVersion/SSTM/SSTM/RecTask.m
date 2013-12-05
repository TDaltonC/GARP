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

function RecTask(SubID,FileID,IntDate,NumT,RecExp,RecTrial,ShiftAns,Score,Order,RecRT,NumIndex)
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
%  This is the subfunction of SSTM used to record the task data.
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

Rec{1,1}='Trial';Rec{1,2}='Response';Rec{1,3}='Answer';Rec{1,4}='Transfer(Resp)';
Rec{1,5}='Score';Rec{1,6}='Condition';Rec{1,7}='NumDot';Rec{1,8}='Ans#(pic)';
Rec{1,9}='RT';

DataFile=fopen(['../Data/SSTMDetailed/Sub-' FileID '.txt'],'at');

if exist('../Data/SSTM.dat','file')==0
    SumDataFile=fopen('../Data/SSTM.dat','at');
    fprintf(SumDataFile,'%s %s %s %s %d/n','SubID','Score','Date','Time',(NumT.Test/5)*40);
else
    SumDataFile=fopen('../Data/SSTM.dat','at');
end;

for Index=1:NumT.Test
    Rec{Index+1,1}=Index;
    Rec{Index+1,2}=RecExp{Index+NumT.Pract,1};
    Rec{Index+1,3}=ShiftAns{Index+NumT.Pract,2};
    Rec{Index+1,4}=ShiftAns{Index+NumT.Pract,1};
    Rec{Index+1,5}=Score(Index+NumT.Pract,1);
    if RecTrial{Index+NumT.Pract,2}==0
        Rec{Index+1,6}='Near';
    else Rec{Index+1,6}='Far';
    end;
    Rec{Index+1,7}=RecTrial{Index+NumT.Pract,3};
    Rec{Index+1,8}=Order(Index,1);
    Rec{Index+1,9}=RecRT(Index+NumT.Pract,1);
end;

fprintf(DataFile,'%s %s/n',IntDate,'Spatial Short-Trem Memory Task data');
fprintf(DataFile,'%s %s %s %s %s/n','ID','Trial'...
    ,'Score','RT','NumDot');
for i=1:NumT.Test
    fprintf(DataFile,'%3d %2d %2d %5.3f %d/n',SubID,i,...
        Score(i+NumT.Pract,1),RecRT(i+NumT.Pract,1),NumIndex(1,i+2));
    
end;

fprintf(DataFile,'/n%s/n/n','------------------------------------------')

fprintf(DataFile,'%s %s %s %s %s %s','Dot','Res','Trasf-Res'...
    ,'Ans','Score','InTrial#');

for i=1:NumT.Test
    for j=1:NumIndex(1,i+2)
        if max(abs(ShiftAns{i+NumT.Pract,1}(j,:)-ShiftAns{i+NumT.Pract,2}(j,:)))==0
            DotScore=2;
        elseif  max(abs(ShiftAns{i+NumT.Pract,1}(j,:)-ShiftAns{i+NumT.Pract,2}(j,:)))==1
            DotScore=1;
        else DotScore=0;
        end;
        fprintf(DataFile,'/n%d   %2d %2d   %2d %2d   %2d %2d   %d %d',j,...
            ShiftAns{i+NumT.Pract,3}(j,1),ShiftAns{i+NumT.Pract,3}(j,2)...
            ,ShiftAns{i+NumT.Pract,1}(j,1),ShiftAns{i+NumT.Pract,1}(j,2)...
            ,ShiftAns{i+NumT.Pract,2}(j,1),ShiftAns{i+NumT.Pract,2}(j,2)...
            ,DotScore,i);
    end;
end;

fprintf(SumDataFile,'%2d %2d %s/n',SubID,sum(Score),IntDate);

fclose('all');