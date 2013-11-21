[h, fhat, xgrid] = kde(difscores(:,1), 401);
[h2, fhat2, xgrid2] = kde(difscores(:,2), 401);
 figure;
 hold on;
 plot(xgrid, fhat, 'linewidth', 1, 'color', 'red');
 plot(difscores(:,1), zeros(length(difscores(:,1)),1), 'b+', 'color', 'red');
 plot(xgrid2, fhat2, 'linewidth', 1, 'color', 'blue');
 plot(difscores(:,2), zeros(length(difscores(:,2)),1), 'b+', 'color','blue');
 xlabel('Difference Scores')
 ylabel('Density function')
 hold off;