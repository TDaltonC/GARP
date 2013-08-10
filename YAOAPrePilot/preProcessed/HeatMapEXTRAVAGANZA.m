load('violationSumGERO.mat');
HeatMap(violationSum.limitGARP,'DisplayRange',1);
HeatMap(violationSum.twoItemGARP,'DisplayRange',1);
HeatMap(violationSum.threeItemGARP1213,'RowLabels','ColumnLabels','DisplayRange',1);
HeatMap(violationSum.threeItemGARP1223,'RowLabels','ColumnLabels','DisplayRange',1);
HeatMap(violationSum.threeItemGARP1323,'RowLabels','ColumnLabels','DisplayRange',1);