feature_p = zeros(11, 4);
label_sub = zeros(11, 1);
for i = 1: 11
    feature_p(i, :) = getfeature_super(feature_train(i, 1), feature_train(i, 2), feature_train(i, 3), feature_train(i, 4)); 
    if label(i) == -1
        label_sub(i) = 1;
    else
        label_sub(i) = 0;
    end
end

