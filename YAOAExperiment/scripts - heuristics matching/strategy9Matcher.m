function [ strategy9, mystrategy9 ] = strategy9Matcher( set, choice )
% maximizing sum of items 2 and 3
%   Detailed explanation goes here

strategy9 = zeros(length(set),1);
for i = 1:length(set);
    if (set(1,2,i) + set(1,3,i)) > (set(2,2,i) + set(2,3,i));
        strategy9(i) = 1;
    elseif (set(1,2,i) + set(1,3,i)) < (set(2,2,i) + set(2,3,i));
        strategy9(i) = 2;
    elseif (set(1,2,i) + set(1,3,i)) == (set(2,2,i) + set(2,3,i));
        strategy9(i) = 0;
    end
end

mystrategy9 = zeros(length(set),1);
for i = 1:length(set);
    if strategy9(i) == 1 && choice(i,1) == 1;
        mystrategy9(i) = 0;
    elseif strategy9(i) == 1 && choice(i,1) == 2;
        mystrategy9(i) = 1;
    elseif strategy9(i) == 2 && choice(i,1) == 1;
        mystrategy9(i) = 1;
    elseif strategy9(i) == 2 && choice(i,1) == 2;
        mystrategy9(i) = 0;
    elseif strategy9(i) == 0 && choice(i,1) == 1;
        mystrategy9(i) = 0;
    elseif strategy9(i) == 0 && choice(i,1) == 2;
        mystrategy9(i) = 0;
    end
end
end

