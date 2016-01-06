function [result, coordinate] = sort_by_left(origin_result, origin_coordinate)

min_col = origin_coordinate(:,2);
[~, index] = sort(min_col);
coordinate = origin_coordinate(index,:);
result = origin_result(index);