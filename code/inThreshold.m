function in = inThreshold(img_info, dominant, child)
    threshold = 0.25;
    
    dom_top = img_info(dominant, 1);
    dom_bottom = img_info(dominant, 2);
    dom_left = img_info(dominant, 3);
    dom_right = img_info(dominant, 4);
    
    %center_tb = (dom_top + dom_bottom) / 2;
    %center_lr = (dom_left + dom_right) / 2;
    
    padding = sqrt((dom_bottom - dom_top) * (dom_right - dom_left)) + 0.3 * max(dom_bottom - dom_top, dom_right - dom_left);
    
    thres_top = dom_top - threshold * padding;
    thres_bottom = dom_bottom + threshold * padding;
    thres_left = dom_left - threshold * padding;
    thres_right = dom_right + threshold * padding;
    
    child_top = img_info(child, 1);
    child_bottom = img_info(child, 2);
    child_left = img_info(child, 3);
    child_right = img_info(child, 4);
    
    if (thres_top < child_bottom && child_top < thres_bottom && thres_left < child_right && child_left < thres_right)
        in = true;
    else
        in = false;
    end
    
end