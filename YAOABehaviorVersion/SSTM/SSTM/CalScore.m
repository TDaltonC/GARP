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

function [Score ShiftAns]=CalScore(RecExp,RecTrial,NumT,NumIndex)
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% This is the subfunction of SSTM used to calculate the score of each trial
% and output how the function calculates the score by ShiftAns
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

for i=1+NumT.Pract:NumT.Total
    Conbime=1;
    Perm=perms(1:NumIndex(1,i)-1)+1;
    for j=1:NumIndex(1,i)
        if j~=1
            TempRecTrial=RecTrial{i,1};
            TempRecTrial(1,:)=RecTrial{i,1}(j,:);
            TempRecTrial(j,:)=RecTrial{i,1}(1,:);
        else TempRecTrial=RecTrial{i,1};
        end;
        for k=1:NumIndex(1,i)
            if k~=1
                TempExp{Conbime,1}=RecExp{i,1};
                TempExp{Conbime,1}(1,:)=RecExp{i,1}(k,:);
                TempExp{Conbime,1}(k,:)=RecExp{i,1}(1,:);
            else TempExp{Conbime,1}=RecExp{i,1};
            end;
            TempExp{Conbime,2}=TempRecTrial;
            Shift=TempExp{Conbime,2}(1,:)-TempExp{Conbime,1}(1,:);
            TempExp{Conbime,3}=Shift;
            TempExp{Conbime,4}=TempExp{Conbime,1};
            for q=1:2
                TempExp{Conbime,1}(:,q)=TempExp{Conbime,1}(:,q)+Shift(1,q);
            end;
            Conbime=Conbime+1;
        end;
    end;
    AllComb=size(TempExp);
    AllPerm=size(Perm);
    for p=1:AllComb(1,1)
        for j=1:AllPerm(1,1)
            for k=2:max(Perm(j,:))
                TempDis=max(abs(TempExp{p,2}(k,:)-TempExp{p,1}(Perm(j,k-1),:)));
                TempDis2(k,:)=TempDis;
                CheckDistance{p,j}=TempDis2;
                TempScoreTwo=sum((TempDis2==0)*2);
                TempScoreOne=sum((TempDis2==1)*1);
                Distance(p,j)=TempScoreOne+TempScoreTwo;
                [TrialScore Method]=max(max(Distance'));
                [Trash Method2]=max(Distance(Method,:));
                 
            end;
        end;
    end;
    Score(i,1)=TrialScore;
    ShiftAns{i,1}(1,:)=TempExp{Method,1}(1,:);
    for e=2:max(Perm(Method2,:))
        ShiftAns{i,1}(e,:)=TempExp{Method,1}(Perm(Method2,e-1),:);
    end;
    ShiftAns{i,3}(1,:)=TempExp{Method,4}(1,:);
    for e=2:max(Perm(Method2,:))
        ShiftAns{i,3}(e,:)=TempExp{Method,4}(Perm(Method2,e-1),:);
    end;
    ShiftAns{i,2}=TempExp{Method,2};
    clear Distance TempDis TempExp TempDis2 Perm CheckDistance TempScoreTwo TempScoreOne TrialScore Method Trash Method2;
end;
            
    
