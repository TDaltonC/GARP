
% load(rankingTask.mat);






rankingMatrix = zeros(10);

for i = 1:length(rankingTask);
    if behavioral.key(i) == 'f';
        if settings.flipLR(i) == 0;
            rankingMatrix(rankingTask(trialOrder(i),1),rankingTask(trialOrder(i),2)) = 1;
            rankingMatrix(rankingTask(trialOrder(i),2),rankingTask(trialOrder(i),1)) = 0;
        elseif settings.flipLR(i) == 1;
            rankingMatrix(rankingTask(trialOrder(i),1),rankingTask(trialOrder(i),2)) = 0;
            rankingMatrix(rankingTask(trialOrder(i),2),rankingTask(trialOrder(i),1)) = 1;
        end
    elseif behavioral.key(i) == 'j';
        if settings.flipLR(i) == 0;
            rankingMatrix(rankingTask(trialOrder(i),1),rankingTask(trialOrder(i),2)) = 0;
            rankingMatrix(rankingTask(trialOrder(i),2),rankingTask(trialOrder(i),1)) = 1;
        elseif settings.flipLR(i) == 1;
            rankingMatrix(rankingTask(trialOrder(i),1),rankingTask(trialOrder(i),2)) = 1;
            rankingMatrix(rankingTask(trialOrder(i),2),rankingTask(trialOrder(i),1)) = 0;
        end
    end
end
rankList = sum(rankingMatrix);