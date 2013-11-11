function [violation, violationbychoice, CKB, CKBbychoice] = threeItemGARP1323ViolationCounter(set, choice)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

cross = zeros (length(set));
violation = zeros (length(set));
violationbychoice = zeros(length(set),1);
CKB = zeros(length(set));
CKBbychoice = zeros(length(set),1);

for i = 1 : length(set);
    for j = 1 : length(set);
        if set(1,1,i) >= set(1,1,j) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
                set(1,3,i) >= set(1,3,j) && ...  %
                set(2,2,i) <= set(2,2,j) && ...  % And have line 'j' above line 'i' on the right
                set(2,3,i) <= set(2,3,j);
            if (set(1,1,i) ~= set(1,1,j) ||...   %Then is first basket in 'i' not equal to the first basket in 'j'
                    set(1,3,i) ~= set(1,3,j));
                if (set(2,2,i) ~= set(2,2,j) ||...%Then is second basket in 'i' not equal to the second basket in 'j'
                        set(2,3,i) ~= set(2,3,j));
                    cross(i,j) = 1;
                    if choice(i) == 2 && ...
                            choice(j) == 1;
                        left = [set(1,1,i),set(1,3,i);set(1,1,j),set(1,3,j)]; % defines the left bundles between which distance will be computed
                        dLeft = pdist(left,'euclidean'); % computes the euclidean distance between the left bundles
                        right = [set(2,2,i),set(2,3,i);set(2,2,j),set(2,3,j)]; % defines the right bundles
                        dRight = pdist(right,'euclidean'); % computes the euclidean distance between the right bundles
                        if i ~= j
                            violation(i,j) = 1;
                            CKB(i,j) = (dLeft+dRight)/2; % sum of distances is the CKB severity index
                        elseif i == j
                            violation(i,j) = 2;
                            CKB(i,j) = dLeft+dRight;
                        end
                    end
                end
            end
        end
        if set(1,1,i) <= set(1,1,j) && ...   % Vice Versa
                set(1,3,i) <= set(1,3,j) && ...
                set(2,2,i) >= set(2,2,j) && ...
                set(2,3,i) >= set(2,3,j);
            if (set(1,1,i) ~= set(1,1,j) ||...
                    set(1,3,i) ~= set(1,3,j));
                if (set(2,2,i) ~= set(2,2,j) ||...
                        set(2,3,i) ~= set(2,3,j));
                    cross(i,j) = 1;
                    if choice(i) == 1 && ...
                            choice(j) == 2;
                        left = [set(1,1,i),set(1,3,i);set(1,1,j),set(1,3,j)];
                        dLeft = pdist(left,'euclidean');
                        right = [set(2,2,i),set(2,3,i);set(2,2,j),set(2,3,j)];
                        dRight = pdist(right,'euclidean');
                        if i ~= j
                            violation(i,j) = 1;
                            CKB(i,j) = (dLeft+dRight)/2;
                        elseif i == j
                            violation(i,j) = 2;
                            CKB(i,j) = dLeft+dRight;
                        end
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


