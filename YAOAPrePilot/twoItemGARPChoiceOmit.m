function [ firstMax, secondMax, thirdMax, fourthMax, fifthMax, sixthMax, violations ] = twoItemGARPChoiceOmit(violation, violationbychoice, set);
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    
violations.twoItemGARP = violation;
    
firstMax = max(violationbychoice);

indexMax = find(firstMax == violationbychoice);
if length(indexMax) > 1
    indexMax = indexMax(1);
end

violationsRev.twoItemGARP = violations.twoItemGARP;
for t = 1:length(violationsRev.twoItemGARP)
    if violationsRev.twoItemGARP(indexMax,t) ~= 0
        violationsRev.twoItemGARP(indexMax,t) = violationsRev.twoItemGARP(indexMax,t) - 1;
    end
end
for t = 1:length(violationsRev.twoItemGARP)
    if violationsRev.twoItemGARP(t,indexMax) ~= 0
        violationsRev.twoItemGARP(t,indexMax) = violationsRev.twoItemGARP(t,indexMax) - 1;
    end
end
violationbychoiceRev = zeros(length(set),1);
for t = 1:length(set)
    violationbychoiceRev(t,1) = nnz(violationsRev.twoItemGARP(t,:));
end

secondMax = max(violationbychoiceRev);

indexMax2 = find(secondMax == violationbychoiceRev);
if length(indexMax2) > 1
    indexMax2 = indexMax2(1);
end
violationsRev2.twoItemGARP = violationsRev.twoItemGARP;
for t = 1:length(violationsRev2.twoItemGARP)
    if violationsRev2.twoItemGARP(indexMax2,t) ~= 0
        violationsRev2.twoItemGARP(indexMax2,t) = violationsRev2.twoItemGARP(indexMax2,t) - 1;
    end
end
for t = 1:length(violationsRev2.twoItemGARP)
    if violationsRev2.twoItemGARP(t,indexMax2) ~= 0
        violationsRev2.twoItemGARP(t,indexMax2) = violationsRev2.twoItemGARP(t,indexMax2) - 1;
    end
end
violationbychoiceRev2 = zeros(length(set),1);
for t = 1:length(set)
    violationbychoiceRev2(t,1) = nnz(violationsRev2.twoItemGARP(t,:));
end

thirdMax = max(violationbychoiceRev2);

indexMax3 = find(thirdMax == violationbychoiceRev2);
if length(indexMax3) > 1
    indexMax3 = indexMax3(1);
end
violationsRev3.twoItemGARP = violationsRev2.twoItemGARP;
for t = 1:length(violationsRev3.twoItemGARP)
    if violationsRev3.twoItemGARP(indexMax3,t) ~= 0
        violationsRev3.twoItemGARP(indexMax3,t) = violationsRev3.twoItemGARP(indexMax3,t) - 1;
    end
end
for t = 1:length(violationsRev3.twoItemGARP)
    if violationsRev3.twoItemGARP(t,indexMax3) ~= 0
        violationsRev3.twoItemGARP(t,indexMax3) = violationsRev3.twoItemGARP(t,indexMax3) - 1;
    end
end
violationbychoiceRev3 = zeros(length(set),1);
for t = 1:length(set)
    violationbychoiceRev3(t,1) = nnz(violationsRev3.twoItemGARP(t,:));
end

fourthMax = max(violationbychoiceRev3);

indexMax4 = find(fourthMax == violationbychoiceRev3);
if length(indexMax4) > 1
    indexMax4 = indexMax4(1);
end
violationsRev4.twoItemGARP = violationsRev3.twoItemGARP;
for t = 1:length(violationsRev4.twoItemGARP)
    if violationsRev4.twoItemGARP(indexMax4,t) ~= 0
        violationsRev4.twoItemGARP(indexMax4,t) = violationsRev4.twoItemGARP(indexMax4,t) - 1;
    end
end
for t = 1:length(violationsRev4.twoItemGARP)
    if violationsRev4.twoItemGARP(t,indexMax4) ~= 0
        violationsRev4.twoItemGARP(t,indexMax4) = violationsRev4.twoItemGARP(t,indexMax4) - 1;
    end
end
violationbychoiceRev4 = zeros(length(set),1);
for t = 1:length(set)
    violationbychoiceRev4(t,1) = nnz(violationsRev4.twoItemGARP(t,:));
end

fifthMax = max(violationbychoiceRev4);

indexMax5 = find(fifthMax == violationbychoiceRev4);
if length(indexMax5) > 1
    indexMax5 = indexMax5(1);
end
violationsRev5.twoItemGARP = violationsRev4.twoItemGARP;
for t = 1:length(violationsRev5.twoItemGARP)
    if violationsRev5.twoItemGARP(indexMax5,t) ~= 0
        violationsRev5.twoItemGARP(indexMax5,t) = violationsRev5.twoItemGARP(indexMax5,t) - 1;
    end
end
for t = 1:length(violationsRev5.twoItemGARP)
    if violationsRev5.twoItemGARP(t,indexMax5) ~= 0
        violationsRev5.twoItemGARP(t,indexMax5) = violationsRev5.twoItemGARP(t,indexMax5) - 1;
    end
end
violationbychoiceRev5 = zeros(length(set),1);
for t = 1:length(set)
    violationbychoiceRev5(t,1) = nnz(violationsRev5.twoItemGARP(t,:));
end

sixthMax = max(violationbychoiceRev5);

violations = violations.twoItemGARP;
end

