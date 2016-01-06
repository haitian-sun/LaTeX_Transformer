function [result, coordinate] = rough_cut(im, current_origin)

result = {};
coordinate = [];
n = size(im);
n = max(n);
for i = 1:n
    tempt1 = im{i};
    tempt2 = current_origin(i,:);
    
    sum_col = sum(tempt1, 1);
    sum_row = sum(tempt1, 2);
    
    indices_col = find(sum_col == size(tempt1,1));
    indices_row = find(sum_row == size(tempt1,2));
    
    if( isempty(indices_col) && isempty(indices_row) )
        result = [result, tempt1];
        coordinate = [coordinate; tempt2 tempt2(1)+size(tempt1, 1)-1 tempt2(2)+size(tempt1, 2)-1]; 
    
    elseif( ~isempty(indices_col) )
        [cut_vertical, origin_vertical] = cut_element_vertical(tempt1, tempt2);
        [tempt_result, tempt_coordinate] = rough_cut(cut_vertical, origin_vertical);
        result = [result, tempt_result];
        coordinate = [coordinate; tempt_coordinate];
    
    else
        [cut_horizontal, origin_horizontal] = cut_element_horizontal(tempt1, tempt2);
        [tempt_result, tempt_coordinate] = rough_cut(cut_horizontal, origin_horizontal);
        result = [result, tempt_result];
        coordinate = [coordinate; tempt_coordinate];
    end
    
end
        
    