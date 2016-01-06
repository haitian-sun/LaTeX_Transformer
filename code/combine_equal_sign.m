function [result, coordinate] = combine_equal_sign(origin_result, origin_coordinate, origin_image)

Num = size(origin_result, 2);
i = 1;

while(i < Num)
    if(origin_coordinate(i,2) == origin_coordinate(i+1,2) && origin_coordinate(i,4) == origin_coordinate(i+1,4))
        
        origin_result{i} = origin_image(origin_coordinate(i,1) : origin_coordinate(i+1,3),origin_coordinate(i,2) : origin_coordinate(i,4));
        origin_result(i+1) = [];
        
        origin_coordinate(i,3:4) = [origin_coordinate(i+1,3), origin_coordinate(i+1,4)];
        
        origin_coordinate(i+1,:) = [];
        
        Num = Num - 1;
    end
    i = i + 1;
end

result = origin_result;
coordinate = origin_coordinate;
    
            
         