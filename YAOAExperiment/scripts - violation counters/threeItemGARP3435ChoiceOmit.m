function [ firstMax, secondMax, thirdMax, fourthMax, fifthMax, sixthMax, seventhMax, violations ] = threeItemGARP3435ChoiceOmit(violation, violationbychoice, set);
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    
violations.threeItemGARP3435 = violation;
    
firstMax = max(violationbychoice);

indexMax = find(firstMax == violationbychoice);
if length(indexMax) > 1
    indexMax = indexMax(1);
end

violationsRev.threeItemGARP3435 = violations.threeItemGARP3435;
for t = 1:length(violationsRev.threeItemGARP3435)
    if violationsRev.threeItemGARP3435(indexMax,t) ~= 0
        violationsRev.threeItemGARP3435(indexMax,t) = violationsRev.threeItemGARP3435(indexMax,t) - 1;
    end
end
for t = 1:length(violationsRev.threeItemGARP3435)
    if violationsRev.threeItemGARP3435(t,indexMax) ~= 0
        violationsRev.threeItemGARP3435(t,indexMax) = violationsRev.threeItemGARP3435(t,indexMax) - 1;
    end
end
violationbychoiceRev = zeros(length(set),1);
for t = 1:length(set)
    violationbychoiceRev(t,1) = nnz(violationsRev.threeItemGARP3435(t,:));
end

secondMax = max(violationbychoiceRev);

indexMax2 = find(secondMax == violationbychoiceRev);
if length(indexMax2) > 1
    indexMax2 = indexMax2(1);
end
violationsRev2.threeItemGARP3435 = violationsRev.threeItemGARP3435;
for t = 1:length(violationsRev2.threeItemGARP3435)
    if violationsRev2.threeItemGARP3435(indexMax2,t) ~= 0
        violationsRev2.threeItemGARP3435(indexMax2,t) = violationsRev2.threeItemGARP3435(indexMax2,t) - 1;
    end
end
for t = 1:length(violationsRev2.threeItemGARP3435)
    if violationsRev2.threeItemGARP3435(t,indexMax2) ~= 0
        violationsRev2.threeItemGARP3435(t,indexMax2) = violationsRev2.threeItemGARP3435(t,indexMax2) - 1;
    end
end
violationbychoiceRev2 = zeros(length(set),1);
for t = 1:length(set)
    violationbychoiceRev2(t,1) = nnz(violationsRev2.threeItemGARP3435(t,:));
end

thirdMax = max(violationbychoiceRev2);

indexMax3 = find(thirdMax == violationbychoiceRev2);
if length(indexMax3) > 1
    indexMax3 = indexMax3(1);
end
violationsRev3.threeItemGARP3435 = violationsRev2.threeItemGARP3435;
for t = 1:length(violationsRev3.threeItemGARP3435)
    if violationsRev3.threeItemGARP3435(indexMax3,t) ~= 0
        violationsRev3.threeItemGARP3435(indexMax3,t) = violationsRev3.threeItemGARP3435(indexMax3,t) - 1;
    end
end
for t = 1:length(violationsRev3.threeItemGARP3435)
    if violationsRev3.threeItemGARP3435(t,indexMax3) ~= 0
        violationsRev3.threeItemGARP3435(t,indexMax3) = violationsRev3.threeItemGARP3435(t,indexMax3) - 1;
    end
end
violationbychoiceRev3 = zeros(length(set),1);
for t = 1:length(set)
    violationbychoiceRev3(t,1) = nnz(violationsRev3.threeItemGARP3435(t,:));
end

fourthMax = max(violationbychoiceRev3);

indexMax4 = find(fourthMax == violationbychoiceRev3);
if length(indexMax4) > 1
    indexMax4 = indexMax4(1);
end
violationsRev4.threeItemGARP3435 = violationsRev3.threeItemGARP3435;
for t = 1:length(violationsRev4.threeItemGARP3435)
    if violationsRev4.threeItemGARP3435(indexMax4,t) ~= 0
        violationsRev4.threeItemGARP3435(indexMax4,t) = violationsRev4.threeItemGARP3435(indexMax4,t) - 1;
    end
end
for t = 1:length(violationsRev4.threeItemGARP3435)
    if violationsRev4.threeItemGARP3435(t,indexMax4) ~= 0
        violationsRev4.threeItemGARP3435(t,indexMax4) = violationsRev4.threeItemGARP3435(t,indexMax4) - 1;
    end
end
violationbychoiceRev4 = zeros(length(set),1);
for t = 1:length(set)
    violationbychoiceRev4(t,1) = nnz(violationsRev4.threeItemGARP3435(t,:));
end

fifthMax = max(violationbychoiceRev4);

indexMax5 = find(fifthMax == violationbychoiceRev4);
if length(indexMax5) > 1
    indexMax5 = indexMax5(1);
end
violationsRev5.threeItemGARP3435 = violationsRev4.threeItemGARP3435;
for t = 1:length(violationsRev5.threeItemGARP3435)
    if violationsRev5.threeItemGARP3435(indexMax5,t) ~= 0
        violationsRev5.threeItemGARP3435(indexMax5,t) = violationsRev5.threeItemGARP3435(indexMax5,t) - 1;
    end
end
for t = 1:length(violationsRev5.threeItemGARP3435)
    if violationsRev5.threeItemGARP3435(t,indexMax5) ~= 0
        violationsRev5.threeItemGARP3435(t,indexMax5) = violationsRev5.threeItemGARP3435(t,indexMax5) - 1;
    end
end
violationbychoiceRev5 = zeros(length(set),1);
for t = 1:length(set)
    violationbychoiceRev5(t,1) = nnz(violationsRev5.threeItemGARP3435(t,:));
end

sixthMax = max(violationbychoiceRev5);

indexMax6 = find(sixthMax == violationbychoiceRev5);

if length(indexMax6) > 1
    indexMax6 = indexMax6(1);
end
violationsRev6.threeItemGARP3435 = violationsRev5.threeItemGARP3435;
for t = 1:length(violationsRev6.threeItemGARP3435)
    if violationsRev6.threeItemGARP3435(indexMax6,t) ~= 0
        violationsRev6.threeItemGARP3435(indexMax6,t) = violationsRev6.threeItemGARP3435(indexMax6,t) - 1;
    end
end
for t = 1:length(violationsRev6.threeItemGARP3435)
    if violationsRev6.threeItemGARP3435(t,indexMax6) ~= 0
        violationsRev6.threeItemGARP3435(t,indexMax6) = violationsRev6.threeItemGARP3435(t,indexMax6) - 1;
    end
end
violationbychoiceRev6 = zeros(length(set),1);
for t = 1:length(set)
    violationbychoiceRev6(t,1) = nnz(violationsRev6.threeItemGARP3435(t,:));
end

seventhMax = max(violationbychoiceRev6);

violations = violations.threeItemGARP3435;
end

