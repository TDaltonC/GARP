function [ firstMax, secondMax, thirdMax, fourthMax, fifthMax, sixthMax, violations ] = limitGARPChoiceOmit(violation, violationbychoice, set);
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    
violations.limitGARP = violation;
    
firstMax = max(violationbychoice);

indexMax = find(firstMax == violationbychoice);
if length(indexMax) > 1
    indexMax = indexMax(1);
end

violationsRev.limitGARP = violations.limitGARP;
for t = 1:length(violationsRev.limitGARP)
    if violationsRev.limitGARP(indexMax,t) ~= 0
        violationsRev.limitGARP(indexMax,t) = violationsRev.limitGARP(indexMax,t) - 1;
    end
end
for t = 1:length(violationsRev.limitGARP)
    if violationsRev.limitGARP(t,indexMax) ~= 0
        violationsRev.limitGARP(t,indexMax) = violationsRev.limitGARP(t,indexMax) - 1;
    end
end
violationbychoiceRev = zeros(length(set),1);
for t = 1:length(set)
    violationbychoiceRev(t,1) = nnz(violationsRev.limitGARP(t,:));
end

secondMax = max(violationbychoiceRev);

indexMax2 = find(secondMax == violationbychoiceRev);
if length(indexMax2) > 1
    indexMax2 = indexMax2(1);
end
violationsRev2.limitGARP = violationsRev.limitGARP;
for t = 1:length(violationsRev2.limitGARP)
    if violationsRev2.limitGARP(indexMax2,t) ~= 0
        violationsRev2.limitGARP(indexMax2,t) = violationsRev2.limitGARP(indexMax2,t) - 1;
    end
end
for t = 1:length(violationsRev2.limitGARP)
    if violationsRev2.limitGARP(t,indexMax2) ~= 0
        violationsRev2.limitGARP(t,indexMax2) = violationsRev2.limitGARP(t,indexMax2) - 1;
    end
end
violationbychoiceRev2 = zeros(length(set),1);
for t = 1:length(set)
    violationbychoiceRev2(t,1) = nnz(violationsRev2.limitGARP(t,:));
end

thirdMax = max(violationbychoiceRev2);

indexMax3 = find(thirdMax == violationbychoiceRev2);
if length(indexMax3) > 1
    indexMax3 = indexMax3(1);
end
violationsRev3.limitGARP = violationsRev2.limitGARP;
for t = 1:length(violationsRev3.limitGARP)
    if violationsRev3.limitGARP(indexMax3,t) ~= 0
        violationsRev3.limitGARP(indexMax3,t) = violationsRev3.limitGARP(indexMax3,t) - 1;
    end
end
for t = 1:length(violationsRev3.limitGARP)
    if violationsRev3.limitGARP(t,indexMax3) ~= 0
        violationsRev3.limitGARP(t,indexMax3) = violationsRev3.limitGARP(t,indexMax3) - 1;
    end
end
violationbychoiceRev3 = zeros(length(set),1);
for t = 1:length(set)
    violationbychoiceRev3(t,1) = nnz(violationsRev3.limitGARP(t,:));
end

fourthMax = max(violationbychoiceRev3);

indexMax4 = find(fourthMax == violationbychoiceRev3);
if length(indexMax4) > 1
    indexMax4 = indexMax4(1);
end
violationsRev4.limitGARP = violationsRev3.limitGARP;
for t = 1:length(violationsRev4.limitGARP)
    if violationsRev4.limitGARP(indexMax4,t) ~= 0
        violationsRev4.limitGARP(indexMax4,t) = violationsRev4.limitGARP(indexMax4,t) - 1;
    end
end
for t = 1:length(violationsRev4.limitGARP)
    if violationsRev4.limitGARP(t,indexMax4) ~= 0
        violationsRev4.limitGARP(t,indexMax4) = violationsRev4.limitGARP(t,indexMax4) - 1;
    end
end
violationbychoiceRev4 = zeros(length(set),1);
for t = 1:length(set)
    violationbychoiceRev4(t,1) = nnz(violationsRev4.limitGARP(t,:));
end

fifthMax = max(violationbychoiceRev4);

indexMax5 = find(fifthMax == violationbychoiceRev4);
if length(indexMax5) > 1
    indexMax5 = indexMax5(1);
end
violationsRev5.limitGARP = violationsRev4.limitGARP;
for t = 1:length(violationsRev5.limitGARP)
    if violationsRev5.limitGARP(indexMax5,t) ~= 0
        violationsRev5.limitGARP(indexMax5,t) = violationsRev5.limitGARP(indexMax5,t) - 1;
    end
end
for t = 1:length(violationsRev5.limitGARP)
    if violationsRev5.limitGARP(t,indexMax5) ~= 0
        violationsRev5.limitGARP(t,indexMax5) = violationsRev5.limitGARP(t,indexMax5) - 1;
    end
end
violationbychoiceRev5 = zeros(length(set),1);
for t = 1:length(set)
    violationbychoiceRev5(t,1) = nnz(violationsRev5.limitGARP(t,:));
end

sixthMax = max(violationbychoiceRev5);

violations = violations.limitGARP;
end

