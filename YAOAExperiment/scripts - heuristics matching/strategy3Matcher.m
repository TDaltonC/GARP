function [ strategy3, mystrategy3 ] = strategy3Matcher( set, choice )
% max item 2
%   Detailed explanation goes here

strategy3 = zeros(length(set),1);

for i = 1:length(set);
    if set(1,2,i) > set(2,2,i);
        strategy3(i) = 1;
    elseif set(1,2,i) < set(2,2,i);
        strategy3(i) = 2;
    elseif set(1,2,i) == set(2,2,i);
        strategy3(i) = 0;
    end
end

mystrategy3 = zeros(length(set),1);
for i = 1:length(set);
    if strategy3(i) == 1 && choice(i,1) == 1;
        mystrategy3(i) = 0;
    elseif strategy3(i) == 1 && choice(i,1) == 2;
        mystrategy3(i) = 1;
    elseif strategy3(i) == 2 && choice(i,1) == 1;
        mystrategy3(i) = 1;
    elseif strategy3(i) == 2 && choice(i,1) == 2;
        mystrategy3(i) = 0;
    elseif strategy3(i) == 0 && choice(i,1) == 1;
        mystrategy3(i) = 0;
    elseif strategy3(i) == 0 && choice(i,1) == 2;
        mystrategy3(i) = 0;
    end
end

end

