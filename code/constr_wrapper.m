field1 = 'img_id'; value1 = 0;
field2 = 'sub'; value2 = 0;
field3 = 'super'; value3 = 0;
field4 = 'right'; value4 = 0;
field5 = 'has_right'; value5 = false;

new_node = struct(field1, value1, field2, value2, field3, value3, field4, value4, field5, value5);

left_img_id = 2 : 4;
root = new_node;
root.img_id = 1;
[root, left_img_id] = constr_tree_rec(model_sub, model_super, formula2, left_img_id, new_node, root);
