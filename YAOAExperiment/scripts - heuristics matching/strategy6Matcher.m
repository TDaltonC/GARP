function [ strategy6, mystrategy6 ] = strategy6Matcher( set, choice )
% maximizing item 3
%   only for three item GARP tasks; not for two item task

strategy6 = zeros(length(set),1);
for i = 1:length(set);
    if set(1,3,i) > set(2,3,i);
        strategy6(i) = 1;
    elseif set(1,3,i) < set(2,3,i);
        strategy6(i) = 2;
    elseif set(1,3,i) == set(2,3,i);
        strategy6(i) = 0;
    end
end

mystrategy6 = zeros(length(set),1);
for i = 1:length(set);
    if strategy6(i) == 1 && choice(i,1) == 1;
        mystrategy6(i) = 0;
    elseif strategy6(i) == 1 && choice(i,1) == 2;
        mystrategy6(i) = 1;
    elseif strategy6(i) == 2 && choice(i,1) == 1;
        mystrategy6(i) = 1;
    elseif strategy6(i) == 2 && choice(i,1) == 2;
        mystrategy6(i) = 0;
    elseif strategy6(i) == 0 && choice(i,1) == 1;
        mystrategy6(i) = 0;
    elseif strategy6(i) == 0 && choice(i,1) == 2;
        mystrategy6(i) = 0;
    end
end

end

