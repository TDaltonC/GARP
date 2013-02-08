function [ output_args ] = Summary( input_args )
%SUMMARY Summary of this function goes here
%   Detailed explanation goes here
cd('/Users/Dalton/Documents/MATLAB/GARP/GARP/PrePilot/preProcessed/YA');
subjects = dir;
violationSum.limitGARP = zeros(25);
violationSum.twoItemGARP = zeros(35);
violationSum.threeItemGARP1213 = zeros(35);
violationSum.threeItemGARP1223 = zeros(35);
violationSum.threeItemGARP1323 = zeros(35);

for folder = 1:length(subjects)
    if subjects(folder).name(1) == '.';
        continue
    end
    cd(subjects(folder).name);
    load ('violationMatrices.mat');
    violationSum.limitGARP = cat(3,violationSum.limitGARP, violations.limitGARP);
    violationSum.twoItemGARP = cat(3,violationSum.twoItemGARP, violations.twoItemGARP);
    violationSum.threeItemGARP1213 = cat(3,violationSum.threeItemGARP1213, violations.threeItemGARP1213);
    violationSum.threeItemGARP1223 = cat(3,violationSum.threeItemGARP1223, violations.threeItemGARP1223);
    violationSum.threeItemGARP1323 = cat(3,violationSum.threeItemGARP1323, violations.threeItemGARP1323);

    cd('../');
end
save('violationSumYA.mat','violationSum');
end
