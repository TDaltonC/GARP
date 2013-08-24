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

function GenerateDotSSTM
   %This program will generate a mat file containing the dot stimuli to be
   %used in SSTM program. The stimuli include 2 practice and 30 test items.
   %The dots of the 30 test items each are from 2 to 6. For each dot
   %number, there are 3 items for the near condition and 3 for the far
   %condition. The near condition means the inter-dot distance is not
   %larger than 2 and otherwise does the far condition.
   
   %Generate a dot pool of 100 = 10 x 10 dots on a 2-D space
   %Dots on margins are included
   %Y=repmat((1:10)',10,1);X=zeros(100,1);
   %for i=1:10;X((i-1)*10+1:i*10,1)=repmat(i,10,1);end
   %Dots on margins are not included
   Y=repmat((2:9)',8,1);X=zeros(64,1);
   for i=2:9;X((i-2)*8+1:(i-1)*8,1)=repmat(i,8,1);end
   DotsPosition=[Y X];
   %Declare a vector to store the iterations of dot generation in the far
   %condition
   ITs=zeros(15,1);
   %Set up the output stimulus matrix
   OutputSt=cell(32,4);
   %Set up the positions of the practice items
   OutputSt{1,1}=[2 5;6 8];OutputSt{2,1}=[4 4;1 2];
   OutputSt{1,2}=2;OutputSt{2,2}=2;OutputSt{1,3}=2;OutputSt{2,3}=2;
   OutputSt{1,4}=[0;0];OutputSt{2,4}=[0;0];
   
   %Set up the maximum distance between dots in the near condition
   spotsize=2;
   tempsamplesize=(spotsize*2+1)^2;
   
   count=3;%The first two stimuli are practice stimuli
   %Generate the stimuli of from 2 to 6 dots
   for n=2:6
      %Generate the stimuli in the far condition
      for NumSt=1:3
         %DotIndex=GetFarStimuli(DotsPosition,n);
         [ITs((n-2)*3+NumSt) DotIndex]=GetFarStimuli(DotsPosition,n);
         if ITs((n-2)*3+NumSt) >=1000
            fprintf('Cannot generate adequate dots within 1000 iterations./n');
            break;
         end
         OutputSt{count,1}=DotsPosition(DotIndex,:);
         OutputSt{count,2}=1;OutputSt{count,3}=n;
         OutputSt{count,4}=InterDotDist(DotsPosition(DotIndex,:));
         count=count+1;
      end
      %Generate the stimuli in the near condition
      for NumSt=1:3
         TempDots=GetNearDotsPool(DotsPosition,tempsamplesize,spotsize);
         stop=0;
         %Sample out the sutiable near items from the temporary pool
         tempsample=[ones(1,n) zeros(1,tempsamplesize-n)];
         while ~stop
            tempsample=tempsample(randperm(tempsamplesize));
            TempRespNearDots=TempDots(tempsample==1,:);
            %Compute the distance matrix between any two dots
            NearDotDist=ComputeDist(TempRespNearDots);
            %The inter-distance between any two stimuli must not be larger
            %than spotsize
            if max(max(NearDotDist))<=spotsize;stop=1;end
         end
         OutputSt{count,1}=TempRespNearDots;
         OutputSt{count,2}=0;OutputSt{count,3}=n;
         OutputSt{count,4}=InterDotDist(TempRespNearDots);
         count=count+1;
      end
   end
   if max(ITs)<1000
      OrinTrial=OutputSt;
      save('OrinTrial.mat','OrinTrial');
   else
      fprintf('Please re-run the program./n');
   end
end
function Resp=ComputeDist(TempDots)
   m=size(TempDots,1);%Count the items
   Resp=zeros(m,m);
   for j=1:m
      for i=1:m
         Resp(j,i)=Resp(j,i)+max(abs(TempDots(i,:)-TempDots(j,:)));
      end
   end
end
function TempDots=GetNearDotsPool(DotsPosition,tempsamplesize,spotsize)
   %Set up a vector containing one value of 1 and others of 0 for picking
   %up one dot from the 100-dots pool
   m=size(DotsPosition,1);
   sample=[ones(1,1) zeros(1,m-1)];
   %Set up a matrix for storing the items to be sampled out as stimuli
   TempDots=zeros(tempsamplesize,2);
   stop=0;
   %Generate the temporary pool for samping out the suitable stimuli
   while ~stop
      %Randomly sample n items from dot pool without replacement
      sample=sample(randperm(m));
      OrignDot=DotsPosition(sample==1,:);
      if max(OrignDot+spotsize+1)<=10 && min(OrignDot-spotsize-1)>=1
         stop=1;
      end
   end
   oy=OrignDot(1)-spotsize;
   ox=OrignDot(2)-spotsize;
   for j=1:spotsize*2+1
      for i=1:spotsize*2+1
         TempDots((j-1)*(spotsize*2+1)+i,:)=[oy+j-1 ox+i-1];
      end
   end
end
function [iterations DotIndex]=GetFarStimuli(DtPos,n)
   m=size(DtPos,1);
   a=1:m;
   sample=[ones(1,1) zeros(1,m-1)];
   DotIndex=zeros(1,n);
   for i=1:n
      if i>1
         stop1=0;iterations=0;
         while ~stop1 && iterations<1000
            %if iterations>=1000
            %   fprintf('Cannot generate suitable dots within 1000 iterations, rerun the program again/n');
            %   return;
            %end
            sample=sample(randperm(m));
            if sum(DotIndex(1:i-1)==a(sample==1))==0
               DotIndex(1,i)=a(sample==1);
               Dist=ComputeDist(DtPos(DotIndex(1:i),:));
               mindist=[];
               for j=1:i
                  for k=1:i
                     if Dist(j,k)~=0
                        mindist=[mindist Dist(j,k)];
                     end
                  end
               end
               if min(min(mindist))>2
                  stop1=1;
               else
                  DotIndex(1,i)=0;
               end
            end
            iterations=iterations+1;
         end
      else
         sample=sample(randperm(m));
         DotIndex(1,i)=a(sample==1);
      end
   end
end
function SeqDist=InterDotDist(D)
   m=size(D,1);
   yd1=D(:,1);xd1=D(:,2);
   yd2=yd1(2:m,1);xd2=xd1(2:m,1);
   SeqDist=[abs(yd1(1:m-1,1)-yd2) abs(xd1(1:m-1,1)-xd2)];
   SeqDist=[[0 0];SeqDist];SeqDist=max(SeqDist,[],2);
end