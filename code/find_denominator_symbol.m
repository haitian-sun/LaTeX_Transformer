function [denominator_img_id, left_img_id] = find_denominator_symbol(left_img_id, orig_img_info, img_id)
    left = orig_img_info(img_id, 3);
    right = orig_img_info(img_id, 4);
    bottom = orig_img_info(img_id, 2);
    
    i = 1;
    num_child = 0;
    while (i <= size(left_img_id, 2))
        child_id = left_img_id(i);
        child_left = orig_img_info(child_id, 3);
        child_right = orig_img_info(child_id, 4);
        child_top = orig_img_info(child_id, 2);
        if (child_left > left && child_right < right && child_top > bottom)
            num_child = num_child + 1;
            denominator_img_id(num_child) = child_id;
            left_img_id(i) = [];
            i = i - 1;
        end
        i = i + 1;
    end
end