function [ MAX, violations ] = twoItemGARPChoiceOmitTest(violation, violationbychoice, set);
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

violations.twoItemGARP = violation;


i = 1;
while i < 10
    maxes(i).choice = max(violationbychoice(:,i));
    indexMax = find(maxes(i).choice == violationbychoice(:,i));
    if length(indexMax) > 1
        indexMax = indexMax(1);
        for q = 1:length(violations.twoItemGARP)
            if violations.twoItemGARP(indexMax,q) ~= 0
                violations.twoItemGARP(indexMax,q) = violations.twoItemGARP(indexMax,q) - 1;
            end
            for r = 1:length(violations.twoItemGARP)
                if violations.twoItemGARP(r,indexMax) ~= 0
                    violations.twoItemGARP(r,indexMax) = violations.twoItemGARP(r,indexMax) - 1;
                end
            end
            for s = 1:length(set)
                violationbychoice(s,i+1) = nnz(violations.twoItemGARP(s,:));
            end
        end
    end
end

MAX = maxes.choice;
violations = violations.twoItemGARP;