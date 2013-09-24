function [ firstMax, secondMax, thirdMax, fourthMax, fifthMax, sixthMax, violations ] = threeItemCyclicalChoiceOmit(violation, violationbychoice, set1,choice1,set2,choice2,set3,choice3);
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    
violations.threeItemCyclical = violation;
    
firstMax = max(violationbychoice);

indexMax = find(firstMax == violationbychoice);
if length(indexMax) > 1
    indexMax = indexMax(1);
end

violationsRev.threeItemCyclical = violations.threeItemCyclical;
for t = 1:length(violationsRev.threeItemCyclical)
    if violationsRev.threeItemCyclical(indexMax,t) ~= 0
        violationsRev.threeItemCyclical(indexMax,t) = violationsRev.threeItemCyclical(indexMax,t) - 1;
    end
end
for t = 1:length(violationsRev.threeItemCyclical)
    if violationsRev.threeItemCyclical(t,indexMax) ~= 0
        violationsRev.threeItemCyclical(t,indexMax) = violationsRev.threeItemCyclical(t,indexMax) - 1;
    end
end
violationbychoiceRev = zeros(length(set1),1);
for t = 1:length(set1)
    violationbychoiceRev(t,1) = nnz(violationsRev.threeItemCyclical(t,:));
end

secondMax = max(violationbychoiceRev);

indexMax2 = find(secondMax == violationbychoiceRev);
if length(indexMax2) > 1
    indexMax2 = indexMax2(1);
end
violationsRev2.threeItemCyclical = violationsRev.threeItemCyclical;
for t = 1:length(violationsRev2.threeItemCyclical)
    if violationsRev2.threeItemCyclical(indexMax2,t) ~= 0
        violationsRev2.threeItemCyclical(indexMax2,t) = violationsRev2.threeItemCyclical(indexMax2,t) - 1;
    end
end
for t = 1:length(violationsRev2.threeItemCyclical)
    if violationsRev2.threeItemCyclical(t,indexMax2) ~= 0
        violationsRev2.threeItemCyclical(t,indexMax2) = violationsRev2.threeItemCyclical(t,indexMax2) - 1;
    end
end
violationbychoiceRev2 = zeros(length(set1),1);
for t = 1:length(set1)
    violationbychoiceRev2(t,1) = nnz(violationsRev2.threeItemCyclical(t,:));
end

thirdMax = max(violationbychoiceRev2);

indexMax3 = find(thirdMax == violationbychoiceRev2);
if length(indexMax3) > 1
    indexMax3 = indexMax3(1);
end
violationsRev3.threeItemCyclical = violationsRev2.threeItemCyclical;
for t = 1:length(violationsRev3.threeItemCyclical)
    if violationsRev3.threeItemCyclical(indexMax3,t) ~= 0
        violationsRev3.threeItemCyclical(indexMax3,t) = violationsRev3.threeItemCyclical(indexMax3,t) - 1;
    end
end
for t = 1:length(violationsRev3.threeItemCyclical)
    if violationsRev3.threeItemCyclical(t,indexMax3) ~= 0
        violationsRev3.threeItemCyclical(t,indexMax3) = violationsRev3.threeItemCyclical(t,indexMax3) - 1;
    end
end
violationbychoiceRev3 = zeros(length(set1),1);
for t = 1:length(set1)
    violationbychoiceRev3(t,1) = nnz(violationsRev3.threeItemCyclical(t,:));
end

fourthMax = max(violationbychoiceRev3);

indexMax4 = find(fourthMax == violationbychoiceRev3);
if length(indexMax4) > 1
    indexMax4 = indexMax4(1);
end
violationsRev4.threeItemCyclical = violationsRev3.threeItemCyclical;
for t = 1:length(violationsRev4.threeItemCyclical)
    if violationsRev4.threeItemCyclical(indexMax4,t) ~= 0
        violationsRev4.threeItemCyclical(indexMax4,t) = violationsRev4.threeItemCyclical(indexMax4,t) - 1;
    end
end
for t = 1:length(violationsRev4.threeItemCyclical)
    if violationsRev4.threeItemCyclical(t,indexMax4) ~= 0
        violationsRev4.threeItemCyclical(t,indexMax4) = violationsRev4.threeItemCyclical(t,indexMax4) - 1;
    end
end
violationbychoiceRev4 = zeros(length(set1),1);
for t = 1:length(set1)
    violationbychoiceRev4(t,1) = nnz(violationsRev4.threeItemCyclical(t,:));
end

fifthMax = max(violationbychoiceRev4);

indexMax5 = find(fifthMax == violationbychoiceRev4);
if length(indexMax5) > 1
    indexMax5 = indexMax5(1);
end
violationsRev5.threeItemCyclical = violationsRev4.threeItemCyclical;
for t = 1:length(violationsRev5.threeItemCyclical)
    if violationsRev5.threeItemCyclical(indexMax5,t) ~= 0
        violationsRev5.threeItemCyclical(indexMax5,t) = violationsRev5.threeItemCyclical(indexMax5,t) - 1;
    end
end
for t = 1:length(violationsRev5.threeItemCyclical)
    if violationsRev5.threeItemCyclical(t,indexMax5) ~= 0
        violationsRev5.threeItemCyclical(t,indexMax5) = violationsRev5.threeItemCyclical(t,indexMax5) - 1;
    end
end
violationbychoiceRev5 = zeros(length(set1),1);
for t = 1:length(set1)
    violationbychoiceRev5(t,1) = nnz(violationsRev5.threeItemCyclical(t,:));
end

sixthMax = max(violationbychoiceRev5);

violations = violations.threeItemCyclical;
end
