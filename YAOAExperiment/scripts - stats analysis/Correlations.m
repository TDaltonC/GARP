data = xlsread('WM3Item.xlsx');
twoitem = data(:,1);
threeitem = data(:,2);
wm = data(:,3);
differences = data(:,4);


%% Pearson
%finds the parametric correlation coefficient
[rho,pval]=corr(wm,differences);
corrcoeffPEARSON = rho;
pvaluePEARSON = pval;

%% Spearman 
%finds the nonparametric Spearman correlation coefficient and p-value using the function spear
[r,t,p] = spear(wm,differences); 
corrcoeffSPEARMAN = r; 
pvalueSPEARMAN = p;

%% Kendall
wmdifferences = cat(2,wm,differences); %need to do this for the kendall function to work
corrcoeffKENDALL = kendalltau(wmdifferences); %finds the nonparametric Kendall tau-b correlation coefficient using the function kendalltau. tau-b is for data with repeats, like ours

%% Summary table

tablecorr = zeros(3,2);
tablecorr(1,1) = corrcoeffSPEARMAN;
tablecorr(1,2) = pvalueSPEARMAN;
tablecorr(2,1) = corrcoeffKENDALL(1,2);
tablecorr(2,2) = 0;
tablecorr(3,1) = corrcoeffPEARSON;
tablecorr(3,2) = pvaluePEARSON;



