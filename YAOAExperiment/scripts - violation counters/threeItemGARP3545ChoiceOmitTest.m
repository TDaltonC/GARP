function [ MAX, violations ] = threeItemGARP3545ChoiceOmitTest(violation, violationbychoice, set);
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

violations.threeItemGARP3545 = violation;


i = 1;
while i < 10
    maxes(i).choice = max(violationbychoice(:,i));
    indexMax = find(maxes(i).choice == violationbychoice(:,i));
    if length(indexMax) > 1
        indexMax = indexMax(1);
        for q = 1:length(violations.threeItemGARP3545)
            if violations.threeItemGARP3545(indexMax,q) ~= 0
                violations.threeItemGARP3545(indexMax,q) = violations.threeItemGARP3545(indexMax,q) - 1;
            end
            for r = 1:length(violations.threeItemGARP3545)
                if violations.threeItemGARP3545(r,indexMax) ~= 0
                    violations.threeItemGARP3545(r,indexMax) = violations.threeItemGARP3545(r,indexMax) - 1;
                end
            end
            for s = 1:length(set)
                violationbychoice(s,i+1) = nnz(violations.threeItemGARP3545(s,:));
            end
        end
    end
end

MAX = maxes.choice;
violations = violations.threeItemGARP3545;
