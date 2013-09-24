function [maxes ] = threeItemCyclicalChoiceOmit(violation, violationbychoice, set1,choice1,set2,choice2,set3,choice3);
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

violations.threeItemCyclical = violation;


for i = 1:10
    maxes(i) = max(violationbychoice);
    indexMax = find(maxes(i) == violationbychoice);
    if length(indexMax) > 1
        indexMax = indexMax(1);
    end
    for t = 1:length(violations.threeItemCyclical)
        for s = 1:length(violations.threeItemCyclical)
            if violations.threeItemCyclical(indexMax,t,s) ~= 0
                violations.threeItemCyclical(indexMax,t,s) = violations.threeItemCyclical(indexMax,t,s) - 1;
            end
        end
    end
    for t = 1:length(violations.threeItemCyclical)
        for s = 1:length(violations.threeItemCyclical)
            if violations.threeItemCyclical(t,indexMax,s) ~= 0
                violations.threeItemCyclical(t,indexMax,s) = violations.threeItemCyclical(t,indexMax,s) - 1;
            end
        end
    end
    for t = 1:length(violations.threeItemCyclical)
        for s = 1:length(violations.threeItemCyclical)
            if violations.threeItemCyclical(t,s,indexMax) ~= 0
                violations.threeItemCyclical(t,s,indexMax) = violations.threeItemCyclical(t,s,indexMax) - 1;
            end
        end
    end
    for t = 1:length(set1)
        violationbychoice(t,1) = nnz(violations.threeItemCyclical(t,:));
    end
end

end
