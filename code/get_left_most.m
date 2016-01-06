function best = get_left_most(orig_img_info, left_img_id, symbol)
    best = 1;
    id = left_img_id(1);
    left_most = orig_img_info(id, 3);
    for i = 2: size(left_img_id, 2)
        new_id = left_img_id(i);
        if (strcmp(symbol{new_id}, '\sum') || strcmp(symbol{new_id}, '\prod'))
            new_left = 0;
            for j = 1 : size(left_img_id, 2)
                tmp_id = left_img_id(j);
                if (orig_img_info(tmp_id, 1) < orig_img_info(new_id, 2) ...
                    && orig_img_info(tmp_id, 2) > orig_img_info(new_id, 1) ...
                    && orig_img_info(tmp_id, 4) < orig_img_info(new_id, 3) ...
                    && orig_img_info(tmp_id, 4) > new_left)
                    new_left = orig_img_info(tmp_id, 4);
                end
            end
            frac_left = 0;
            for j = 1: size(left_img_id, 2)
                tmp_id = left_img_id(j);
                if (strcmp(symbol{tmp_id}, '\frac') && inThreshold(orig_img_info, new_id, tmp_id)...
                        && (orig_img_info(tmp_id, 1) > orig_img_info(new_id, 2) ...
                        || orig_img_info(tmp_id, 2) < orig_img_info(new_id, 1) ))
                    frac_left = orig_img_info(tmp_id, 3);
                    
                end
            end
            if (frac_left >= new_left)
                new_left = frac_left + 1;
            end
        else
            new_left = orig_img_info(new_id, 3);
        end
        if (new_left < left_most)
            best = i;
            left_most = new_left;
            id = new_id;
        end
    end
end
