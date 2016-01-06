function feature_vec = getfeature_super(A_top, A_bottom, B_top, B_bottom)
    global_bottom = max(A_bottom, B_bottom);
    global_top = min(A_top, B_top);
    global_height = global_bottom - global_top;
    B_top_pos = (B_top - global_top) / global_height;
    B_bottom_pos = (B_bottom - global_top) / global_height;
    A_top_pos = (A_top - global_top) / global_height;
    A_bottom_pos = (A_bottom - global_top) / global_height;
    feature_vec = [A_top_pos, A_bottom_pos, B_top_pos, B_bottom_pos];
end