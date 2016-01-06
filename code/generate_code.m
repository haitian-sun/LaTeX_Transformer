function latex_code = generate_code(root_array, symbol)
    latex_code = '';
    num_root = size(root_array, 2);
    for i = 1 : num_root
        root = root_array(i);
        latex_code = strcat(latex_code, traverse(root, symbol));
    end
end

function latex_code = traverse(root, symbol)
    if (root.has_left && root.has_right)
        root = reconstruct_tree(root);
    end
    latex_code = symbol{root.img_id};
    isfrac = strcmp(latex_code, '\frac');
    if (root.has_super)
        code_super = traverse(root.super, symbol);
        if (~isfrac)
            latex_code = strcat(latex_code, '^');
        end
        latex_code = strcat(latex_code, '{', code_super, '}');
    end
    if (root.has_sub)
        code_sub = traverse(root.sub, symbol);
        if (~isfrac)
            latex_code = strcat(latex_code, '_');
        end
        latex_code = strcat(latex_code, '{', code_sub, '}');
    end
    if (root.has_right)
        code_right = traverse(root.right, symbol);
        latex_code = strcat(latex_code, code_right);
    end
end