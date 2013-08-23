function [ firstMax, secondMax, thirdMax, fourthMax, fifthMax, sixthMax, seventhMax violations ] = catchGARPChoiceOmit(violation, violationbychoice, set);
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    
violations.catch = violation;
    
firstMax = max(violationbychoice);

indexMax = find(firstMax == violationbychoice);
if length(indexMax) > 1
    indexMax = indexMax(1);
end

violationsRev.catch = violations.catch;
for t = 1:length(violationsRev.catch)
    if violationsRev.catch(indexMax,t) ~= 0
        violationsRev.catch(indexMax,t) = violationsRev.catch(indexMax,t) - 1;
    end
end
for t = 1:length(violationsRev.catch)
    if violationsRev.catch(t,indexMax) ~= 0
        violationsRev.catch(t,indexMax) = violationsRev.catch(t,indexMax) - 1;
    end
end
violationbychoiceRev = zeros(length(set),1);
for t = 1:length(set)
    violationbychoiceRev(t,1) = nnz(violationsRev.catch(t,:));
end

secondMax = max(violationbychoiceRev);

indexMax2 = find(secondMax == violationbychoiceRev);
if length(indexMax2) > 1
    indexMax2 = indexMax2(1);
end
violationsRev2.catch = violationsRev.catch;
for t = 1:length(violationsRev2.catch)
    if violationsRev2.catch(indexMax2,t) ~= 0
        violationsRev2.catch(indexMax2,t) = violationsRev2.catch(indexMax2,t) - 1;
    end
end
for t = 1:length(violationsRev2.catch)
    if violationsRev2.catch(t,indexMax2) ~= 0
        violationsRev2.catch(t,indexMax2) = violationsRev2.catch(t,indexMax2) - 1;
    end
end
violationbychoiceRev2 = zeros(length(set),1);
for t = 1:length(set)
    violationbychoiceRev2(t,1) = nnz(violationsRev2.catch(t,:));
end

thirdMax = max(violationbychoiceRev2);

indexMax3 = find(thirdMax == violationbychoiceRev2);
if length(indexMax3) > 1
    indexMax3 = indexMax3(1);
end
violationsRev3.catch = violationsRev2.catch;
for t = 1:length(violationsRev3.catch)
    if violationsRev3.catch(indexMax3,t) ~= 0
        violationsRev3.catch(indexMax3,t) = violationsRev3.catch(indexMax3,t) - 1;
    end
end
for t = 1:length(violationsRev3.catch)
    if violationsRev3.catch(t,indexMax3) ~= 0
        violationsRev3.catch(t,indexMax3) = violationsRev3.catch(t,indexMax3) - 1;
    end
end
violationbychoiceRev3 = zeros(length(set),1);
for t = 1:length(set)
    violationbychoiceRev3(t,1) = nnz(violationsRev3.catch(t,:));
end

fourthMax = max(violationbychoiceRev3);

indexMax4 = find(fourthMax == violationbychoiceRev3);
if length(indexMax4) > 1
    indexMax4 = indexMax4(1);
end
violationsRev4.catch = violationsRev3.catch;
for t = 1:length(violationsRev4.catch)
    if violationsRev4.catch(indexMax4,t) ~= 0
        violationsRev4.catch(indexMax4,t) = violationsRev4.catch(indexMax4,t) - 1;
    end
end
for t = 1:length(violationsRev4.catch)
    if violationsRev4.catch(t,indexMax4) ~= 0
        violationsRev4.catch(t,indexMax4) = violationsRev4.catch(t,indexMax4) - 1;
    end
end
violationbychoiceRev4 = zeros(length(set),1);
for t = 1:length(set)
    violationbychoiceRev4(t,1) = nnz(violationsRev4.catch(t,:));
end

fifthMax = max(violationbychoiceRev4);

indexMax5 = find(fifthMax == violationbychoiceRev4);
if length(indexMax5) > 1
    indexMax5 = indexMax5(1);
end
violationsRev5.catch = violationsRev4.catch;
for t = 1:length(violationsRev5.catch)
    if violationsRev5.catch(indexMax5,t) ~= 0
        violationsRev5.catch(indexMax5,t) = violationsRev5.catch(indexMax5,t) - 1;
    end
end
for t = 1:length(violationsRev5.catch)
    if violationsRev5.catch(t,indexMax5) ~= 0
        violationsRev5.catch(t,indexMax5) = violationsRev5.catch(t,indexMax5) - 1;
    end
end
violationbychoiceRev5 = zeros(length(set),1);
for t = 1:length(set)
    violationbychoiceRev5(t,1) = nnz(violationsRev5.catch(t,:));
end

sixthMax = max(violationbychoiceRev5);

indexMax6 = find(sixthMax == violationbychoiceRev5);

if length(indexMax6) > 1
    indexMax6 = indexMax6(1);
end
violationsRev6.catch = violationsRev5.catch;
for t = 1:length(violationsRev6.catch)
    if violationsRev6.catch(indexMax6,t) ~= 0
        violationsRev6.catch(indexMax6,t) = violationsRev6.catch(indexMax6,t) - 1;
    end
end
for t = 1:length(violationsRev6.catch)
    if violationsRev6.catch(t,indexMax6) ~= 0
        violationsRev6.catch(t,indexMax6) = violationsRev6.catch(t,indexMax6) - 1;
    end
end
violationbychoiceRev6 = zeros(length(set),1);
for t = 1:length(set)
    violationbychoiceRev6(t,1) = nnz(violationsRev6.catch(t,:));
end

seventhMax = max(violationbychoiceRev6);

violations = violations.catch;
end

