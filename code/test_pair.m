load('model_sub_new');
load('model_super_new');

feature_mat = gen_test_feature_mat();

load('data/pair_test/pair_label.mat');
% the name of label is pair

num_test = size(pair, 1);
correct = 0;

for i = 1: num_test
    is_sub = svmclassify(model_sub_new, feature_mat(i, :));
    is_super = svmclassify(model_super_new, feature_mat(i, :));
    if (is_sub && pair(i) == -1)
        correct = correct + 1;
    elseif (is_super && pair(i) == 1)
        correct = correct + 1;
    elseif (~is_sub && ~is_super && pair(i) == 0)
        correct = correct + 1;
    else
        fprintf('%d\n', i);
    end
end

fprintf('Relative Position Accuracy: %f', correct / num_test);

