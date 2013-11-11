function [ strategy2, mystrategy2 ] = strategy2Matcher( set, choice )
% max item 1 
%   Detailed explanation goes here

strategy2 = zeros(length(set),1);

for i = 1:length(set);
    if set(1,1,i) > set(2,1,i);
        strategy2(i) = 1;
    elseif set(1,1,i) < set(2,1,i);
        strategy2(i) = 2;
    elseif set(1,1,i) == set(2,1,i);
        strategy2(i) = 0;
    end
end

mystrategy2 = zeros(length(set),1);
for i = 1:length(set);
    if strategy2(i) == 1 && choice(i,1) == 1;
        mystrategy2(i) = 0;
    elseif strategy2(i) == 1 && choice(i,1) == 2;
        mystrategy2(i) = 1;
    elseif strategy2(i) == 2 && choice(i,1) == 1;
        mystrategy2(i) = 1;
    elseif strategy2(i) == 2 && choice(i,1) == 2;
        mystrategy2(i) = 0;
    elseif strategy2(i) == 0 && choice(i,1) == 1;
        mystrategy2(i) = 0;
    elseif strategy2(i) == 0 && choice(i,1) == 2;
        mystrategy2(i) = 0;
    end
end


end

