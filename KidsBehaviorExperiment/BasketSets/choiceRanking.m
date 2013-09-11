% this script computes the ranked order of the kids behavior experiment it
% should print a list of all of the items used in this task in order from
% most prefered to least.
chosenItemCount = zeros(21,1);
for i = 1:length(behavior.keys);
    if behavioral.key(i,1) == 'f';
        if flipLR(i) == 0;
            chosenItem = trials(trialOrder(i),1);
        elseif flipLR(i) == 1;
            chosenItem = trials(trialOrder(i),2);
        end
    elseif behavioral.key(i,1) == 'j';
        if flipLR(i) == 0;
            chosenItem = trials(trialOrder(i),2);
        elseif flipLR(i) == 1;
            chosenItem = trials(trialOrder(i),1);
        end 
    end
    chosenItemCount(chosenItem) = chosenItemCount(chosenItem) + 1;
end

for i = 1:10;
    ranking(i)= 