function [ strategy8, mystrategy8 ] = strategy8Matcher( set, choice )
% maximizing sum of items 1 and 3
%   Detailed explanation goes here

strategy8 = zeros(length(set),1);
for i = 1:length(set);
    if (set(1,1,i) + set(1,3,i)) > (set(2,1,i) + set(2,3,i));
        strategy8(i) = 1;
    elseif (set(1,1,i) + set(1,3,i)) < (set(2,1,i) + set(2,3,i));
        strategy8(i) = 2;
    elseif (set(1,1,i) + set(1,3,i)) == (set(2,1,i) + set(2,3,i));
        strategy8(i) = 0;
    end
end

mystrategy8 = zeros(length(set),1);
for i = 1:length(set);
    if strategy8(i) == 1 && choice(i,1) == 1;
        mystrategy8(i) = 0;
    elseif strategy8(i) == 1 && choice(i,1) == 2;
        mystrategy8(i) = 1;
    elseif strategy8(i) == 2 && choice(i,1) == 1;
        mystrategy8(i) = 1;
    elseif strategy8(i) == 2 && choice(i,1) == 2;
        mystrategy8(i) = 0;
    elseif strategy8(i) == 0 && choice(i,1) == 1;
        mystrategy8(i) = 0;
    elseif strategy8(i) == 0 && choice(i,1) == 2;
        mystrategy8(i) = 0;
    end
end

end

