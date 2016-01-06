function copy_tree_node(node, new_node)
    new_node.img_id = node.img_id;
    new_node.right = node.right;
    new_node.super = node.super;
    new_node.sub = node.sub;
    new_node.has_right = node.has_right;
    new_node.has_super = node.has_super;
    new_node.has_sub = node.has_sub;

end