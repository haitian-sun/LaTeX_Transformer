function feature_mat = gen_feature_mat()
    load('data/pair_train/pair_label.mat');
    num_train_data = size(pair, 1);
    feature_mat = zeros(num_train_data, 4);
    %addpath('pair_train/data');
    for i = 1 : num_train_data
        filename = sprintf('data/pair_train/data/%d.png', i);
        [pic, coord] = get_symbols(filename);
        feature_vec = getfeature_super(coord(1, 1), coord(1, 2), coord(2, 1), coord(2, 2));
        feature_mat(i, :) = feature_vec;
    end
end
