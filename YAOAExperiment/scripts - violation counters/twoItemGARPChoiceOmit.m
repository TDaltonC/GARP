function [ maxes ] = twoItemGARPChoiceOmit(violation, violationbychoice, set);
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    
violations.twoItemGARP = violation;
    
for i = 1:10
    maxes(i) = max(violationbychoice);
    indexMax = find(maxes(i) == violationbychoice);
    if length(indexMax) > 1
        indexMax = indexMax(1);
    end
    for t = 1:length(violations.twoItemGARP)
        if violations.twoItemGARP(indexMax,t) ~= 0
            violations.twoItemGARP(indexMax,t) = violations.twoItemGARP(indexMax,t) - 1;
        end
    end
    for t = 1:length(violations.twoItemGARP)
        if violations.twoItemGARP(t,indexMax) ~= 0
            violations.twoItemGARP(t,indexMax) = violations.twoItemGARP(t,indexMax) - 1;
        end
    end
    for t = 1:length(set)
        violationbychoice(t,1) = nnz(violations.twoItemGARP(t,:));
    end
end

end

