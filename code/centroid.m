function c = centroid(m)
    sum_weight = 0;
    height = size(centroid, 1);
    for i = 1: height
        sum_weight = sum_weight + i * sum(m(i, :));
    end
    c = sum_weight / height;
end