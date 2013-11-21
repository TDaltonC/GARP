[h, fhat, xgrid] = kde(difscores, 401);
 figure;
 hold on;
 plot(xgrid, fhat, 'linewidth', 2, 'color', 'black');
 plot(difscores, zeros(length(difscores),1), 'b+');
 xlabel('Difference Scores')
 ylabel('Density function')
 hold off;