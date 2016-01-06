function root_array = constr_tree(model_sub, model_super, orig_img_info, symbol)
    left_img_id = 1 : size(orig_img_info, 1);
    num_root = 0;
    while (size(left_img_id, 2))
        left_most_id = get_left_most(orig_img_info, left_img_id, symbol);
        root = TreeNode(left_img_id(left_most_id));
        left_img_id(left_most_id) = [];
        [root, left_img_id] = constr_tree_rec(model_sub, model_super, orig_img_info, symbol, left_img_id, root);
        num_root = num_root + 1;
        root_array(num_root) = root;
    end

end

