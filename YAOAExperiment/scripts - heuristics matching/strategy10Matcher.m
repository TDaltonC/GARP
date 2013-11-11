function [ strategy10, mystrategy10 ] = strategy10Matcher( set, choice )
% max-min strategy
%   Detailed explanation goes here

strategy10 = zeros(length(set),1);
if (sum(size(set) == [2,2,35]) == 3); % for twoItemGARP
    for i = 1:length(set);
        if (set(1,1,i) + set(2,1,i) < set(1,2,i) + set(2,2,i)) && ... % item 1 is the "rare" or minimum item
                (set(1,1,i) > set(2,1,i)); % more of the rare item (1) in the left bundle (1)
            strategy10(i) = 1;
        elseif (set(1,1,i) + set(2,1,i) < set(1,2,i) + set(2,2,i)) && ... % item 1 is the "rare" or minimum item
                (set(1,1,i) < set(2,1,i)); % more of the rare item (1) in the right bundle (2)
            strategy10(i) = 2;
        elseif (set(1,1,i) + set(2,1,i) > set(1,2,i) + set(2,2,i)) && ... % item 2 is the "rare" or minimum item
                (set(1,2,i) > set(2,2,i)); % more of the rare item (2) in the left bundle (1)
            strategy10(i) = 1;
        elseif (set(1,1,i) + set(2,1,i) > set(1,2,i) + set(2,2,i)) && ... % item 2 is the "rare" or minimum item
                (set(1,2,i) < set(2,2,i)); % more of the rare item (2) in the right bundle (2)
            strategy10(i) = 2;
        elseif (set(1,1,i) + set(2,1,i) == set(1,2,i) + set(2,2,i)) % there is no "rare" or minimum item
            strategy10(i) = 0; % either choice would be in compliance with satisfying this strategy
        end
    end
elseif (sum(size(set) == [2,2,35]) == 2) % for all types of threeItemGARP
    for i = 1:length(set);
        if (set(1,1,i) + set(2,1,i) < set(1,2,i) + set(2,2,i)) && ...
                (set(1,1,i) + set(2,1,i) < set(1,3,i) + set(2,3,i)) && ... % item 1 is the "rare" or minimum item
                (set(1,1,i) > set(2,1,i)); % more of the rare item (1) in the left bundle (1)
            strategy10(i) = 1; % if complying by this strategy then, will choose left bundle (1)
        elseif (set(1,1,i) + set(2,1,i) < set(1,2,i) + set(2,2,i)) && ...
                (set(1,1,i) + set(2,1,i) < set(1,3,i) + set(2,3,i)) && ... % item 1 is the "rare" or minimum item
                (set(1,1,i) < set(2,1,i)); % more of the rare item (1) in the right bundle (2)
            strategy10(i) = 2; % if complying by this strategy then, will choose right bundle (2)
        elseif (set(1,2,i) + set(2,2,i) < set(1,1,i) + set(2,1,i)) && ...
                (set(1,2,i) + set(2,2,i) < set(1,3,i) + set(2,3,i)) && ... % item 2 is the "rare" or minimum item
                (set(1,2,i) > set(2,2,i)); % more of the rare item (2) in the left bundle (1)
            strategy10(i) = 1; % if complying by this strategy then, will choose left bundle (1)
        elseif (set(1,2,i) + set(2,2,i) < set(1,1,i) + set(2,1,i)) && ...
                (set(1,2,i) + set(2,2,i) < set(1,3,i) + set(2,3,i)) && ... % item 2 is the "rare" or minimum item
                (set(1,2,i) < set(2,2,i)); % more of the rare item (2) in the right bundle (2)
            strategy10(i) = 2; % if complying by this strategy then, will choose right bundle (2)
        elseif (set(1,3,i) + set(2,3,i) < set(1,1,i) + set(2,1,i)) && ...
                (set(1,3,i) + set(2,3,i) < set(1,2,i) + set(2,2,i)) && ... % item 3 is the "rare" or minimum item
                (set(1,3,i) > set(2,3,i)); % more of the rare item (3) in the left bundle (1)
            strategy10(i) = 1; % if complying by this strategy then, will choose left bundle (1)
        elseif (set(1,3,i) + set(2,3,i) < set(1,1,i) + set(2,1,i)) && ...
                (set(1,3,i) + set(2,3,i) < set(1,2,i) + set(2,2,i)) && ... % item 3 is the "rare" or minimum item
                (set(1,3,i) < set(2,3,i)); % more of the rare item (3) in the right bundle (2)
            strategy10(i) = 2; % if complying by this strategy then, will choose right bundle (2)
        elseif (set(1,1,i) + set(2,1,i) == set(1,2,i) + set(2,2,i)) && ...
                (set(1,1,i) + set(2,1,i) == set(1,3,i) + set(2,3,i)) % all items are equal
            strategy10(i) = 0; % either response will be in compliance by this strategy
        elseif ((set(1,1,i) + set(2,1,i)) == (set(1,2,i) + set(2,2,i))) % items 1 and 2 are equally (un)rare
            if (set(1,1,i) + set(2,1,i)) > ((set(1,3,i) + set(2,3,i))) % item 3 is the "rare" item
                if (set(1,3,i) > set(2,3,i)); % more of the rare item (3) in the left bundle (1)
                    strategy10(i) = 1;
                elseif (set(1,3,i) < set(2,3,i)); % more of the rare item (3) in the right bundle (2)
                    strategy10(i) = 2;
                end
            elseif (set(1,1,i) + set(2,1,i)) < ((set(1,3,i) + set(2,3,i))) % items 1 and 2 are the "rare" items
                if (set(1,1,i) == set(2,1,i)) && (set(1,2,i) > set(2,2,i)) % item 2 is ACTUAL "rare" item & more of it in left bundle (1)
                    strategy10(i) = 1;
                elseif (set(1,1,i) == set(2,1,i)) && (set(1,2,i) < set(2,2,i)) % item 2 is ACTUAL "rare" item & more of it in right bundle (2)
                    strategy10(i) = 2;
                elseif (set(1,2,i) == set(2,2,i)) && (set(1,1,i) > set(2,1,i)) % item 1 is ACTUAL "rare" item & more of it in left bundle (1)
                    strategy10(i) = 1;
                elseif (set(1,2,i) == set(2,2,i)) && (set(1,1,i) < set(2,1,i)) % item 1 is ACTUAL "rare" item & more of it in right bundle (2)
                    strategy10(i) = 2;
                elseif (set(1,1,i) == set(2,1,i)) && (set(1,2,i) == set(2,2,i)) % items 1 and 2 are ACTUALLY equally "rare"
                    strategy10(i) = 0;
                end
            end
        elseif (set(1,1,i) + set(2,1,i)) == (set(1,3,i) + set(2,3,i))% items 1 and 3 are equally (un)rare
            if (set(1,1,i) + set(2,1,i)) > (set(1,2,i) + set(2,2,i)) % item 2 is the "rare" item
                if (set(1,2,i) > set(2,2,i)); % more of the rare item (2) in the left bundle (1)
                    strategy10(i) = 1;
                elseif (set(1,2,i) < set(2,2,i)); % more of the rare item (2) in the right bundle (2)
                    strategy10(i) = 2;
                end
            elseif (set(1,1,i) + set(2,1,i)) < ((set(1,2,i) + set(2,2,i))) % items 1 and 3 are the "rare" items
                if (set(1,1,i) == set(2,1,i)) && (set(1,3,i) > set(2,3,i)) % item 3 is ACTUAL "rare" item & more of it in left bundle (1)
                    strategy10(i) = 1;
                elseif (set(1,1,i) == set(2,1,i)) && (set(1,3,i) < set(2,3,i)) % item 3 is ACTUAL "rare" item & more of it in right bundle (2)
                    strategy10(i) = 2;
                elseif (set(1,3,i) == set(2,3,i)) && (set(1,1,i) > set(2,1,i)) % item 1 is ACTUAL "rare" item & more of it in left bundle (1)
                    strategy10(i) = 1;
                elseif (set(1,3,i) == set(2,3,i)) && (set(1,1,i) < set(2,1,i)) % item 1 is ACTUAL "rare" item & more of it in right bundle (2)
                    strategy10(i) = 2;
                elseif (set(1,1,i) == set(2,1,i)) && (set(1,3,i) == set(2,3,i)) % items 1 and 3 are ACTUALLY equally "rare"
                    strategy10(i) = 0;
                end
            end
        elseif (set(1,2,i) + set(2,2,i)) == (set(1,3,i) + set(2,3,i)) % items 2 and 3 are equally (un)rare
            if (set(1,2,i) + set(2,2,i)) > (set(1,1,i) + set(2,1,i)) % item 1 is the "rare" item
                if (set(1,1,i) > set(2,1,i)); % more of the rare item (1) in the left bundle (1)
                    strategy10(i) = 1;
                elseif (set(1,1,i) < set(2,1,i)); % more of the rare item (1) in the right bundle (2)
                    strategy10(i) = 2;
                end
            elseif (set(1,2,i) + set(2,2,i)) < (set(1,1,i) + set(2,1,i)) % items 2 and 3 are the "rare" items
                if (set(1,2,i) == set(2,2,i)) && (set(1,3,i) > set(2,3,i)) % item 3 is ACTUAL "rare" item & more of it in left bundle (1)
                    strategy10(i) = 1;
                elseif (set(1,2,i) == set(2,2,i)) && (set(1,3,i) < set(2,3,i)) % item 3 is ACTUAL "rare" item & more of it in right bundle (2)
                    strategy10(i) = 2;
                elseif (set(1,3,i) == set(2,3,i)) && (set(1,2,i) > set(2,2,i)) % item 2 is ACTUAL "rare" item & more of it in left bundle (1)
                    strategy10(i) = 1;
                elseif (set(1,3,i) == set(2,3,i)) && (set(1,2,i) < set(2,2,i)) % item 2 is ACTUAL "rare" item & more of it in right bundle (2)
                    strategy10(i) = 2;
                elseif (set(1,2,i) == set(2,2,i)) && (set(1,3,i) == set(2,3,i)) % items 2 and 3 are ACTUALLY equally "rare"
                    strategy10(i) = 0;
                end
            end
        end
    end
end

mystrategy10 = zeros(length(set),1);
for i = 1:length(set);
    if strategy10(i) == 1 && choice(i,1) == 1;
        mystrategy10(i) = 0;
    elseif strategy10(i) == 1 && choice(i,1) == 2;
        mystrategy10(i) = 1;
    elseif strategy10(i) == 2 && choice(i,1) == 1;
        mystrategy10(i) = 1;
    elseif strategy10(i) == 2 && choice(i,1) == 2;
        mystrategy10(i) = 0;
    elseif strategy10(i) == 0 && choice(i,1) == 1;
        mystrategy10(i) = 0;
    elseif strategy10(i) == 0 && choice(i,1) == 2;
        mystrategy10(i) = 0;
    end
end


end

