%The Format of set is set(basket or side, amount of item, choice set #)
%set = cat(3,[1, 2;2, 1], [1, 2;3, 1], [1, 2;4, 1], [1, 2;5, 1], [1, 3;2, 1], [1, 3;2, 2], [1, 3;3, 1], [1, 3;3, 2], [1, 3;4, 1], [1, 3;4, 2], [1, 3;5, 1], [1, 3;5, 2], [1, 4;2, 1], [1, 4;2, 2], [1, 4;2, 3], [1, 4;3, 1], [1, 4;3, 2], [1, 4;3, 3], [1, 4;4, 1], [1, 4;4, 2], [1, 4;4, 3], [1, 4;5, 1], [1, 4;5, 2], [1, 5;2, 1], [1, 5;2, 2], [1, 5;2, 3], [1, 5;2, 4], [1, 5;3, 1], [1, 5;3, 2], [1, 5;3, 3], [1, 5;3, 4], [1, 5;4, 1], [1, 5;4, 2], [1, 5;4, 3], [1, 5;5, 1], [1, 5;5, 2], [2, 2;3, 1], [2, 2;4, 1], [2, 2;5, 1], [2, 3;3, 1], [2, 3;3, 2], [2, 3;4, 1], [2, 3;4, 2], [2, 3;5, 1], [2, 3;5, 2], [2, 4;3, 1], [2, 4;3, 2], [2, 4;3, 3], [2, 4;4, 1], [2, 4;4, 2], [2, 4;4, 3], [2, 4;5, 1], [2, 4;5, 2], [2, 5;3, 1], [2, 5;3, 2], [2, 5;3, 3], [2, 5;3, 4], [2, 5;4, 1], [2, 5;4, 2], [2, 5;4, 3], [2, 5;5, 1], [2, 5;5, 2], [3, 2;4, 1], [3, 2;5, 1], [3, 3;4, 1], [3, 3;4, 2], [3, 3;5, 1], [3, 3;5, 2], [3, 4;4, 1], [3, 4;4, 2], [3, 4;4, 3], [3, 4;5, 1], [3, 4;5, 2], [4, 2;5, 1], [4, 3;5, 1], [4, 3;5, 2]);
set = preProcessed.threeItemGARP1213.tasks;
%while length(set) > 40;

%combo = combnk(1:length(bigSet),35);
%set = bigSet(:,:,combo(1,:));
cross = zeros (length(set));
violation = zeros (length(set));
i = 1;
j = 1;
for i = 1 : length(set);
    for j = 1 : length(set);
        if set(1,1,i) >= set(1,1,j) && ...  % Do they cross so that line 'i' is on top of line 'j' on the left side
           set(1,2,i) >= set(1,2,j) && ...  % 
%           set(1,3,i) >= set(1,3,j)  
           set(2,1,i) <= set(2,1,j) && ...  % And have line 'j' above line line 'i' on the right
           set(2,2,i) <= set(2,2,j) ;  
%           set(2,3,i) <= set(2,3,j);
            if (set(1,1,i) ~= set(1,1,j) ||...   %Then is first basket in 'i' not equal to the first basket in 'j'
                set(1,2,i) ~= set(1,2,j)) ;   
%                set(1,3,i) ~= set(1,3,j));
               if (set(2,1,i) ~= set(2,1,j) ||...%Then is second basket in 'i' not equal to the second basket in 'j'
                   set(2,2,i) ~= set(2,2,j)) ;
%                   set(2,3,i) ~= set(2,3,j));
                cross(i,j) = 1;
                if preProcessed.threeItemGARP1213.choices(i) == 2 && ...
                   preProcessed.threeItemGARP1213.choices(j) == 1;
                    violation(i,j) = 1;
                end
               end
            end
        end
%         if set(1,1,i) <= set(1,1,j) && ...
%            set(1,2,i) <= set(1,2,j) && ...
%            set(2,1,i) >= set(2,1,j) && ...
%            set(2,2,i) >= set(2,2,j);
%             if (set(1,1,i) ~= set(1,1,j) ||...
%                 set(1,2,i) ~= set(1,2,j));
%                if (set(2,1,i) ~= set(2,1,j) ||...
%                    set(2,2,i) ~= set(2,2,j));
%                 cross(i,j) = 1;
%                 if preProcessed.twoItemGARP.choices(i) == 1 && ...
%                    preProcessed.twoItemGARP.choices(j) == 2;
%                     violation(i,j) = 1;
%                 end
%                end
%             end
%         end
    end
end
[c,s] = min(cross);
% 
% if s == 1;
%     set1 = [];
% else
%     set1 = set(:,:,1:(s-1)); 
% end
% 
% 
% if s == length(set); 
%     set2 = [];
% else
%     set2 = set(:,:,(s+1):length(set));
% end
%     set = cat(3,set1, set2);
%end

                