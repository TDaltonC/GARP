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

h2ItemYO = kstest2(Data2ItemYA, Data2ItemOA, 0.05);
h2ItemYR = kstest2(Data2ItemYA, Data2ItemRand, 0.05);
h2ItemOR = kstest2(Data2ItemOA, Data2ItemRand, 0.05);
h3ItemYO = kstest2(Data3ItemYA, Data3ItemOA, 0.05);
h3ItemYR = kstest2(Data3ItemYA, Data3ItemRand, 0.05);
h3ItemOR = kstest2(Data3ItemOA, Data3ItemRand, 0.05);