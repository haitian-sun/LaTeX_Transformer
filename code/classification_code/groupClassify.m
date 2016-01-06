function [ output ] = groupClassify( result,classifier,tLabels,coord_list)
%GROUPCLASSIFY Summary of this function goes here
%   Detailed explanation goes here
output = cell(1,length(result));
for i = 1:length(result)
    output{i}=tLabels{pred(result{i},classifier)};
    if output{i} == '-'
        output{i} = determine_line(i,coord_list);
    end
end



end

