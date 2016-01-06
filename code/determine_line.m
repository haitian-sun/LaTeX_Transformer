% Determine if a line is a minus sign or a fraction
function result = determine_line(index, coord_list)
    threshold_factor = 1.5;
    line = coord_list(index,:);
    min_y = line(1);
    max_y = line(2);
    min_x = line(3);
    max_x = line(4);
    threshold = threshold_factor * sqrt((max_y - min_y) * (max_x - min_x));
    y_bound_min = min_y - threshold;
    y_bound_max = max_y + threshold;
    result = '-';
    for i = 1:size(coord_list,1)
        if i ~= index
            line = coord_list(i,:);
            min_y_c = line(1);
            max_y_c = line(2);
            min_x_c = line(3);
            max_x_c = line(4);
            if (((min_x_c >= min_x) && (max_x_c <= max_x)) && (((y_bound_min <= max_y_c) && (max_y_c <= min_y)) || ((max_y <= min_y_c) && (min_y_c <= y_bound_max))))
                result = '\frac';
                break;
            end
        end
    end
end