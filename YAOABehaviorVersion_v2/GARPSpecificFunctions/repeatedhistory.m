% Usage: [seq , para] = repeatedhistory [(numconds, reps, lookback, nSeq, beginningpad)]
% the total number of trials generated for a sequence will be 
% n=(numconds^(lookback+1))*reps+lookback, if beginningpad is true,
% and n=(numconds^(lookback+1))*reps if beginningpad is false.
% if nSeq is provided, seq will be in size of (n, nSeq).
% para is a string containing first 4 inputs, number of trials.  
% This optional output, para, is usually used for record. 
% If there are not enough inputs, a dialog will appear.
% Author unknown, distributed by Bosco, cosmetic changes by Xiangrui

function [seq, para]=repeatedhistory(numconds,reps,lookback,nSeq,beginningpad)
if nargin<4, nSeq=1; end
if nargin<3
    persistent p;  % remember dialog parameters until clear functions
    if isempty(p), p={'4' '2' '2' '1'}'; end;
    prompt = {'Number of conditions:', 'Number of repeats:',...
              'Number to lookback:','How many sequences?'};
    p=inputdlg(prompt,'Repeated History',1,p);
    if isempty(p); return; end
    numconds = str2num(p{1});
    reps = str2num(p{2});
    lookback = str2num(p{3});
    nSeq = str2num(p{4});
end

numTrial=(numconds^(lookback+1))*reps+lookback;

for i=1:nSeq

%create array of all possible combinations of trials
%of the last lookback trials
blindAlley=1;
while blindAlley==1
  clear neworder orders zoot hold out
  
  blindAlley=0;
  for allegory=0:reps-1 %go thru once per rep.
	for loopMe=0:numconds^(lookback+1)-1;
	  for zoot=1:lookback+1
		orders((numconds^(lookback+1))*allegory+(loopMe+1),...
			(lookback+2)-zoot)=mod(floor(loopMe/numconds^(zoot-1)),numconds)+1;
	  end
	end
  end

  %okay.  Now, first lookback trials are free (no history)
  %and as such, any number is possible
  btn=numconds;
  for zoot=1:lookback
	%pick a random number, between 0 and 1
	drand=rand;
	%multiply that number by the current number of possibilities
	%round the result to an integer
	firstOut(zoot)=floor(drand*btn)+1;
  end
  %Now.  At this point, all numconds are still available
  
  %so.  Generate a random trial condition (from 1 to numcond)
  %check to see if history sequence (i.e., this trial plus
  %the last lookback trials) has already been used.
  %   If not available, generate a new number and re-check, etc.
  %   if it is available, then place the number at current location
  %in firstOut array.  IMPORTANT: update the orders array to reflect the
  %fact that this order/history sequence has been used!
    
  toGo=[1:numconds]';
  
  %go through once for each block of history sequences
  %multiple=(numtrials/(numconds^(lookback+1)));
  %for  mallory=1:multiple
  %go through once for each possible history sequence
  loopMe=1;
  diedOnce=0;
  while loopMe<=numconds^(lookback+1)*reps
	currentTrial=loopMe+lookback;
	notYet=1;
	failure=0;	
	while notYet==1
	  drand=rand;
	  hold=toGo(floor(drand*btn)+1);
	  
	  %now do history checking
	  %get indexes to all matches of current trial
	  %then get indexes from column3 that match previous trial's value
	  %then get indexes from column2 that match two trials ago value
	  
	  clear temp columnNext;
	  temp=find(orders(:,lookback+1)==hold);
	  columnNext=zeros(length(temp),lookback+1);
	  columnNext(:,1)=find(orders(:,lookback+1)==hold);
	  
	  for zoot=1:lookback
		counter=1;
		for skatman=1:length(orders)
		  if(find(columnNext(:,zoot)==skatman))
			if(orders(skatman,lookback+1-zoot)==firstOut(currentTrial-zoot))
			  columnNext(counter,zoot+1)=skatman;
			  counter=counter+1;
			end
		  end
		end
	  end
	  
	  %okay.  column1 should have between 1 and reps element(s) in it 
	  %(the index of this history sequence) or nothing.  
	  %  If nothing, then this sequence is not available,
	  %and we need to try again.
	  %  If there is a number there, set firstOut, and remove this
	  %sequence from the available list
	  if(columnNext(1,lookback+1)~=0) %found one
		notYet=0;
		currentTrial;
		%so that sequence can't be chosen again
		clear neworder lastorder;
		lastorder=orders;
		[harold junk]=size(orders);
		
		if(harold>1)
		  neworder(1:columnNext(1,lookback+1)-1,:)=orders(1:columnNext(1,lookback+1)-1,:);
		  neworder(columnNext(1,lookback+1):harold-1,:)=orders(columnNext(1,lookback+1)+1:harold,:);
		  clear orders;
		  orders=neworder;
		end
	  else
		failure=failure+1;
		%may not be possible to complete this sequence
		%so backtrack one trial, give it another shot
		if(failure==20) 
		  if(diedOnce==1)
			orders;
			blindAlley=1;
%			display('oops...blind allay.  Trying again.');
			loopMe=numconds^(lookback+1)*reps+1 ;
			notYet=0;
		  end
		  failure=0;
		  diedOnce=diedOnce+1;
		  loopMe=loopMe-1;
		  currentTrial=loopMe+lookback;
		  %replace last sequence
		  clear orders;
		  orders=lastorder;
		  toGo=members(orders(:,lookback+1));
		  btn=length(toGo);
		end
	  end
	  
	end %end the notYet while loop...have found a good trial.
	
	firstOut(currentTrial)=hold;
	loopMe=loopMe+1;
	currentTrial=loopMe+lookback;
	toGo=members(orders(:,lookback+1));
	btn=length(toGo);
	%update available numbers:
  end
end
seq(:,i)=firstOut';
end

if nargin<5 | beginningpad
    para=sprintf('[%g %g %g %g %g]',numconds,reps,lookback,nSeq,numTrial);
else
    para=sprintf('[%g %g %g %g %g]',numconds,reps,lookback,nSeq,numTrial-lookback);
    seq(1:lookback,:)=[]; 
end

%%%%%%
function nn = members(dat)
nn=sort(dat);
l = length(nn);
i = 1;
while i<l
  s=nn(i);
  f = find(nn(:) == s);
  f(find(f(:) == i)) = [];
  nn(f) = [];
  i=i+1;
  l=length(nn);
end