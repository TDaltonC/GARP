filename2Item = 'Import2Item.xlsx';
filename3Item = 'Import3Item.xlsx';
Data2Item = xlsread(filename2Item);
Data3Item = xlsread(filename3Item);
Data2ItemYA = zeros(17,1);
Data2ItemOA = zeros(14,1);
Data2ItemRand = zeros(1000,1);
Data3ItemYA = zeros(17,1);
Data3ItemOA = zeros(14,1);
Data3ItemRand = zeros(1000,1);

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
%% Kolgomorov-Smirnov Test for First Order Stochastic Dominance
hK2ItemYO = kstest2(Data2ItemYA, Data2ItemOA, 0.02);
hK2ItemYR = kstest2(Data2ItemYA, Data2ItemRand, 0.02);
hK2ItemOR = kstest2(Data2ItemOA, Data2ItemRand, 0.02);
hK3ItemYO = kstest2(Data3ItemYA, Data3ItemOA, 0.02);
hK3ItemYR = kstest2(Data3ItemYA, Data3ItemRand, 0.02);
hK3ItemOR = kstest2(Data3ItemOA, Data3ItemRand, 0.02);
hK23ItemY = kstest2(Data2ItemYA, Data3ItemYA, 0.02);
hK23ItemO = kstest2(Data2ItemOA, Data3ItemOA, 0.02);
hK23ItemRand = kstest2(Data2ItemRand, Data3ItemRand, 0.02);

%% Mann-Whitney U-Test
[p2ItemYO,hM2ItemYO,stats2ItemYO] = ranksum(Data2ItemYA, Data2ItemOA, 0.02);
[p2ItemYR,hM2ItemYR,stats2ItemYR] = ranksum(Data2ItemYA, Data2ItemRand, 0.02);
[p2ItemOR,hM2ItemOR,stats2ItemOR] = ranksum(Data2ItemOA, Data2ItemRand, 0.02);
[p3ItemYO,hM3ItemYO,stats3ItemYO] = ranksum(Data3ItemYA, Data3ItemOA, 0.02);
[p3ItemYR,hM3ItemYR,stats3ItemYR] = ranksum(Data3ItemYA, Data3ItemRand, 0.02);
[p3ItemOR,hM3ItemOR,stats3ItemOR] = ranksum(Data3ItemOA, Data3ItemRand, 0.02);
[p23ItemY,hM23ItemY,stats23ItemY] = ranksum(Data2ItemYA, Data3ItemYA, 0.02);
[p23ItemO,hM23ItemO,stats23ItemO] = ranksum(Data2ItemOA, Data3ItemOA, 0.02);
[p23ItemRand,hM23ItemRand,stats23ItemRand] = ranksum(Data2ItemRand, Data3ItemRand, 0.02);




