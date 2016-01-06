function [result, result_origin_coordinate] = cut_element_horizontal(im, origin_coordinate)

result = {};
result_origin_coordinate = [];
i=1;
while 1
    
    sum_row = sum(im,2);
    
    indices_row_1 = find(sum_row ~= size(im,2));
    
    if isempty(indices_row_1)
        break;
    end
    
    if size(indices_row_1,1) == size(im,1)
        result{i} = im;
        result_origin_coordinate = [result_origin_coordinate; origin_coordinate];
        break;
    end
    
    im = im(indices_row_1(1):size(im,1),: );
    if i > 1
        origin_coordinate(1) = indices_row_1(1) + indices_row_2(1) + result_origin_coordinate(i-1,1)-2;
    else
        origin_coordinate(1) = indices_row_1(1) + origin_coordinate(1) - 1;
    end
    
    sum_row = sum(im,2);
    
    indices_row_2 = find(sum_row == size(im,2));
    
    
    if isempty(indices_row_2)
        result{i} = im;
        result_origin_coordinate = [result_origin_coordinate; origin_coordinate];
        break;
    else
        result{i} = im(1:indices_row_2(1)-1,:);
        result_origin_coordinate = [result_origin_coordinate; origin_coordinate];
    end
    
    im = im(indices_row_2(1):size(im,1),:);
    origin_coordinate(1) = indices_row_2(1);
    
    i = i+1;
end