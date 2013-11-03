function [violation, violationbychoice, CKB, CKBbychoice] = threeItemCyclicalViolationCounter(set1, choice1, set2, choice2, set3, choice3)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here


cross = zeros (length(set1),length(set1),length(set1));
violation = zeros(length(set1),length(set1),length(set1));
CKB = zeros(length(set1),length(set1),length(set1));


for i = 1 : length(set1);
    for j = 1 : length(set2);
        for k = 1: length(set3);
            if set1(2,1,i) >= set3(1,1,k) && ... %This is condition + from Brocas' notes
                    set1(2,3,i) >= set3(1,3,k) && ...
                    set3(2,2,k) >= set2(2,2,j) && ...
                    set3(2,3,k) >= set2(2,3,j) && ...
                    set2(1,1,j) >= set1(1,1,i) && ...
                    set2(1,2,j) >= set1(1,2,i);
                if (set1(1,1,i) ~= set2(1,1,j) ||... %Then is first bundle in set1 different than the first bundle in set2
                        set1(1,2,i) ~= set2(1,2,j));
                    if (set1(2,1,i) ~= set3(1,1,k) ||... %Then is second bundle in set1 different than the first bundle in set3
                            set1(2,3,i) ~= set3(1,3,k));
                        if (set2(2,2,j) ~= set3(2,2,k) ||... %Then is second bundle in set2 different than the second bundle in set3
                                set2(2,3,j) ~= set3(2,3,k));
                            cross(i,j,k) = 1; %Then, there is a possible contradiction
                            if choice1(i) == 1 && ...
                                    choice2(j) == 2 && ...
                                    choice3(k) == 1;
                                violation(i,j,k) = 1;
                                x1 = [set1(1,1,i),set1(1,2,i);set2(1,1,j),set2(1,2,j)];
                                dx1 = pdist(x1,'euclidean');
                                x2 = [set1(2,1,i),set1(2,3,i);set3(1,1,k),set3(1,3,k)];
                                dx2 = pdist(x2,'euclidean');
                                x3 = [set2(2,2,j),set2(2,3,j);set3(2,2,k),set3(2,3,k)];
                                dx3 = pdist(x3,'euclidean');
                                CKB(i,j,k) = (dx1+dx2+dx3)/3;
                            end
                        end
                    end
                end
            end
        end
        if set1(2,1,i) <= set3(1,1,k) && ... %This is condition ++ from Brocas' notes
                set1(2,3,i) <= set3(1,3,k) && ...
                set3(2,2,k) <= set2(2,2,j) && ...
                set3(2,3,k) <= set2(2,3,j) && ...
                set2(1,1,j) <= set1(1,1,i) && ...
                set2(1,2,j) <= set1(1,2,i);
            if (set1(1,1,i) ~= set2(1,1,j) ||... %Then is first bundle in set1 different than the first bundle in set2
                    set1(1,2,i) ~= set2(1,2,j));
                if (set1(2,1,i) ~= set3(1,1,k) ||... %Then is second bundle in set1 different than the first bundle in set3
                        set1(2,3,i) ~= set3(1,3,k));
                    if (set2(2,2,j) ~= set3(2,2,k) ||... %Then is second bundle in set2 different than the second bundle in set3
                            set2(2,3,j) ~= set3(2,3,k));
                        cross(i,j,k) = 1; %Then, there is a possible contradiction
                        if choice1(i) == 2 && ...
                                choice2(j) == 1 && ...
                                choice3(k) == 2;
                            violation(i,j,k) = 1;
                            x1 = [set1(1,1,i),set1(1,2,i);set2(1,1,j),set2(1,2,j)];
                            dx1 = pdist(x1,'euclidean');
                            x2 = [set1(2,1,i),set1(2,3,i);set3(1,1,k),set3(1,3,k)];
                            dx2 = pdist(x2,'euclidean');
                            x3 = [set2(2,2,j),set2(2,3,j);set3(2,2,k),set3(2,3,k)];
                            dx3 = pdist(x3,'euclidean');
                            CKB(i,j,k) = (dx1+dx2+dx3)/3;
                        end
                    end
                end
            end
        end
    end
    violationbychoice(i,1) = nnz(violation(i,:,:));
    if nnz(CKB(i,:,:)) ~= 0
        CKBbychoice(i,1) = sum(sum(CKB(i,:,:)))/nnz(CKB(i,:,:));
    else
        CKBbychoice(i,1) = 0;
    end
end
end


