function [ strategy5, mystrategy5 ] = strategy5Matcher( set, choice )
% equalizing strategy
%   Detailed explanation goes here

strategy5 = zeros(length(set),1);

if (sum(size(set) == [2,2,35]) == 3); % is the set == preProcessed.twoItemGARP.tasks
    for i = 1:length(set);
        if abs(set(1,1,i) - set(1,2,i)) > abs(set(2,1,i) - set(2,2,i));
            strategy5(i) = 2;
        elseif abs(set(1,1,i) - set(1,2,i)) < abs(set(2,1,i) - set(2,2,i));
            strategy5(i) = 1;
        elseif abs(set(1,1,i) - set(1,2,i)) == abs(set(2,1,i) - set(2,2,i));
            strategy5(i) = 0;
        end
    end
elseif (sum(size(set) == [2,2,35]) == 2) % if one of the three item GARP tasks
    if (set(1,3,1) == 0) && (set(2,2,1) == 0); % is the set == preProcessed.threeItemGARP3435.revtasks
        for i = 1:length(set);
            if abs(set(1,1,i) - set(1,2,i)) > abs(set(2,1,i) - set(2,3,i));
                strategy5(i) = 2;
            elseif abs(set(1,1,i) - set(1,2,i)) < abs(set(2,1,i) - set(2,3,i));
                strategy5(i) = 1;
            elseif abs(set(1,1,i) - set(1,2,i)) == abs(set(2,1,i) - set(2,3,i));
                strategy5(i) = 0;
            end
        end
    elseif (set(1,3,1) == 0) && (set(2,1,1) == 0); % is the set == preProcessed.threeItemGARP3445.revtasks
        for i = 1:length(set);
            if abs(set(1,1,i) - set(1,2,i)) > abs(set(2,2,i) - set(2,3,i));
                strategy5(i) = 2;
            elseif abs(set(1,1,i) - set(1,2,i)) < abs(set(2,2,i) - set(2,3,i));
                strategy5(i) = 1;
            elseif abs(set(1,1,i) - set(1,2,i)) == abs(set(2,2,i) - set(2,3,i));
                strategy5(i) = 0;
            end
        end
    elseif (set(1,2,1) == 0) && (set(2,1,1) == 0); % is the set == preProcessed.threeItemGARP3545.revtasks
        for i = 1:length(set);
            if abs(set(1,1,i) - set(1,3,i)) > abs(set(2,2,i) - set(2,3,i));
                strategy5(i) = 2;
            elseif abs(set(1,1,i) - set(1,3,i)) < abs(set(2,2,i) - set(2,3,i));
                strategy5(i) = 1;
            elseif abs(set(1,1,i) - set(1,3,i)) == abs(set(2,2,i) - set(2,3,i));
                strategy5(i) = 0;
            end
        end
    end
end

% for all GARP tasks  
mystrategy5 = zeros(length(set),1);
for i = 1:length(set);
    if strategy5(i) == 1 && choice(i,1) == 1;
        mystrategy5(i) = 0;
    elseif strategy5(i) == 1 && choice(i,1) == 2;
        mystrategy5(i) = 1;
    elseif strategy5(i) == 2 && choice(i,1) == 1;
        mystrategy5(i) = 1;
    elseif strategy5(i) == 2 && choice(i,1) == 2;
        mystrategy5(i) = 0;
    elseif strategy5(i) == 0 && choice(i,1) == 1;
        mystrategy5(i) = 0;
    elseif strategy5(i) == 0 && choice(i,1) == 2;
        mystrategy5(i) = 0;
    end
end

end

