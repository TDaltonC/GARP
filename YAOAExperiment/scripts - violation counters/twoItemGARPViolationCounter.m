function [violation, violationbychoice, CKB, CKBbychoice] = twoItemGARPViolationCounter(set, choice)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

cross = zeros (length(set));
violation = zeros (length(set));
violationbychoice = zeros(length(set),1);
CKB = zeros(length(set));
CKBbychoice = zeros(length(set),1);

for i = 1 : length(set);
    for j = 1 : length(set);
        if set(1,1,i) >= set(1,1,j) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
                set(1,2,i) >= set(1,2,j) && ...
                set(2,1,i) <= set(2,1,j) && ...  % And have line 'j' above line 'i' on the right
                set(2,2,i) <= set(2,2,j);
            if (set(1,1,i) ~= set(1,1,j) ||...   % Then is first basket in 'i' not equal to the first basket in 'j'
                    set(1,2,i) ~= set(1,2,j));
                if (set(2,1,i) ~= set(2,1,j) ||...% Then is second basket in 'i' not equal to the second basket in 'j'
                        set(2,2,i) ~= set(2,2,j));
                    cross(i,j) = 1;
                    if choice(i) == 2 && ...
                            choice(j) == 1;
                        left = [set(1,1,i),set(1,2,i);set(1,1,j),set(1,2,j)]; % defines the left bundles between which distance will be computed
                        dLeft = pdist(left,'euclidean'); % computes the euclidean distance between the left bundles
                        right = [set(2,1,i),set(2,2,i);set(2,1,j),set(2,2,j)]; % defines the right bundles
                        dRight = pdist(right,'euclidean'); % computes the euclidean distance between the right bundles
                        CKB(i,j) = (dLeft+dRight)/2; % sum of distances is the CKB severity index
                        if i ~= j
                            violation(i,j) = 1;
                        elseif i == j
                            violation(i,j) = 2;
                        end
                        %AEIMatrix(i,j) = max(dot(Price(i,:),set(1,:,j))/dot(Price(i,:),(set(2,:,i)))-eps, dot(Price(j,:),set(2,:,i))/dot(Price(j,:),set(1,:,j))-eps);
                    end
                end
            end
        end
        
        if set(1,1,i) <= set(1,1,j) && ...   % Vice Versa
                set(1,2,i) <= set(1,2,j) && ...
                set(2,1,i) >= set(2,1,j) && ...
                set(2,2,i) >= set(2,2,j);
            if (set(1,1,i) ~= set(1,1,j) ||...
                    set(1,2,i) ~= set(1,2,j));
                if (set(2,1,i) ~= set(2,1,j) ||...
                        set(2,2,i) ~= set(2,2,j));
                    cross(i,j) = 1;
                    if choice(i) == 1 && ...
                            choice(j) == 2;
                        left = [set(1,1,i),set(1,2,i);set(1,1,j),set(1,2,j)];
                        dLeft = pdist(left,'euclidean');
                        right = [set(2,1,i),set(2,2,i);set(2,1,j),set(2,2,j)];
                        dRight = pdist(right,'euclidean');
                        CKB(i,j) = (dLeft+dRight)/2;
                        if i ~= j;
                            violation(i,j) = 1;
                        elseif i == j;
                            violation(i,j) = 2;
                        end
                        % AEIMatrix(i,j) = max(dot(Price(i,:),set(1,:,j))/dot(Price(i,:),(set(2,:,i)))-eps, dot(Price(j,:),set(2,:,i))/dot(Price(j,:),set(1,:,j))-eps);
                    end
                end
            end
        end
    end
    violationbychoice(i,1) = nnz(violation(i,:));
    if nnz(CKB(i,:)) ~= 0
        CKBbychoice(i,1) = sum(CKB(i,:))/nnz(CKB(i,:));
    else 
        CKBbychoice(i,1) = 0;
    end
end


