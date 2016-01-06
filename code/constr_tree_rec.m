function [root, left_img_id] = constr_tree_rec(model_sub, model_super, orig_img_info, symbol, left_img_id, root)
    num_img = size(left_img_id, 2);
    if (root.img_id == 4)
        root.img_id = 4;
    end
    if (num_img ~= 0)
        if (strcmp(symbol{root.img_id}, '\frac'))
            % numerator
            [numerator_img_id, left_img_id] = find_numerator_symbol(left_img_id, orig_img_info, root.img_id);
            new_root = constr_tree_frac(model_sub, model_super, orig_img_info, numerator_img_id, symbol);
            root.has_super = true;
            root.super = new_root;
            % denominator
            [denominator_img_id, left_img_id] = find_denominator_symbol(left_img_id, orig_img_info, root.img_id);
            new_root = constr_tree_frac(model_sub, model_super, orig_img_info, denominator_img_id, symbol);
            root.has_sub = true;
            root.sub = new_root;
        else
            i = 1;
            while (true)
                if (i > size(left_img_id, 2))
                    break;
                end
                if (root.img_id == 2)
                    root.img_id = 2;
                end
                if (left_img_id(i) == 13)
                    left_img_id(i) = 13;
                end
                if (inThreshold(orig_img_info, root.img_id, left_img_id(i)))
                    pos = cal_relative_pos(orig_img_info, model_sub, model_super, root.img_id, left_img_id(i));
                    new_root = TreeNode(left_img_id(i));
                    left_img_id(i) = [];
                    i = i - 1;
                    if (pos == 1)
                        root.has_super = true;
                    elseif (pos == -1)
                        root.has_sub = true;
                    else
                        % new_root is on the left of root
                        if (orig_img_info(root.img_id, 3) > orig_img_info(new_root.img_id, 3))
                            root.has_left = true;
                            new_root.has_right = true;
                        else
                            root.has_right = true;
                        end
                    end
                    
                    
                    [new_root, left_img_id] = constr_tree_rec(model_sub, model_super, orig_img_info, symbol, left_img_id, new_root);
                    if (new_root.img_id == 6)
                        new_root.img_id = 6;
                    end
                    if (pos == 1)
                        root.super = new_root;
                        root.has_super = true;
                    elseif (pos == -1)
                        root.sub = new_root;
                        root.has_sub = true;
                    else
                        % new_root is on the left of root
                        if (orig_img_info(root.img_id, 3) > orig_img_info(new_root.img_id, 4))
                            root.left = new_root;
                            root.has_left = true;
                            new_root.right = root;
                            new_root.has_right = true;
                        else
                            root.right = new_root;
                            root.has_right = true;
                        end
                    end
                end
                i = i + 1;
            end
        end
        %if (root.has_left && root.has_right)
        %    root = reconstruct_tree(root);
        %end
        if (root.has_right == false && ~isempty(left_img_id))
            left_most_id = get_left_most(orig_img_info, left_img_id, symbol);
            pos = cal_relative_pos(orig_img_info, model_sub, model_super, root.img_id, left_img_id(left_most_id));
            if (pos == 0)
                new_root = TreeNode(left_img_id(left_most_id));
                left_img_id(left_most_id) = [];
                [new_root, left_img_id] = constr_tree_rec(model_sub, model_super, orig_img_info, symbol, left_img_id, new_root);
                root.right = new_root;
                root.has_right = true;
            end
        end
    end
end