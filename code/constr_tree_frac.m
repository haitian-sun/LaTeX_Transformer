function root = constr_tree_frac(model_sub, model_super, orig_img_info, left_img_id, symbol)
    
    left_most_id = get_left_most(orig_img_info, left_img_id, symbol);
    root = TreeNode(left_img_id(left_most_id));
    left_img_id(left_most_id) = [];
    [root, left_img_id] = constr_tree_rec(model_sub, model_super, orig_img_info, symbol, left_img_id, root);
        

end

