function [result, result_origin_coordinate] = cut_element_vertical(im, origin_coordinate)

result = {};
result_origin_coordinate = [];
i=1;
while 1
    sum_col = sum(im,1);
    
    indices_col_1 = find(sum_col ~= size(im,1));
    
    if isempty(indices_col_1)
        break;
    end
    
    if size(indices_col_1,2) == size(im,2);
        result{i} = im;
        result_origin_coordinate = [result_origin_coordinate; origin_coordinate];
        break;
    end
    
    im = im(:,indices_col_1(1):size(im,2) );
    if i > 1
        origin_coordinate(2) = indices_col_1(1)+indices_col_2(1)+result_origin_coordinate(i-1,2)-2;
    else
        origin_coordinate(2) = indices_col_1(1) + origin_coordinate(2) -1 ;
    end
    
    sum_col = sum(im,1);
    
    indices_col_2 = find(sum_col == size(im,1));
    
    if isempty(indices_col_2)
        result{i} = im;
        result_origin_coordinate = [result_origin_coordinate; origin_coordinate];
        break;
    else
        result{i} = im(:,1:indices_col_2(1)-1);
        result_origin_coordinate = [result_origin_coordinate; origin_coordinate];
    end

    
    
    im = im(:,indices_col_2(1):size(im,2));
    origin_coordinate(2) = indices_col_2(1);
    
    i = i+1;
end
    



% whetherFinish = 1;
% result = im;
% remain = im;
% 
% sum_col = sum(im,1);
% indices_col = find(sum_col == size(im,1));
% 
% if indices_col
%     whetherFinish = 0;
% end
% 
% 
% if whetherFinish ==0
%     if indices_col
%     result = im(:,1:indices_col(1)-1);
% 
%     im = im(:, (indices_col(1)+1):size(im,2));
%     sum_col = sum(im, 1);
% 
%     indices_col = find(sum_col  ~= size(im,1));
%     remain = im(:,indices_col(1):size(im,2));
% end

