function [ maxes ] = threeItemGARP3545ChoiceOmit(violation, violationbychoice, set);
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    
violations.threeItemGARP3545 = violation;

for i = 1:20
    maxes(i) = max(violationbychoice);
    indexMax = find(maxes(i) == violationbychoice);
    if length(indexMax) > 1
        indexMax = indexMax(1);
    end
    for t = 1:length(violations.threeItemGARP3545)
        if violations.threeItemGARP3545(indexMax,t) ~= 0
            violations.threeItemGARP3545(indexMax,t) = violations.threeItemGARP3545(indexMax,t) - 1;
        end
    end
    for t = 1:length(violations.threeItemGARP3545)
        if violations.threeItemGARP3545(t,indexMax) ~= 0
            violations.threeItemGARP3545(t,indexMax) = violations.threeItemGARP3545(t,indexMax) - 1;
        end
    end
    for t = 1:length(set)
        violationbychoice(t,1) = nnz(violations.threeItemGARP3545(t,:));
    end
end

end

