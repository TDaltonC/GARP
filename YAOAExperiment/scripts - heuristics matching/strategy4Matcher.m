function [ strategy4, mystrategy4 ] = strategy4Matcher( set, choice )
% minimizing absolutely
%   Detailed explanation goes here
strategy4 = zeros(length(set),1);

for i = 1:length(set);
    if size(set) == [2,2,35];
        if (set(1,1,i) + set(1,2,i)) > (set(2,1,i) + set(2,2,i));
            strategy4(i) = 2;
        elseif (set(1,1,i) + set(1,2,i)) < (set(2,1,i) + set(2,2,i));
            strategy4(i) = 1;
        elseif (set(1,1,i) + set(1,2,i)) == (set(2,1,i) + set(2,2,i));
            strategy4(i) = 0;
        end
    else
        if (set(1,1,i) + set(1,2,i) + set(1,3,i)) > (set(2,1,i) + set(2,2,i) + set(2,3,i));
            strategy4(i) = 2;
        elseif (set(1,1,i) + set(1,2,i) + set(1,3,i)) < (set(2,1,i) + set(2,2,i) + set(2,3,i));
            strategy4(i) = 1;
        elseif (set(1,1,i) + set(1,2,i) + set(1,3,i)) == (set(2,1,i) + set(2,2,i) + set(2,3,i));
            strategy4(i) = 0; %0 means that either response (1 or 2) will be in compliance with the strategy
        end
    end


mystrategy4 = zeros(length(set),1);
for i = 1:length(set);
    if strategy4(i) == 1 && choice(i,1) == 1;
        mystrategy4(i) = 0;
    elseif strategy4(i) == 1 && choice(i,1) == 2;
        mystrategy4(i) = 1;
    elseif strategy4(i) == 2 && choice(i,1) == 1;
        mystrategy4(i) = 1;
    elseif strategy4(i) == 2 && choice(i,1) == 2;
        mystrategy4(i) = 0;
    elseif strategy4(i) == 0 && choice(i,1) == 1;
        mystrategy4(i) = 0;
    elseif strategy4(i) == 0 && choice(i,1) == 2;
        mystrategy4(i) = 0;
    end
end


end

