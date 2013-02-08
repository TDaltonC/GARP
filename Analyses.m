%Directly and Indirectly Revealed Preferences; GARP, SARP, WARP Violations;
%Afriat Efficiency Index

% cd('/Users/Dalton/Documents/MATLAB/GARP/GARP/PrePilot/preProcessed');
% subjects = dir;
% for folder = 1:length(subjects)
%     if subjects(folder).name(1) == '.';
%         continue
%     end
%     cd(subjects(folder).name);
load('preProcessed.mat');

if exist('e','var') == 0; %e is the efficiency level; if not provided, default value is set to 1
    e = 1;
end

%load('p.mat'); %this is a 2D array (35X2); each row has 2 values, the first 
%is for the x-good the second is for the y-good and the second price is normalized to one

r = preProcessed.limitGARP.actualchoices;
x = preProcessed.twoItemGARP.actualchoices;
t = preProcessed.threeItemGARP1213.actualchoices;
u = preProcessed.threeItemGARP1223.actualchoices;
v = preProcessed.threeItemGARP1323.actualchoices;

set = preProcessed.twoItemGARP.tasks;


%%
%pmd and cmd are used to derive the matrix of directly revealed
%relations
pmdr=ones(length(preProcessed.limitGARP.PriceslimitGARP));
for i = 1:length(preProcessed.limitGARP.PriceslimitGARP);
    for j = 1:length(preProcessed.limitGARP.PriceslimitGARP);
        if e*preProcessed.limitGARP.PriceslimitGARP(i,:)*r(:,i) >= preProcessed.limitGARP.PriceslimitGARP(i,:)*r(:,j)||...
                i == j
            pmdr(i,j) = 1;
        else 
            pmdr(i,j) = 0;
        end
    end
end

pmdx=ones(length(preProcessed.twoItemGARP.PricestwoItemGARP)); %this is a 35X35 matrix to be filled with 1's and 0's 
for i = 1:length(preProcessed.twoItemGARP.PricestwoItemGARP);
    for j = 1:length(preProcessed.twoItemGARP.PricestwoItemGARP);
        if e*preProcessed.twoItemGARP.PricestwoItemGARP(i,:)*x(:,i) >= preProcessed.twoItemGARP.PricestwoItemGARP(i,:)*x(:,j)||...
                i == j
            pmdx(i,j) = 1;
        else 
            pmdx(i,j) = 0;
        end
    end
end

pmdt=ones(length(preProcessed.threeItemGARP1213.Prices1213)); %this is a 35X35 matrix to be filled with 1's and 0's 
for i = 1:length(preProcessed.threeItemGARP1213.Prices1213);
    for j = 1:length(preProcessed.threeItemGARP1213.Prices1213);
        if e*preProcessed.threeItemGARP1213.Prices1213(i,:)*t(:,i) >= preProcessed.threeItemGARP1213.Prices1213(i,:)*t(:,j)||...
                i == j
            pmdt(i,j) = 1;
        else 
            pmdt(i,j) = 0;
        end
    end
end

pmdu=ones(length(preProcessed.threeItemGARP1223.Prices1223)); %this is a 35X35 matrix to be filled with 1's and 0's 
for i = 1:length(preProcessed.threeItemGARP1223.Prices1223);
    for j = 1:length(preProcessed.threeItemGARP1223.Prices1223);
        if e*preProcessed.threeItemGARP1223.Prices1223(i,:)*u(:,i) >= preProcessed.threeItemGARP1223.Prices1223(i,:)*u(:,j)||...
                i == j
            pmdu(i,j) = 1;
        else 
            pmdu(i,j) = 0;
        end
    end
end

pmdv=ones(length(preProcessed.threeItemGARP1323.Prices1323)); %this is a 35X35 matrix to be filled with 1's and 0's 
for i = 1:length(preProcessed.threeItemGARP1323.Prices1323);
    for j = 1:length(preProcessed.threeItemGARP1323.Prices1323);
        if e*preProcessed.threeItemGARP1323.Prices1323(i,:)*v(:,i) >= preProcessed.threeItemGARP1323.Prices1323(i,:)*v(:,j)||...
                i == j
            pmdv(i,j) = 1;
        else 
            pmdv(i,j) = 0;
        end
    end
end

pmr = transclosure(pmdr);
pmx = transclosure(pmdx);
pmt = transclosure(pmdt);
pmu = transclosure(pmdu);
pmv = transclosure(pmdv);


%%
%GARP Violations%

pgokr=zeros(length(preProcessed.limitGARP.PriceslimitGARP));
for i = 1:length(preProcessed.limitGARP.PriceslimitGARP);
    for j = 1:length(preProcessed.limitGARP.PriceslimitGARP);
        if e*preProcessed.limitGARP.PriceslimitGARP(j,:)*r(:,j) > preProcessed.limitGARP.PriceslimitGARP(j,:)*r(:,i) &&...
                pmr(i,j) == 1 &&...
                r(1,i) ~= r(1,j)&&...
                r(2,i) ~= r(2,j)
            pgokr(i,j) = 0;
        else
            pgokr(i,j) = 1;
        end
    end
end

pgokx=zeros(length(preProcessed.twoItemGARP.PricestwoItemGARP));
for i = 1:length(preProcessed.twoItemGARP.PricestwoItemGARP);
    for j = 1:length(preProcessed.twoItemGARP.PricestwoItemGARP);
        if e*preProcessed.twoItemGARP.PricestwoItemGARP(j,:)*x(:,j) > preProcessed.twoItemGARP.PricestwoItemGARP(j,:)*x(:,i) &&...
                pmx(i,j) == 1 &&...
                x(1,i) ~= x(1,j)&&...
                x(2,i) ~= x(2,j)
            pgokx(i,j) = 0;
        else
            pgokx(i,j) = 1;
        end
    end
end

pgokt=zeros(length(preProcessed.threeItemGARP1213.Prices1213));
for i = 1:length(preProcessed.threeItemGARP1213.Prices1213);
    for j = 1:length(preProcessed.threeItemGARP1213.Prices1213);
        if e*preProcessed.threeItemGARP1213.Prices1213(j,:)*t(:,j) > preProcessed.threeItemGARP1213.Prices1213(j,:)*t(:,i) &&...
                pmt(i,j) == 1 &&...
                t(1,i) ~= t(1,j)&&...
                t(2,i) ~= t(2,j)
            pgokt(i,j) = 0;
        else
            pgokt(i,j) = 1;
        end
    end
end

pgoku=zeros(length(preProcessed.threeItemGARP1223.Prices1223));
for i = 1:length(preProcessed.threeItemGARP1223.Prices1223);
    for j = 1:length(preProcessed.threeItemGARP1223.Prices1223);
        if e*preProcessed.threeItemGARP1223.Prices1223(j,:)*u(:,j) > preProcessed.threeItemGARP1223.Prices1223(j,:)*u(:,i) &&...
                pmu(i,j) == 1 &&...
                u(1,i) ~= u(1,j)&&...
                u(2,i) ~= u(2,j)
            pgoku(i,j) = 0;
        else
            pgoku(i,j) = 1;
        end
    end
end

pgokv=zeros(length(preProcessed.threeItemGARP1323.Prices1323));
for i = 1:length(preProcessed.threeItemGARP1323.Prices1323);
    for j = 1:length(preProcessed.threeItemGARP1323.Prices1323);
        if e*preProcessed.threeItemGARP1323.Prices1323(j,:)*v(:,j) > preProcessed.threeItemGARP1323.Prices1323(j,:)*v(:,i) &&...
                pmv(i,j) == 1 &&...
                v(1,i) ~= v(1,j)&&...
                v(2,i) ~= v(2,j)
            pgokv(i,j) = 0;
        else
            pgokv(i,j) = 1;
        end
    end
end

%%
%SARP Violations
 psokr=ones(length(preProcessed.limitGARP.PriceslimitGARP));
for i = 1:length(preProcessed.limitGARP.PriceslimitGARP);
    for j = 1:length(preProcessed.limitGARP.PriceslimitGARP);
        if pmr(i,j) == 1 &&...
                r(1,i) ~= r(1,j) &&...
                r(2,i) ~= r(2,j) &&...
                pmr(j,i) == 1
                %e*P(j,:)*r(:,j) >= P(j,:)*r(:,i)
            psokr(i,j) = 0;
        else psokr(i,j) = 1;
        end
    end
end

 psokx=ones(length(preProcessed.twoItemGARP.PricestwoItemGARP));
for i = 1:length(preProcessed.twoItemGARP.PricestwoItemGARP);
    for j = 1:length(preProcessed.twoItemGARP.PricestwoItemGARP);
        if pmx(i,j) == 1 &&...
                x(1,i) ~= x(1,j) &&...
                x(2,i) ~= x(2,j) &&...
                pmx(j,i) == 1
               % e*p(j,:)*x(:,j) >= p(j,:)*x(:,i)
            psokx(i,j) = 0;
        else psokx(i,j) = 1;
        end
    end
end

 psokt=ones(length(preProcessed.threeItemGARP1213.Prices1213));
for i = 1:length(preProcessed.threeItemGARP1213.Prices1213);
    for j = 1:length(preProcessed.threeItemGARP1213.Prices1213);
        if pmt(i,j) == 1 &&...
                t(1,i) ~= t(1,j) &&...
                t(2,i) ~= t(2,j) &&...
                pmt(j,i) == 1
                %e*p(j,:)*t(:,j) >= p(j,:)*t(:,i)
            psokt(i,j) = 0;
        else psokt(i,j) = 1;
        end
    end
end

 psoku=ones(length(preProcessed.threeItemGARP1223.Prices1223));
for i = 1:length(preProcessed.threeItemGARP1223.Prices1223);
    for j = 1:length(preProcessed.threeItemGARP1223.Prices1223);
        if pmu(i,j) == 1 &&...
                u(1,i) ~= u(1,j) &&...
                u(2,i) ~= u(2,j) &&...
                pmu(j,i) == 1
                %e*p(j,:)*u(:,j) >= p(j,:)*u(:,i)
            psoku(i,j) = 0;
        else psoku(i,j) = 1;
        end
    end
end

 psokv=ones(length(preProcessed.threeItemGARP1323.Prices1323));
for i = 1:length(preProcessed.threeItemGARP1323.Prices1323);
    for j = 1:length(preProcessed.threeItemGARP1323.Prices1323);
        if pmv(i,j) == 1 &&...
                v(1,i) ~= v(1,j) &&...
                v(2,i) ~= v(2,j) &&...
                pmv(j,i) == 1
                %e*p(j,:)*v(:,j) >= p(j,:)*v(:,i)
            psokv(i,j) = 0;
        else psokv(i,j) = 1;
        end
    end
end
%%
%WARP Violations

pwokr = zeros(length(preProcessed.limitGARP.PriceslimitGARP));
for i = 1:length(preProcessed.limitGARP.PriceslimitGARP);
    for j = 1:length(preProcessed.limitGARP.PriceslimitGARP);
        if pmdr(i,j) == 1 &&...
                pmdr(j,i) == 1 &&...
                r(1,i) ~= r(1,j) &&...
                r(2,i) ~= r(2,j)
            pwokr(i,j) = 0;
        else
            pwokr(i,j) = 1;
        end
    end
end

pwokx = zeros(length(preProcessed.twoItemGARP.PricestwoItemGARP));
for i = 1:length(preProcessed.twoItemGARP.PricestwoItemGARP);
    for j = 1:length(preProcessed.twoItemGARP.PricestwoItemGARP);
        if pmdx(i,j) == 1 &&...
                pmdx(j,i) == 1 &&...
                x(1,i) ~= x(1,j) &&...
                x(2,i) ~= x(2,j)
            pwokx(i,j) = 0;
        else
            pwokx(i,j) = 1;
        end
    end
end

pwokt = zeros(length(preProcessed.threeItemGARP1213.Prices1213));
for i = 1:length(preProcessed.threeItemGARP1213.Prices1213);
    for j = 1:length(preProcessed.threeItemGARP1213.Prices1213);
        if pmdt(i,j) == 1 &&...
                pmdt(j,i) == 1 &&...
                t(1,i) ~= t(1,j) &&...
                t(2,i) ~= t(2,j)
            pwokt(i,j) = 0;
        else
            pwokt(i,j) = 1;
        end
    end
end

pwoku = zeros(length(preProcessed.threeItemGARP1223.Prices1223));
for i = 1:length(preProcessed.threeItemGARP1223.Prices1223);
    for j = 1:length(preProcessed.threeItemGARP1223.Prices1223);
        if pmdu(i,j) == 1 &&...
                pmdu(j,i) == 1 &&...
                u(1,i) ~= u(1,j) &&...
                u(2,i) ~= u(2,j)
            pwoku(i,j) = 0;
        else
            pwoku(i,j) = 1;
        end
    end
end

pwokv = zeros(length(preProcessed.threeItemGARP1323.Prices1323));
for i = 1:length(preProcessed.threeItemGARP1323.Prices1323);
    for j = 1:length(preProcessed.threeItemGARP1323.Prices1323);
        if pmdv(i,j) == 1 &&...
                pmdv(j,i) == 1 &&...
                v(1,i) ~= v(1,j) &&...
                v(2,i) ~= v(2,j)
            pwokv(i,j) = 0;
        else
            pwokv(i,j) = 1;
        end
    end
end
%%
%Counting Violations

%1. Counting GARP Violations

limitGARPviolation = zeros(length(preProcessed.limitGARP.PriceslimitGARP),1);

for i=1:length(preProcessed.limitGARP.PriceslimitGARP);
    if sum(pgokr(i,:)) == 0
        limitGARPviolation(i,1) = 1;
    elseif sum(pgokr(i,:)) == 25
        limitGARPviolation(i,1) = 1;
    end
end


twoItemGARPviolation = zeros(length(preProcessed.twoItemGARP.PricestwoItemGARP),1);

for i=1:length(preProcessed.twoItemGARP.PricestwoItemGARP);
    if sum(pgokx(i,:)) == 0
        twoItemGARPviolation(i,1) = 1;
    elseif sum(pgokx(i,:)) == 35
        twoItemGARPviolation(i,1) = 1;
    end
end

threeItemGARPviolation1213 = zeros(length(preProcessed.threeItemGARP1213.Prices1213),1);

for i=1:length(preProcessed.threeItemGARP1213.Prices1213);
    if sum(pgokt(i,:)) == 0
        threeItemGARPviolation1213(i,1) = 1;
    elseif sum(pgokt(i,:)) == 35
        threeItemGARPviolation1213(i,1) = 1;
    end
end

threeItemGARPviolation1223 = zeros(length(preProcessed.threeItemGARP1223.Prices1223),1);

for i=1:length(preProcessed.threeItemGARP1223.Prices1223);
    if sum(pgoku(i,:)) == 0
        threeItemGARPviolation1223(i,1) = 1;
    elseif sum(pgoku(i,:)) == 35
        threeItemGARPviolation1223(i,1) = 1;
    end
end

threeItemGARPviolation1323 = zeros(length(preProcessed.threeItemGARP1323.Prices1323),1);

for i=1:length(preProcessed.threeItemGARP1323.Prices1323);
    if sum(pgokv(i,:)) == 0
        threeItemGARPviolation1323(i,1) = 1;
    elseif sum(pgokv(i,:)) == 35
        threeItemGARPviolation1323(i,1) = 1;
    end
end

NumberviolationlimitGARP = 25-nnz(limitGARPviolation);
NumberviolationtwoItemGARP = 35-nnz(twoItemGARPviolation);
NumberviolationthreeItemGARP1213 = 35-nnz(threeItemGARPviolation1213);
NumberviolationthreeItemGARP1223 = 35-nnz(threeItemGARPviolation1223);
NumberviolationthreeItemGARP1323 = 35-nnz(threeItemGARPviolation1323);

%2. Counting SARP Violations
limitSARPviolation = zeros(length(preProcessed.limitGARP.PriceslimitGARP),1);

for i=1:length(preProcessed.limitGARP.PriceslimitGARP);
    if sum(psokr(i,:)) == 25
        limitSARPviolation (i,1) = 1;
    end
end

twoItemSARPviolation = zeros(length(preProcessed.twoItemGARP.PricestwoItemGARP),1);

for i=1:length(preProcessed.twoItemGARP.PricestwoItemGARP);
    if sum(psokx(i,:)) == 35
        twoItemSARPviolation (i,1) = 1;
    end
end

threeItemSARPviolation1213 = zeros(length(preProcessed.threeItemGARP1213.Prices1213),1);

for i=1:length(preProcessed.threeItemGARP1213.Prices1213);
    if sum(psokt(i,:)) == 35
        threeItemSARPviolation1213(i,1) = 1;
    end
end

threeItemSARPviolation1223 = zeros(length(preProcessed.threeItemGARP1223.Prices1223),1);

for i=1:length(preProcessed.threeItemGARP1223.Prices1223);
    if sum(psoku(i,:)) == 35
        threeItemSARPviolation1223(i,1) = 1;
    end
end

threeItemSARPviolation1323 = zeros(length(preProcessed.threeItemGARP1323.Prices1323),1);

for i=1:length(preProcessed.threeItemGARP1323.Prices1323);
    if sum(psokv(i,:)) == 35
        threeItemSARPviolation1323(i,1) = 1;
    end
end

NumberviolationlimitSARP = 25-nnz(limitSARPviolation);
NumberviolationtwoItemSARP = 35-nnz(twoItemSARPviolation);
NumberviolationthreeItemSARP1213 = 35-nnz(threeItemSARPviolation1213);
NumberviolationthreeItemSARP1223 = 35-nnz(threeItemSARPviolation1223);
NumberviolationthreeItemSARP1323 = 35-nnz(threeItemSARPviolation1323);

%3. Counting WARP Violations

limitWARPviolation = zeros(length(preProcessed.limitGARP.PriceslimitGARP),1);

for i=1:length(preProcessed.limitGARP.PriceslimitGARP);
    if sum(pwokr(i,:)) == 25
        limitWARPviolation (i,1) = 1;
    end
end

twoItemWARPviolation = zeros(length(preProcessed.twoItemGARP.PricestwoItemGARP),1);

for i=1:length(preProcessed.twoItemGARP.PricestwoItemGARP);
    if sum(pwokx(i,:)) == 35
        twoItemWARPviolation (i,1) = 1;
    end
end

threeItemWARPviolation1213 = zeros(length(preProcessed.threeItemGARP1213.Prices1213),1);

for i=1:length(preProcessed.threeItemGARP1213.Prices1213);
    if sum(pwokt(i,:)) == 35
        threeItemWARPviolation1213(i,1) = 1;
    end
end

threeItemWARPviolation1223 = zeros(length(preProcessed.threeItemGARP1223.Prices1223),1);

for i=1:length(preProcessed.threeItemGARP1223.Prices1223);
    if sum(pwoku(i,:)) == 35
        threeItemWARPviolation1223(i,1) = 1;
    end
end

threeItemWARPviolation1323 = zeros(length(preProcessed.threeItemGARP1323.Prices1323),1);

for i=1:length(preProcessed.threeItemGARP1323.Prices1323);
    if sum(pwokv(i,:)) == 35
        threeItemWARPviolation1323(i,1) = 1;
    end
end

NumberviolationlimitWARP = 25-nnz(limitWARPviolation);
NumberviolationtwoItemWARP = 35-nnz(twoItemWARPviolation);
NumberviolationthreeItemWARP1213 = 35-nnz(threeItemWARPviolation1213);
NumberviolationthreeItemWARP1223 = 35-nnz(threeItemWARPviolation1223);
NumberviolationthreeItemWARP1323 = 35-nnz(threeItemWARPviolation1323);

ViolationSummaryGARP=cat(2,NumberviolationlimitGARP,NumberviolationtwoItemGARP,NumberviolationthreeItemGARP1213,NumberviolationthreeItemGARP1223,NumberviolationthreeItemGARP1323);
ViolationSummaryWARP=cat(2,NumberviolationlimitWARP,NumberviolationtwoItemWARP,NumberviolationthreeItemWARP1213,NumberviolationthreeItemWARP1223,NumberviolationthreeItemWARP1323);
ViolationSummarySARP=cat(2,NumberviolationlimitSARP,NumberviolationtwoItemSARP,NumberviolationthreeItemSARP1213,NumberviolationthreeItemSARP1223,NumberviolationthreeItemSARP1323);
ViolationSummaryALL=cat(1,ViolationSummaryWARP,ViolationSummaryGARP,ViolationSummarySARP);

xlswrite('GARP.xls', ViolationSummaryALL);

save Results.mat;
%end
