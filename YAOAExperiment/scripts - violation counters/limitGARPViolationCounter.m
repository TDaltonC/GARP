function [violation, violationbychoice] = limitGARPViolationCounter(set, choice)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

cross = zeros (length(set));
violation = zeros (length(set));
violationbychoice = zeros(length(set),1);

for i = 1 : length(set);
    for j = 1 : length(set);
        if set(i,1) > set(j,1) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
           set(i,2) < set(j,2); % And line 'j' is on top of line 'i' on the right side
                cross(i,j) = 1;
                if choice(i) == 2 && ...
                   choice(j) == 1; 
                    if i ~= j;
                        violation(i,j) = 1;
                    elseif i == j;
                        violation(i,j) = 2;
                    end
                end
        end
        
        if set(i,1) < set(j,1) && ...  % Do they cross so that line 'j' is on top of line 'i' on the left side
           set(i,2) > set(j,2); % And line 'i' is on top of line 'j' on the right side
                cross(i,j) = 1;
                if choice(i) == 1 && ...
                   choice(j) == 2;
                    if i ~= j;
                        violation(i,j) = 1;
                    elseif i == j;
                        violation(i,j) = 2;
                    end
                end
        end
    end
    violationbychoice(i,1) = nnz(violation(i,:));
end
