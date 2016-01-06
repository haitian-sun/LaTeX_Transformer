function [new_symbol] = get_set(filename)
    addpath(genpath(fullfile('tmp')));
    addpath(genpath(fullfile('classify_train')));

    im = imread(filename);
    im = im2bw(im,0.9);

    image{1} = im;
    [result, coordinate] = rough_cut(image, [1 1]);

    coordinate = [coordinate(:,1) coordinate(:,3) coordinate(:,2) coordinate(:,4)];

    imgs = cell(0);
    boundries = zeros(0,4);

    for i = 1:size(result,2)
        % segmentation code here
        [new_result, result_boundries] = deep_cut(result{i}, coordinate(i,:));
        imgs = [imgs new_result];
        result_boundries = [result_boundries(:,1) result_boundries(:,3) result_boundries(:,2) result_boundries(:,4)];
        boundries = [boundries; result_boundries];
    end
    coordinate = [boundries(:,1) boundries(:,3) boundries(:,2) boundries(:,4)];
    [new_symbol coordinate] = combine_equal_sign(imgs,coordinate,im); 
end

















