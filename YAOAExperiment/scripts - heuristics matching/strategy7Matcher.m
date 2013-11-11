function [ strategy7, mystrategy7 ] = strategy7Matcher( set, choice )
% maximizing sum of items 1 and 2
%   Detailed explanation goes here

strategy7 = zeros(length(set),1);
for i = 1:length(set);
    if (set(1,1,i) + set(1,2,i)) > (set(2,1,i) + set(2,2,i));
        strategy7(i) = 1;
    elseif (set(1,1,i) + set(1,2,i)) < (set(2,1,i) + set(2,2,i));
        strategy7(i) = 2;
    elseif (set(1,1,i) + set(1,2,i)) == (set(2,1,i) + set(2,2,i));
        strategy7(i) = 0;
    end
end

mystrategy7 = zeros(length(set),1);
for i = 1:length(set);
    if strategy7(i) == 1 && choice(i,1) == 1;
        mystrategy7(i) = 0;
    elseif strategy7(i) == 1 && choice(i,1) == 2;
        mystrategy7(i) = 1;
    elseif strategy7(i) == 2 && choice(i,1) == 1;
        mystrategy7(i) = 1;
    elseif strategy7(i) == 2 && choice(i,1) == 2;
        mystrategy7(i) = 0;
    elseif strategy7(i) == 0 && choice(i,1) == 1;
        mystrategy7(i) = 0;
    elseif strategy7(i) == 0 && choice(i,1) == 2;
        mystrategy7(i) = 0;
    end
end

end

