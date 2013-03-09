filename2Item = 'Import2Item.xlsx';
filename3Item = 'Import3Item.xlsx';
filename32diffItem = 'Import32diffItem.xlsx';
Data2Item = xlsread(filename2Item);
Data3Item = xlsread(filename3Item);
Data32Itemdiff = xlsread(filename32diffItem);
Data2ItemYA = zeros(17,1);
Data2ItemOA = zeros(14,1);
Data2ItemRand = zeros(1000,1);
Data3ItemYA = zeros(17,1);
Data3ItemOA = zeros(14,1);
Data3ItemRand = zeros(1000,1);
Data32ItemdiffYA = zeros(17,1);
Data32ItemdiffOA = zeros(14,1);
Data32ItemdiffRand = zeros(1000,1);

for i = 1:17;
    Data2ItemYA(i,1) = Data2Item(i,1);
end

for i = 1:14;
    Data2ItemOA(i,1) = Data2Item(i,2);
end

for i = 1:1000;
    Data2ItemRand(i,1) = Data2Item(i,3);
end

for i = 1:17;
    Data3ItemYA(i,1) = Data3Item(i,1);
end

for i = 1:14;
    Data3ItemOA(i,1) = Data3Item(i,2);
end

for i = 1:1000;
    Data3ItemRand(i,1) = Data3Item(i,3);
end

for i = 1:17;
    Data32ItemdiffYA(i,1) = Data32Itemdiff(i,4);
end

for i = 1:14;
    Data32ItemdiffOA(i,1) = Data32Itemdiff(i,8);
end

% for i = 1:1000;
%     Data32ItemdiffRAND(i,1) = Data32Itemdiff(i,12); need RANDOM data
% end

%% Kolgomorov-Smirnov Test for First Order Stochastic Dominance (for 2 independent samples)
hK2ItemYO = kstest2(Data2ItemYA, Data2ItemOA, 0.05);
hK2ItemYR = kstest2(Data2ItemYA, Data2ItemRand, 0.05);
hK2ItemOR = kstest2(Data2ItemOA, Data2ItemRand, 0.05);
hK3ItemYO = kstest2(Data3ItemYA, Data3ItemOA, 0.05);
hK3ItemYR = kstest2(Data3ItemYA, Data3ItemRand, 0.05);
hK3ItemOR = kstest2(Data3ItemOA, Data3ItemRand, 0.05);
hK23ItemY = kstest2(Data2ItemYA, Data3ItemYA, 0.05);
hK23ItemO = kstest2(Data2ItemOA, Data3ItemOA, 0.05);
hK23ItemRand = kstest2(Data2ItemRand, Data3ItemRand, 0.05);
hK32ItemdiffYO = kstest2(Data32ItemdiffYA, Data32ItemdiffOA, 0.05);
% hK32ItemdiffYR = kstest2(Data32ItemdiffYA, Data32ItemdiffRand, 0.05); need RANDOM data
% hK32ItemdiffOR = kstest2(Data32ItemdiffOA, Data32ItemdiffRand, 0.05);

%% Mann-Whitney U-Test aka Wilcoxon Rank Sum Test (for 2 independent samples)
[p2ItemYO,hM2ItemYO,stats2ItemYO] = ranksum(Data2ItemYA, Data2ItemOA, 0.05);
[p2ItemYR,hM2ItemYR,stats2ItemYR] = ranksum(Data2ItemYA, Data2ItemRand, 0.05);
[p2ItemOR,hM2ItemOR,stats2ItemOR] = ranksum(Data2ItemOA, Data2ItemRand, 0.05);
[p3ItemYO,hM3ItemYO,stats3ItemYO] = ranksum(Data3ItemYA, Data3ItemOA, 0.05);
[p3ItemYR,hM3ItemYR,stats3ItemYR] = ranksum(Data3ItemYA, Data3ItemRand, 0.05);
[p3ItemOR,hM3ItemOR,stats3ItemOR] = ranksum(Data3ItemOA, Data3ItemRand, 0.05);
[p32ItemdiffYO,hM32ItemdiffYO,stats32ItemdiffYO] = ranksum(Data32ItemdiffYA, Data32ItemdiffOA, 0.05);
% [p23ItemY,hM23ItemY,stats23ItemY] = ranksum(Data2ItemYA, Data3ItemYA, 0.05);
% [p23ItemO,hM23ItemO,stats23ItemO] = ranksum(Data2ItemOA, Data3ItemOA, 0.05);
% [p23ItemRand,hM23ItemRand,stats23ItemRand] = ranksum(Data2ItemRand, Data3ItemRand, 0.05);

%% Wilcoxon Signed Rank Test (for paired samples)
[p23ItemY,hM23ItemY,stats23ItemY] = signrank(Data2ItemYA, Data3ItemYA, 0.05);
[p23ItemO,hM23ItemO,stats23ItemO] = signrank(Data2ItemOA, Data3ItemOA, 0.05);
[p23ItemRand,hM23ItemRand,stats23ItemRand] = signrank(Data2ItemRand, Data3ItemRand, 0.05);

RejectOrAcceptTableMWU(1,1) = hM2ItemYO;
RejectOrAcceptTableMWU(1,2) = hM2ItemYR;
RejectOrAcceptTableMWU(1,3) = hM2ItemOR;
RejectOrAcceptTableMWU(1,4) = hM3ItemYO;
RejectOrAcceptTableMWU(1,5) = hM3ItemYR;
RejectOrAcceptTableMWU(1,6) = hM3ItemOR;
RejectOrAcceptTableMWU(1,7) = hM23ItemY;
RejectOrAcceptTableMWU(1,8) = hM23ItemO;
RejectOrAcceptTableMWU(1,9) = hM23ItemRand;
RejectOrAcceptTableMWU(1,10) = hM32ItemdiffYO;
% table(1,11) = hM32ItemdiffYR;
% table(1,12) = hM32ItemdiffOR;

pValueTableMWU(1,1) = p2ItemYO;
pValueTableMWU(1,2) = p2ItemYR;
pValueTableMWU(1,3) = p2ItemOR;
pValueTableMWU(1,4) = p3ItemYO;
pValueTableMWU(1,5) = p3ItemYR;
pValueTableMWU(1,6) = p3ItemOR;
pValueTableMWU(1,7) = p23ItemY;
pValueTableMWU(1,8) = p23ItemO;
pValueTableMWU(1,9) = p23ItemRand;
pValueTableMWU(1,10) = p32ItemdiffYO;
% table(1,11) = p32ItemdiffYR;
% table(1,12) = p32ItemdiffOR;

RejectOrAcceptTableKS(1,1) = hK2ItemYO;
RejectOrAcceptTableKS(1,2) = hK2ItemYR;
RejectOrAcceptTableKS(1,3) = hK2ItemOR;
RejectOrAcceptTableKS(1,4) = hK3ItemYO;
RejectOrAcceptTableKS(1,5) = hK3ItemYR;
RejectOrAcceptTableKS(1,6) = hK3ItemOR;
RejectOrAcceptTableKS(1,7) = hK23ItemY;
RejectOrAcceptTableKS(1,8) = hK23ItemO;
RejectOrAcceptTableKS(1,9) = hK23ItemRand;
RejectOrAcceptTableKS(1,10) = hK32ItemdiffYO;
% table(1,11) = hK32ItemdiffYR;
% table(1,12) = hK32ItemdiffOR;


