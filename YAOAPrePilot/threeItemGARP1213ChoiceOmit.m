function [ firstMax, secondMax, thirdMax, fourthMax, fifthMax, sixthMax, violations ] = threeItemGARP1213ChoiceOmit(violation, violationbychoice, set);
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    
violations.threeItemGARP1213 = violation;
    
firstMax = max(violationbychoice);

indexMax = find(firstMax == violationbychoice);
if length(indexMax) > 1
    indexMax = indexMax(1);
end

violationsRev.threeItemGARP1213 = violations.threeItemGARP1213;
for t = 1:length(violationsRev.threeItemGARP1213)
    if violationsRev.threeItemGARP1213(indexMax,t) ~= 0
        violationsRev.threeItemGARP1213(indexMax,t) = violationsRev.threeItemGARP1213(indexMax,t) - 1;
    end
end
for t = 1:length(violationsRev.threeItemGARP1213)
    if violationsRev.threeItemGARP1213(t,indexMax) ~= 0
        violationsRev.threeItemGARP1213(t,indexMax) = violationsRev.threeItemGARP1213(t,indexMax) - 1;
    end
end
violationbychoiceRev = zeros(length(set),1);
for t = 1:length(set)
    violationbychoiceRev(t,1) = nnz(violationsRev.threeItemGARP1213(t,:));
end

secondMax = max(violationbychoiceRev);

indexMax2 = find(secondMax == violationbychoiceRev);
if length(indexMax2) > 1
    indexMax2 = indexMax2(1);
end
violationsRev2.threeItemGARP1213 = violationsRev.threeItemGARP1213;
for t = 1:length(violationsRev2.threeItemGARP1213)
    if violationsRev2.threeItemGARP1213(indexMax2,t) ~= 0
        violationsRev2.threeItemGARP1213(indexMax2,t) = violationsRev2.threeItemGARP1213(indexMax2,t) - 1;
    end
end
for t = 1:length(violationsRev2.threeItemGARP1213)
    if violationsRev2.threeItemGARP1213(t,indexMax2) ~= 0
        violationsRev2.threeItemGARP1213(t,indexMax2) = violationsRev2.threeItemGARP1213(t,indexMax2) - 1;
    end
end
violationbychoiceRev2 = zeros(length(set),1);
for t = 1:length(set)
    violationbychoiceRev2(t,1) = nnz(violationsRev2.threeItemGARP1213(t,:));
end

thirdMax = max(violationbychoiceRev2);

indexMax3 = find(thirdMax == violationbychoiceRev2);
if length(indexMax3) > 1
    indexMax3 = indexMax3(1);
end
violationsRev3.threeItemGARP1213 = violationsRev2.threeItemGARP1213;
for t = 1:length(violationsRev3.threeItemGARP1213)
    if violationsRev3.threeItemGARP1213(indexMax3,t) ~= 0
        violationsRev3.threeItemGARP1213(indexMax3,t) = violationsRev3.threeItemGARP1213(indexMax3,t) - 1;
    end
end
for t = 1:length(violationsRev3.threeItemGARP1213)
    if violationsRev3.threeItemGARP1213(t,indexMax3) ~= 0
        violationsRev3.threeItemGARP1213(t,indexMax3) = violationsRev3.threeItemGARP1213(t,indexMax3) - 1;
    end
end
violationbychoiceRev3 = zeros(length(set),1);
for t = 1:length(set)
    violationbychoiceRev3(t,1) = nnz(violationsRev3.threeItemGARP1213(t,:));
end

fourthMax = max(violationbychoiceRev3);

indexMax4 = find(fourthMax == violationbychoiceRev3);
if length(indexMax4) > 1
    indexMax4 = indexMax4(1);
end
violationsRev4.threeItemGARP1213 = violationsRev3.threeItemGARP1213;
for t = 1:length(violationsRev4.threeItemGARP1213)
    if violationsRev4.threeItemGARP1213(indexMax4,t) ~= 0
        violationsRev4.threeItemGARP1213(indexMax4,t) = violationsRev4.threeItemGARP1213(indexMax4,t) - 1;
    end
end
for t = 1:length(violationsRev4.threeItemGARP1213)
    if violationsRev4.threeItemGARP1213(t,indexMax4) ~= 0
        violationsRev4.threeItemGARP1213(t,indexMax4) = violationsRev4.threeItemGARP1213(t,indexMax4) - 1;
    end
end
violationbychoiceRev4 = zeros(length(set),1);
for t = 1:length(set)
    violationbychoiceRev4(t,1) = nnz(violationsRev4.threeItemGARP1213(t,:));
end

fifthMax = max(violationbychoiceRev4);

indexMax5 = find(fifthMax == violationbychoiceRev4);
if length(indexMax5) > 1
    indexMax5 = indexMax5(1);
end
violationsRev5.threeItemGARP1213 = violationsRev4.threeItemGARP1213;
for t = 1:length(violationsRev5.threeItemGARP1213)
    if violationsRev5.threeItemGARP1213(indexMax5,t) ~= 0
        violationsRev5.threeItemGARP1213(indexMax5,t) = violationsRev5.threeItemGARP1213(indexMax5,t) - 1;
    end
end
for t = 1:length(violationsRev5.threeItemGARP1213)
    if violationsRev5.threeItemGARP1213(t,indexMax5) ~= 0
        violationsRev5.threeItemGARP1213(t,indexMax5) = violationsRev5.threeItemGARP1213(t,indexMax5) - 1;
    end
end
violationbychoiceRev5 = zeros(length(set),1);
for t = 1:length(set)
    violationbychoiceRev5(t,1) = nnz(violationsRev5.threeItemGARP1213(t,:));
end

sixthMax = max(violationbychoiceRev5);

violations = violations.threeItemGARP1213;
end

