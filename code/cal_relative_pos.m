function relative_pos = cal_relative_pos(info_vec, model_sub, model_super, dominant, child)
    % subscript: -1, superscript: 1, right: 0
    normalized_feature = getfeature_super(info_vec(dominant, 1), info_vec(dominant, 2), info_vec(child, 1), info_vec(child, 2));
    issub = svmclassify(model_sub, normalized_feature);
    issuper = svmclassify(model_super, normalized_feature);
    if (issub)
        relative_pos = -1;
    elseif (issuper)
        relative_pos = 1;
    else
        relative_pos = 0;
    end
end