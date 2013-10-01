N = 1200;  %maximum subject number
directory = './';

Data = [];
for subject = 1:N
    subj = mat2str(subject);
    if length(subj) < 2, subj = ['0', subj]; end
    filename = [directory, 'Sub-', subj, '.txt'];
    fid = fopen(filename); 
    try
        C = textscan(fid, '%d%d%d%f%d', 'Headerlines', 2, 'CollectOutput', 1);
        data = [double(C{1}), double(C{2}), double(C{3})];  
        fclose(fid);
        Data = [Data; data];
    catch me
    end
end

directory = '../';
outfile = [directory, 'SSTMCombined.dat'];
fid = fopen(outfile, 'w');
for line = 1:size(Data,1)
    fprintf(fid, '%3d %3d %3d %7.3f %3d /n', Data(line,:));
end
fclose(fid);