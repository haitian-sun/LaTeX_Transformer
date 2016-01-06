disp('createLabels starts ...');
% srcFiles = dir('train\*.PNG');
% tLabels = cell(1,length(srcFiles));
% for i = 1 : length(srcFiles)
%     c = strsplit(srcFiles(i).name,'.');
%     tLabels{i} = c(1);
% end

fid = fopen('label.txt');

tline = fgetl(fid);
i = 1;
while ischar(tline)
    tLabels{i} = tline;
    tline = fgetl(fid);
    i = i+1;
end

fclose(fid);