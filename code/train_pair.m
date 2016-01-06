feature_mat = gen_feature_mat();

load('data/pair_train/pair_label.mat');
% the name of label is pair

label_super = (pair > 0);
label_sub = (pair < 0);

model_super_new = svmtrain(feature_mat, label_super);

model_sub_new = svmtrain(feature_mat, label_sub);

save('model_super_new.mat', 'model_super_new');
save('model_sub_new.mat', 'model_sub_new');

