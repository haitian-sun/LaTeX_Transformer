function [result, coordinate] = combine_dot(origin_result, origin_coordinate, origin_image)

Num = size(origin_result, 2);
i = 1;
which_one = 0;

while(i <= Num)
    ratio_1 = 1 - sum(sum(origin_result{i})) / (size(origin_result{i},1) * size(origin_result{i},2));
    
    ratio_2 = min(size(origin_result{i})) / max(size(origin_result{i}));
    
    if(ratio_1 >= 0.6 && ratio_2 >= 0.6)        
        if(i == Num)
            if origin_coordinate(i,2) < origin_coordinate(i-1,4) && origin_coordinate(i,4) > origin_coordinate(i-1,2)
                min_row = origin_coordinate(i-1,1);
                min_col = min(origin_coordinate(i,2),origin_coordinate(i-1,2));
                max_row = origin_coordinate(i, 3);
                max_col = max(origin_coordinate(i,4), origin_coordinate(i-1,4));
                origin_result{i-1} = origin_image(min_row:max_row, min_col:max_col);
                origin_result(i) = [];
                
                origin_coordinate(i-1,:) = [min_row, min_col, max_row, max_col];
        
                origin_coordinate(i,:) = [];
                
                Num = Num -1;
            else
                min_row = min(origin_coordinate(i-1,1), origin_coordinate(i,1));
                min_col = origin_coordinate(i,2);
                max_row = max(origin_coordinate(i,3), origin_coordinate(i-1,3));
                max_col = origin_coordinate(i,4);
                origin_coordinate(i,:) = [min_row, min_col, max_row, max_col];
                origin_result{i} = origin_image(min_row:max_row, min_col:max_col);
            end
            i = i + 1;
            continue
        end
        
        if origin_coordinate(i,2) < origin_coordinate(i+1,4) && origin_coordinate(i,4) > origin_coordinate(i+1,2)
            if origin_coordinate(i,2) < origin_coordinate(i-1,4) && origin_coordinate(i,4) > origin_coordinate(i-1,2)
                if abs( origin_coordinate(i,3) - origin_coordinate(i+1,1)) < abs( origin_coordinate(i,1) - origin_coordinate(i-1,3))
                    which_one = 2;
                else
                    which_one = 1;
                end
            else 
                which_one = 2;
            end
        elseif origin_coordinate(i,2) < origin_coordinate(i-1,4) && origin_coordinate(i,4) > origin_coordinate(i-1,2)
            which_one = 1;                
        end
                  
        
        if which_one == 2
                min_row = origin_coordinate(i,1);
                min_col = min(origin_coordinate(i,2),origin_coordinate(i+1,2));
                max_row = origin_coordinate(i+1, 3);
                max_col = max(origin_coordinate(i,4), origin_coordinate(i+1,4));
                origin_result{i} = origin_image(min_row:max_row, min_col:max_col);
                origin_result(i+1) = [];                
                origin_coordinate(i,:) = [min_row, min_col, max_row, max_col];       
                origin_coordinate(i+1,:) = [];
                Num = Num - 1;
        end
        
        if which_one == 1               
                min_row = origin_coordinate(i-1,1);
                min_col = min(origin_coordinate(i,2),origin_coordinate(i-1,2));
                max_row = origin_coordinate(i, 3);
                max_col = max(origin_coordinate(i,4), origin_coordinate(i-1,4));
                origin_result{i-1} = origin_image(min_row:max_row, min_col:max_col);
                origin_result(i) = [];
                
                origin_coordinate(i-1,:) = [min_row, min_col, max_row, max_col];
        
                origin_coordinate(i,:) = [];
                
                Num = Num -1;
        end
        
        if which_one == 0
             min_row = min(origin_coordinate(i-1,1), origin_coordinate(i,1));
             min_col = origin_coordinate(i,2);
             max_row = max(origin_coordinate(i,3), origin_coordinate(i-1,3));
             max_col = origin_coordinate(i,4);
             origin_coordinate(i,:) = [min_row, min_col, max_row, max_col];
             origin_result{i} = origin_image(min_row:max_row, min_col:max_col);
        end
    end
    
    i = i + 1;
    which_one = 0;
end

result = origin_result;
coordinate = origin_coordinate;
    
            
         