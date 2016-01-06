function root = reconstruct_tree(root)
    prev_node = root;
    while (prev_node.has_left)
        cur_node = prev_node.left;
        prev_node.has_left = false;
        prev_node = cur_node;
    end
    root = prev_node;
end