function [ violation ] = catchViolationCounter( set, choice )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

violation = zeros(length(set),1);

for i = 1 : length(set);
    if choice(i) == 2 
        violation(i) = 0;
    elseif choice(i)== 1
        violation(i) = 1;
    end
end

violation = nnz(violation);

end

